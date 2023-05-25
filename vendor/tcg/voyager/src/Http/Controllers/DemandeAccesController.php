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
use App\DemandeAcce;
use App\ReponseDemandeAcce;
use App\Citoyen;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
//use App\Http\Controllers\Controller;
class DemandeAccesController extends Controller
{
    use BreadRelationshipParser;

    public function EtatDemandeAcces(Request $request, $id)
    {
        $curTime = new \DateTime();
        $slug = $this->getSlug($request);
        //$CurrentUser = auth()->user();
        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();
         // Check permission
        //$this->authorize('delete', app($dataType->model_name));
        $marquerNonSatisfaite =$request->MarquerNonSatisfaite;
        $DemandeAcces = DemandeAcce::where('id', $id)->first();
        //En attente
        //dd( $marquerNonSatisfaite);
        if($marquerNonSatisfaite=="1")
        {
            $DemandeAcces->EtatDemande =2;
        }
        else {
            $DemandeAcces->EtatDemande =1;
        }
        $DemandeAcces->save();
        $message ="";
        if($marquerNonSatisfaite=="1")
        {
            $message="La demande a étée rejetée avec succées";
        }
        else {
            $message="La demande a étée confirmée avec succées";
        }
        $data=[
                'message'    => $message,
                'alert-type' => 'success',
            ];
        return redirect()->route("voyager.{$dataType->slug}.index")->with($data);
    }
    /*********************************************************
                   Consulter DemandeAcces
    **********************************************************/
    public function ConsulterDemande(Request $request, $id)
    {
        $slug = $this->getSlug($request);
        //dd($slug);
        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();
        $DemandeAcces = DemandeAcce::where('id', $id)->first();
        $idCitoyen=$DemandeAcces->IdDemandeur;
        $citoyen = Citoyen::where('id', $idCitoyen)->first();
        $ListReponseDemandeAcces = ReponseDemandeAcce::where('Id_demandeacces', $id)->get();
        //dd($DemandeAcces);
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
        return Voyager::view($view, compact('dataType', 'dataTypeContent', 'isModelTranslatable', 'isSoftDeleted','DemandeAcces','ListReponseDemandeAcces','citoyen'));
    }
    /*********************************************************
                   Répondre DemandeAcces
    **********************************************************/
    public function RepondreDemandeAcces(Request $request)
    {
        $slug = $this->getSlug($request);
        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();
        $CurrentUser = auth()->user();
        $curTime = new \DateTime();
        $expiditeur=$CurrentUser->name;
        $idDemandeAcc=$request->DemandeAcc;
        
        $texte=$request->Info;
        $nvreponse = ReponseDemandeAcce::create([
            'Id_demandeacces' => $idDemandeAcc,
            'TextReponse' => $texte,
            'Expediteur' => $expiditeur,
            'Lu' => 0,
            'DateReponse' => date('Y-m-d H:i:s'),
        ]);
$PiecesJointes="";
$list_fichiers=array();
$string_fichiers="[";

   if ($files = $request->file('PiecesJointes')) {
       	// Define upload path
            $destinationPath = public_path('/uploads-citoyen/reponses-demande-access/'.$nvreponse->id); // upload path
           
            foreach($files as $file) {
				// Upload Orginal Image           
	           $piece =$file->getClientOriginalName();
	           $file->move($destinationPath, $piece);
                array_push($list_fichiers,"/uploads-citoyen/reponses-demande-access/". $nvreponse->id ."/".$piece);
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

}