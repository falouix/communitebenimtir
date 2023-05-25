<?php

namespace TCG\Voyager\Http\Controllers;

use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use TCG\Voyager\Database\Schema\SchemaManager;
use TCG\Voyager\Events\BreadDataAdded;
use TCG\Voyager\Events\BreadDataDeleted;
use TCG\Voyager\Events\BreadDataRestored;
use TCG\Voyager\Events\BreadDataUpdated;
use TCG\Voyager\Events\BreadImagesDeleted;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Http\Controllers\Traits\BreadRelationshipParser;
use App\MessagesPrivate;
use App\ReponseMessagesPrivate;
use App\Citoyen;
use App\ReponseReclamation;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
//use App\Http\Controllers\Controller;
class MessagePriveeController extends Controller
{
    use BreadRelationshipParser;

    /*********************************************************
                   Consulter Message privee
    **********************************************************/
    public function ConsulterMessage(Request $request, $id)
    {
        $slug = $this->getSlug($request);
        //dd($slug);
        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();
        $idMessagPrivee=$id;
        $MessagPrivee = MessagesPrivate::where('id', $idMessagPrivee)->first();
        $ListReponseMessagPrivee = ReponseMessagesPrivate::where('id_message_prive', $idMessagPrivee)->get();
        //dd($reclamation);
        $slug = $this->getSlug($request);
        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();
        $isSoftDeleted = false;

        if (strlen($dataType->model_name) != 0) {
            $model = app($dataType->model_name);

            // Use withTrashed() if model uses SoftDeletes and if toggle is selected
            if ($model && in_array(SoftDeletes::class, class_uses($model))) {
                $model = $model->withTrashed();
            }
            if ($dataType->scope && $dataType->scope != '' && method_exists($model, 'scope'.ucfirst($dataType->scope))) {
                $model = $model->{$dataType->scope}();
            }
            $dataTypeContent = call_user_func([$model, 'findOrFail'], $id);
            if ($dataTypeContent->deleted_at) {
                $isSoftDeleted = true;
            }
        } else {
            // If Model doest exist, get data from table name
            $dataTypeContent = DB::table($dataType->name)->where('id', $id)->first();
        }

        // Replace relationships' keys for labels and create READ links if a slug is provided.
        $dataTypeContent = $this->resolveRelations($dataTypeContent, $dataType, true);
        //dd($dataTypeContent);
        // If a column has a relationship associated with it, we do not want to show that field
        $this->removeRelationshipField($dataType, 'read');

        // Check permission
        $this->authorize('read', $dataTypeContent);

        // Check if BREAD is Translatable
        $isModelTranslatable = is_bread_translatable($dataTypeContent);

        $view = 'voyager::bread.read';

        if (view()->exists("voyager::$slug.read")) {
            $view = "voyager::$slug.read";
        }
        return Voyager::view($view, compact('dataType', 'dataTypeContent', 'isModelTranslatable', 'isSoftDeleted','MessagPrivee','ListReponseMessagPrivee','citoyen'));
    }
    /*********************************************************
                   Répondre Reclamation
    **********************************************************/
    public function RepondreMessage(Request $request)
    {
        $slug = $this->getSlug($request);
        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();
        $CurrentUser = auth()->user();
        $curTime = new \DateTime();
        //dd($request->all());
        $expiditeur=$CurrentUser->name;
        $idrec=$request->messageprivee;

        $nvreponse = ReponseMessagesPrivate::create([
            'id_message_prive' => $idrec,
            'TextReponse' => $request->Textmessage,
            'Expediteur' => $expiditeur,
            'Lu' => 0,
            'DateReponse' => date('Y-m-d H:i:s'),
        ]);
$PiecesJointes="";
$list_fichiers=array();
$string_fichiers="[";

   if ($files = $request->file('PiecesJointes')) {
       	// Define upload path
            $destinationPath = public_path('/uploads-citoyen/reponses-messages/'.$nvreponse->id); // upload path
           
            foreach($files as $file) {
				// Upload Orginal Image           
	           $piece =$file->getClientOriginalName();
	           $file->move($destinationPath, $piece);
                array_push($list_fichiers,"/uploads-citoyen/reponses-messages/". $nvreponse->id ."/".$piece);
            }
            foreach ($list_fichiers as $fichier){
    $string_fichiers .= "\"". $fichier."\",";
 }
 
$string_fichiers=rtrim($string_fichiers, ',');
$string_fichiers .="]";
             $nvreponse->PiecesJointes=$string_fichiers;
                $nvreponse->save();

        }

        $data=[
            'message'    => "Le message a été envoyé avec succés",
            'alert-type' => 'success',
        ];
        
       
        return redirect()->route("voyager.{$dataType->slug}.index")->with($data);
    }
    public function ChercherParPeriode(Request $request)
    {
        $etat=$request->etat;
        $dat_deb=$request->dateDeb;
        $date_fin=$request->dateFin;
        $action_button="";
        $demande_total=0;
        //0
        $demande_attente=0;
        //1
        $demande_satisfait=0;
        //2
        $demande_rejete=0;
        //dd($date_fin);
        // GET THE SLUG, ex. 'posts', 'pages', etc.
        $slug = $this->getSlug($request);

        // GET THE DataType based on the slug
        $dataType = Voyager::model('DataType')->where('slug', '=',$slug)->first();

        // Check permission
        $this->authorize('publish', app($dataType->model_name));

        $getter = $dataType->server_side ? 'paginate' : 'get';

        $search = (object) ['value' => $request->get('s'), 'key' => $request->get('key'), 'filter' => $request->get('filter')];
        $searchable = $dataType->server_side ? array_keys(SchemaManager::describeTable(app($dataType->model_name)->getTable())->toArray()) : '';
        $orderBy = $request->get('order_by', $dataType->order_column);
        $sortOrder = $request->get('sort_order', null);
        $usesSoftDeletes = false;
        $showSoftDeleted = false;
        $orderColumn = [];
        if ($orderBy) {
            $index = $dataType->browseRows->where('field', $orderBy)->keys()->first() + 1;
            $orderColumn = [[$index, 'desc']];
            if (!$sortOrder && isset($dataType->order_direction)) {
                $sortOrder = $dataType->order_direction;
                $orderColumn = [[$index, $dataType->order_direction]];
            } else {
                $orderColumn = [[$index, 'desc']];
            }
        }

        // Next Get or Paginate the actual content from the MODEL that corresponds to the slug DataType
            
           
            if (strlen($dataType->model_name) != 0) {
            $model = app($dataType->model_name);
    switch ($request->input('action')) {
        case 'rechercher':
            if ($dataType->scope && $dataType->scope != '' && method_exists($model, 'scope'.ucfirst($dataType->scope) )) {
                $query = $model->{$dataType->scope}();
            } elseif ( $etat=="3" && empty($dat_deb) &&  empty($date_fin)) {
               $query = $model::select('*');
            }
            elseif($etat=="3" && !empty($dat_deb) &&  !empty($date_fin)) {
                $query =$model::whereBetween('DateDemande', [$dat_deb, $date_fin]);
            }
            elseif($etat!="3" && empty($dat_deb) &&  empty($date_fin)) {
                $query =$model::where('EtatDemande','=',$etat) ;
            }
            else {
                 $query =$model::whereBetween('DateDemande', [$dat_deb, $date_fin])
                                ->where('EtatDemande','=',$etat) ;
            }
        break;
        case 'stat': 
            $action_button="stat";
              if ($dataType->scope && $dataType->scope != '' && method_exists($model, 'scope'.ucfirst($dataType->scope) )) {
                $query = $model->{$dataType->scope}();
            } elseif ( $etat=="3" && empty($dat_deb) &&  empty($date_fin)) {
               $query = $model::select('*');
            }
            elseif($etat=="3" && !empty($dat_deb) &&  !empty($date_fin)) {
                $query =$model::whereBetween('DateDemande', [$dat_deb, $date_fin]);
            }
            elseif($etat!="3" && empty($dat_deb) &&  empty($date_fin)) {
                $query =$model::where('EtatDemande','=',$etat) ;
            }
            else {
                 $query =$model::whereBetween('DateDemande', [$dat_deb, $date_fin])
                                ->where('EtatDemande','=',$etat) ;
            }
           
            
            $demande_total=$model::whereBetween('DateDemande', [$dat_deb, $date_fin])->count();
            $demande_attente=$model::whereBetween('DateDemande', [$dat_deb, $date_fin])
                                   ->where('EtatDemande','=',0)->count();          
            $demande_satisfait=$model::whereBetween('DateDemande', [$dat_deb, $date_fin])
                                   ->where('EtatDemande','=',1)->count();
            $demande_rejete=$model::whereBetween('DateDemande', [$dat_deb, $date_fin])
                                   ->where('EtatDemande','=',2)->count();
            
    }
        /*}*/
            // Use withTrashed() if model uses SoftDeletes and if toggle is selected
            if ($model && in_array(SoftDeletes::class, class_uses($model)) && app('VoyagerAuth')->user()->can('delete', app($dataType->model_name))) {
                $usesSoftDeletes = true;

                if ($request->get('showSoftDeleted')) {
                    $showSoftDeleted = true;
                    $query = $query->withTrashed();
                }
            }

            // If a column has a relationship associated with it, we do not want to show that field
            $this->removeRelationshipField($dataType, 'browse');

            if ($search->value != '' && $search->key && $search->filter) {
                $search_filter = ($search->filter == 'equals') ? '=' : 'LIKE';
                $search_value = ($search->filter == 'equals') ? $search->value : '%'.$search->value.'%';
                $query->where($search->key, $search_filter, $search_value);
            }

            if ($orderBy && in_array($orderBy, $dataType->fields())) {
                $querySortOrder = (!empty($sortOrder)) ? $sortOrder : 'desc';
                $dataTypeContent = call_user_func([
                    $query->orderBy($orderBy, $querySortOrder),
                    $getter,
                ]);
            } elseif ($model->timestamps) {
                $dataTypeContent = call_user_func([$query->latest($model::CREATED_AT), $getter]);
            } else {
                $dataTypeContent = call_user_func([$query->orderBy($model->getKeyName(), 'DESC'), $getter]);
            }

            // Replace relationships' keys for labels and create READ links if a slug is provided.
            $dataTypeContent = $this->resolveRelations($dataTypeContent, $dataType);
        } else {
            // If Model doesn't exist, get data from table name
            $dataTypeContent = call_user_func([DB::table($dataType->name), $getter]);
            $model = false;
        }
    
        

        // Check if BREAD is Translatable
        if (($isModelTranslatable = is_bread_translatable($model))) {
            $dataTypeContent->load('translations');
        }
        //dd($dataTypeContent);
        // Check if server side pagination is enabled
        $isServerSide = isset($dataType->server_side) && $dataType->server_side;

        // Check if a default search key is set
        $defaultSearchKey = $dataType->default_search_key ?? null;

        $view = $view = "voyager::$slug.browse";

        /*if (view()->exists("voyager::$slug.Archive")) {
            $view = "voyager::$slug.Archive";
        }*/
        return Voyager::view($view, compact(
            'dataType',
            'dataTypeContent',
            'isModelTranslatable',
            'search',
            'orderBy',
            'orderColumn',
            'sortOrder',
            'searchable',
            'isServerSide',
            'defaultSearchKey',
            'usesSoftDeletes',
            'showSoftDeleted',
            'demande_total',
            'demande_attente',
            'demande_satisfait',
            'demande_rejete',
            'action_button'
        ));

    }
}