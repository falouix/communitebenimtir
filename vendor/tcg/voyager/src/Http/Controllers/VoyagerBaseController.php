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
use App\Citoyen;
use App\ArticlePiecesJointe;
use App\ListArticle;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Hash;

class VoyagerBaseController extends Controller
{
    use BreadRelationshipParser;

    //***************************************
    //               ____
    //              |  _ \
    //              | |_) |
    //              |  _ <
    //              | |_) |
    //              |____/
    //
    //      Browse our Data Type (B)READ
    //
    //****************************************

    public function index(Request $request)
    {
        // GET THE SLUG, ex. 'posts', 'pages', etc.
        $slug = $this->getSlug($request);
        $publish="false";
        $archive="false";
        $NonConcerneModels=['citoyens'=>"citoyens",
            'demande-acces'=>"demande-acces",
            'messages-privates'=>"messages-privates",
            'permissions'=>"permissions",
            'reclamation'=>"reclamation",
            'reclamations'=>"reclamations",
            'reponse-demande-acces'=>"reponse-demande-acces",
            'reponse-messages-privates'=>"reponse-messages-privates",
            'reponse-reclamations'=>"reponse-reclamations",
            'demande-docs'=>"demande-docs",
            'type-docs'=>"type-docs",
            'accueil-composants'=>"accueil-composants",
            'roles'=>"roles",
            'users'=>"users",
            'menus'=>"menus",
            'denonciations'=>"denonciations"];
            $action_button="";
        $demande_total=0;
        //0
        $demande_attente=0;
        //1
        $demande_satisfait=0;
        //2
        $demande_rejete=0;
        $findslug=array_key_exists($slug, $NonConcerneModels);
        // GET THE DataType based on the slug
        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Check permission
        $this->authorize('browse', app($dataType->model_name));
        $nbreEnAttente=0;

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
            //dd($dataType->model_name);
            if($findslug==false){


            $archive=$request->input('archive');
                if($archive=="true")
                {
                    //if($this->validateArchive($request))
                    $request->validate([
                                 'date_deb' => 'required',
                                 'date_fin' => 'required',
                                     ]);
                    $date_deb = $request->input('date_deb');
                    $date_fin = $request->input('date_fin');
                    //$query = $model::where('status','=','PUBLISHED');
                    //$ListActulaites= $model::whereBetween('created_at',[$date_deb,$date_fin])->get();
                    //dd($ListActulaites);
                    $Listac= $model::whereBetween('created_at',[$date_deb,$date_fin])->update(['status' => "ARCHIVE",'modifierPar'=>auth()->user()->id]);
                    //$this->archiV($date_deb,$date_fin);
                    //$queryArchive = $model::where('status','=','ARCHIVE');
                }
                $publish=$request->input('PUBLISH');
                if($publish=="true")
                {
                    // Check permission
                    $this->authorize('publish', app($dataType->model_name));

                // Init array of IDs
                $listIds = $request->input('ids');
        $ids = [];
        if (!empty($listIds)) {
            // Bulk publish, get IDs from POST
            $ids = explode(',', $listIds);
        }
        foreach ($ids as $id) {
            $curTime = new \DateTime();
            $published_at = $curTime->format("Y-m-d H:i:s");
            $Listac= $model::where('id',$id)->update(['status' => "PUBLISHED",'approuverPar'=>auth()->user()->id,'approuverLe'=>$published_at]);
        }
    }
            if ($dataType->scope && $dataType->scope != '' && method_exists($model, 'scope'.ucfirst($dataType->scope))) {
                $query = $model->{$dataType->scope}();
            } else {
                //$query = $model::select('*');

                $query = $model::where('status','not like','%ARCHIVE%')
                                ->where('status','not like','%ATTENTE%');
            }
            }else{
                 if ($dataType->scope && $dataType->scope != '' && method_exists($model, 'scope'.ucfirst($dataType->scope))) {
                $query = $model->{$dataType->scope}();
            } else {
                $query = $model::select('*');

            }
            }
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

        $view = 'voyager::bread.browse';

        if (view()->exists("voyager::$slug.browse")) {
            $view = "voyager::$slug.browse";
        }
        $nbreEnAttente=0;

        if(!$findslug){
        $nbreEnAttente=$model::where('status', '=', 'ATTENTE')
                        ->count();
                    }
                        if($publish=="true"){
return redirect()
        ->route("voyager.{$dataType->slug}.index")
        ->with([
                'message'    => " Les éléments sélectionnés ont été publieés avec succès",
                'alert-type' => 'success',
            ]);
                        }
                        if($archive=="true"){
return redirect()
        ->route("voyager.{$dataType->slug}.index")
        ->with([
                'message'    => " L'opération a été publieés avec succès",
                'alert-type' => 'success',
            ]);
                        }

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
            'nbreEnAttente',
            'demande_total',
            'demande_attente',
            'demande_satisfait',
            'demande_rejete',
            'action_button'
        ));

    }

    //***************************************
    //                _____
    //               |  __ \
    //               | |__) |
    //               |  _  /
    //               | | \ \
    //               |_|  \_\
    //
    //  Read an item of our Data Type B(R)EAD
    //
    //****************************************

    public function show(Request $request, $id)
    {
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

        return Voyager::view($view, compact('dataType', 'dataTypeContent', 'isModelTranslatable', 'isSoftDeleted'));
    }

    //***************************************
    //                ______
    //               |  ____|
    //               | |__
    //               |  __|
    //               | |____
    //               |______|
    //
    //  Edit an item of our Data Type BR(E)AD
    //
    //****************************************

    public function edit(Request $request, $id)
    {
        $slug = $this->getSlug($request);
        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

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
        } else {
            // If Model doest exist, get data from table name
            $dataTypeContent = DB::table($dataType->name)->where('id', $id)->first();
        }

        foreach ($dataType->editRows as $key => $row) {
            $dataType->editRows[$key]['col_width'] = isset($row->details->width) ? $row->details->width : 100;
        }

        // If a column has a relationship associated with it, we do not want to show that field
        $this->removeRelationshipField($dataType, 'edit');

        // Check permission
        $this->authorize('edit', $dataTypeContent);

        // Check if BREAD is Translatable
        $isModelTranslatable = is_bread_translatable($dataTypeContent);

        $view = 'voyager::bread.edit-add';

        if (view()->exists("voyager::$slug.edit-add")) {
            $view = "voyager::$slug.edit-add";
        }

        return Voyager::view($view, compact('dataType', 'dataTypeContent', 'isModelTranslatable'));
    }

    // POST BR(E)AD
    public function update(Request $request, $id)
    {
        $slug = $this->getSlug($request);
        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Compatibility with Model binding.
        $id = $id instanceof Model ? $id->{$id->getKeyName()} : $id;

        $model = app($dataType->model_name);
        if ($dataType->scope && $dataType->scope != '' && method_exists($model, 'scope'.ucfirst($dataType->scope))) {
            $model = $model->{$dataType->scope}();
        }
        if ($model && in_array(SoftDeletes::class, class_uses($model))) {
            $data = $model->withTrashed()->findOrFail($id);
        } else {
            $data = call_user_func([$dataType->model_name, 'findOrFail'], $id);
        }

        // Check permission
        $this->authorize('edit', $data);

if($request->slug==''||$request->slug==null){
            do
{
    $nv_slug=mt_rand(100000000, 999999999);
    $result = $model::where('slug',$nv_slug);

}
while($result==null);
             $request->merge(['slug' => $nv_slug ]);
            //dd($request);
        }
        // Validate fields with ajax
        $val = $this->validateBread($request->all(), $dataType->editRows, $dataType->name, $id)->validate();
        $this->insertUpdateData($request, $slug, $dataType->editRows, $data);
if($slug=='articles'){
    //********************************************************************************************* */
    //***************************** Traitement des fichiers *************************************** */
            $fichierSupprimer=$request->fichierSupprimer;
            //dd($fichierSupprimer);
            $listsupprimer= explode(';',$fichierSupprimer);
            //dd($listsupprimer);
            foreach($listsupprimer as $fichierSupprim){
                if($fichierSupprim!=''){
                   // dd($fichierSupprim);
                    //supprimer fichier
                    $fichier=ArticlePiecesJointe::findOrFail($fichierSupprim);

            $isExists = File::exists(public_path('/storage/').$fichier->lien_fichier);
                    //dd($isExists);
            if($isExists){

                unlink(public_path('/storage/'.$fichier->lien_fichier));
                        }
                        ArticlePiecesJointe::where('id', $fichier->id)->delete();
                }


            }
            $nbrefichier=$request->nbrefichier;

            for($i = 0;$i<$nbrefichier;$i++)
            {

                $idfichier=$request["idfichier".$i];

                if($idfichier=="0"){

                    $file=$request["lienfichier".$i];
                $destinationPath = public_path('/storage/articles/'); // upload path
				// Upload Orginal Image
	           $piece =$file->getClientOriginalName();
               $file->move($destinationPath, $piece);

                ArticlePiecesJointe::create([
             'article_id' => $data->id,
            'nom_fichier' => $request["nomfichier".$i],
            'lien_fichier' => "articles/".$piece,

        ]);
                }
                else{
                    $fichier=ArticlePiecesJointe::findOrFail($idfichier);
                    $fichier->nom_fichier=$request["nomfichier".$i];
                    if($request["lienfichier".$i]!=null){
                        $isExists = File::exists(public_path('/storage/').$fichier->lien_fichier);
                    //dd($isExists);
            if($isExists){

                unlink(public_path('/storage/'.$fichier->lien_fichier));
                        }
                         $file=$request["lienfichier".$i];
                $destinationPath = public_path('/storage/articles/'); // upload path
				// Upload Orginal Image
	           $piece =$file->getClientOriginalName();
               $file->move($destinationPath, $piece);
               $fichier->lien_fichier="articles/".$piece;

                }
                $fichier->save();
                    }
                }

               //********************************************************************************************* */
            //********************************************************************************************* */
            //********************************************************************************************* */
            //***************************** Traitement des multi pages dans un article ******************** */
            $pagesSupprimer=$request->pagesSupprimer;
            $listpagesupprimer= explode(';',$pagesSupprimer);
            foreach($listpagesupprimer as $pageSupprim){
                if($pageSupprim!=''){
                    //supprimer fichier
                        ListArticle::where('id', $pageSupprim)->delete();
                }


            }
            $nbrepages=$request->nbrepages;
            for($i = 0;$i<$nbrepages;$i++)
            {

                $idpage=$request["idpage".$i];
                $nv_page=$request["nv-page".$i];
                if($nv_page=="1"){

                ListArticle::create([
            'article_id' => $data->id,
            'id_article_fils' => $idpage,
        ]);
                }
                }


            //********************************************************************************************* */
            //********************************************************************************************* */

            }
        event(new BreadDataUpdated($dataType, $data));

        return redirect()
        ->route("voyager.{$dataType->slug}.index")
        ->with([
            'message'    => __('voyager::generic.successfully_updated')." {$dataType->display_name_singular}",
            'alert-type' => 'success',
        ]);

    }

    //***************************************
    //
    //                   /\
    //                  /  \
    //                 / /\ \
    //                / ____ \
    //               /_/    \_\
    //
    //
    // Add a new item of our Data Type BRE(A)D
    //
    //****************************************

    public function create(Request $request)
    {
        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Check permission
        $this->authorize('add', app($dataType->model_name));

        $dataTypeContent = (strlen($dataType->model_name) != 0)
                            ? new $dataType->model_name()
                            : false;

        foreach ($dataType->addRows as $key => $row) {
            $dataType->addRows[$key]['col_width'] = $row->details->width ?? 100;
        }

        // If a column has a relationship associated with it, we do not want to show that field
        $this->removeRelationshipField($dataType, 'add');

        // Check if BREAD is Translatable
        $isModelTranslatable = is_bread_translatable($dataTypeContent);

        $view = 'voyager::bread.edit-add';

        if (view()->exists("voyager::$slug.edit-add")) {
            $view = "voyager::$slug.edit-add";
        }

        return Voyager::view($view, compact('dataType', 'dataTypeContent', 'isModelTranslatable'));
    }

    /**
     * POST BRE(A)D - Store data.
     *
     * @param \Illuminate\Http\Request $request
     *
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(Request $request)
    {
        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Check permission
        $this->authorize('add', app($dataType->model_name));
        if($request->slug==''||$request->slug==null){
            do
{
    $model = app($dataType->model_name);
    $nv_slug=mt_rand(100000000, 999999999);
    $result = $model::where('slug',$nv_slug);

}
while($result==null);
             $request->merge(['slug' => $nv_slug ]);
            //dd($request);
            if($slug=='citoyens'){
          //  dd($dataType);
          $request->merge (['password' =>  Hash::make($request['CIN']) ] );
        }
        }
        // Validate fields with ajax
        $val = $this->validateBread($request->all(), $dataType->addRows)->validate();
        
        $data = $this->insertUpdateData($request, $slug, $dataType->addRows, new $dataType->model_name());
        
if($slug=='articles'){
    //********************************************************************************************* */
    //***************************** Traitement des fichiers *************************************** */
            $fichierSupprimer=$request->fichierSupprimer;
            //dd($fichierSupprimer);
            $listsupprimer= explode(';',$fichierSupprimer);
            //dd($listsupprimer);
            foreach($listsupprimer as $fichierSupprim){
                if($fichierSupprim!=''){
                   // dd($fichierSupprim);
                    //supprimer fichier
                    $fichier=ArticlePiecesJointe::findOrFail($fichierSupprim);
            $isExists = File::exists(public_path('/storage/').$fichier->lien_fichier);
                    //dd($isExists);
            if($isExists){

                unlink(public_path('/storage/'.$fichier->lien_fichier));
                        }
                        ArticlePiecesJointe::where('id', $fichier->id)->delete();
                }


            }
            $nbrefichier=$request->nbrefichier;
            for($i = 0;$i<$nbrefichier;$i++)
            {

                $idfichier=$request["idfichier".$i];
                if($idfichier=="0"){

                    $file=$request["lienfichier".$i];
                $destinationPath = public_path('/storage/articles/'); // upload path
				// Upload Orginal Image
	           $piece =$file->getClientOriginalName();
               $file->move($destinationPath, $piece);

               //dd($id_article);
                ArticlePiecesJointe::create([
            'article_id' => $data->id,
            'nom_fichier' => $request["nomfichier".$i],
            'lien_fichier' => "articles/".$piece,
        ]);

                }
                else{
                    $fichier=ArticlePiecesJointe::findOrFail($idfichier);

                    $fichier->nom_fichier=$request["nomfichier".$i];
                    if($request["lienfichier".$i]!=null){
                        $isExists = File::exists(public_path('/storage/').$fichier->lien_fichier);
                    //dd($isExists);
            if($isExists){

                unlink(public_path('/storage/'.$fichier->lien_fichier));
                        }
                         $file=$request["lienfichier".$i];
                $destinationPath = public_path('/storage/articles/'); // upload path
				// Upload Orginal Image
	           $piece =$file->getClientOriginalName();
               $file->move($destinationPath, $piece);
               $fichier->nom_fichier="articles/".$piece;

                }
                $fichier->save();
                    }
                }


            //********************************************************************************************* */
            //********************************************************************************************* */
            //********************************************************************************************* */
            //***************************** Traitement des multi pages dans un article ******************** */
            $pagesSupprimer=$request->pagesSupprimer;
            $listpagesupprimer= explode(';',$pagesSupprimer);
            foreach($listpagesupprimer as $pageSupprim){
                if($pageSupprim!=''){
                    //supprimer fichier
                        ListArticle::where('id', $pageSupprim)->delete();
                }


            }
            $nbrepages=$request->nbrepages;
            for($i = 0;$i<$nbrepages;$i++)
            {

                $idpage=$request["idpage".$i];
                $nv_page=$request["nv-page".$i];
                if($nv_page=="1"){

                ListArticle::create([
            'article_id' => $data->id,
            'id_article_fils' => $idpage,
        ]);
                }
                }


            //********************************************************************************************* */
            //********************************************************************************************* */
            }
        event(new BreadDataAdded($dataType, $data));

        return redirect()
        ->route("voyager.{$dataType->slug}.index")
        ->with([
                'message'    => __('voyager::generic.successfully_added_new')." {$dataType->display_name_singular}",
                'alert-type' => 'success',
            ]);
    }

    //***************************************
    //                _____
    //               |  __ \
    //               | |  | |
    //               | |  | |
    //               | |__| |
    //               |_____/
    //
    //         Delete an item BREA(D)
    //
    //****************************************

    public function destroy(Request $request, $id)
    {
        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Check permission
        $this->authorize('delete', app($dataType->model_name));

        // Init array of IDs
        $ids = [];
        if (empty($id)) {
            // Bulk delete, get IDs from POST
            $ids = explode(',', $request->ids);
        } else {
            // Single item delete, get ID from URL
            $ids[] = $id;
        }
        foreach ($ids as $id) {
            $data = call_user_func([$dataType->model_name, 'findOrFail'], $id);

            $model = app($dataType->model_name);
            if (!($model && in_array(SoftDeletes::class, class_uses($model)))) {
                $this->cleanup($dataType, $data);
                if($slug=="articles"){
                    $list_pieces_jointes=ArticlePiecesJointe::where('article_id','=',$id)->get();
                    foreach($list_pieces_jointes as $fichier){
                        $isExists = File::exists(public_path('/storage/').$fichier->lien_fichier);
                    //dd($isExists);
            if($isExists){

                unlink(public_path('/storage/'.$fichier->lien_fichier));
                        }
                    }
                    ArticlePiecesJointe::where('article_id', $id)->delete();
                }
            }
        }

        $displayName = count($ids) > 1 ? $dataType->display_name_plural : $dataType->display_name_singular;

        $res = $data->destroy($ids);

        $data = $res
            ? [
                'message'    => __('voyager::generic.successfully_deleted')." {$displayName}",
                'alert-type' => 'success',
            ]
            : [
                'message'    => __('voyager::generic.error_deleting')." {$displayName}",
                'alert-type' => 'error',
            ];

        if ($res) {
            event(new BreadDataDeleted($dataType, $data));
        }

        return redirect()->route("voyager.{$dataType->slug}.index")->with($data);
    }

    public function restore(Request $request, $id)
    {
        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Check permission
        $this->authorize('delete', app($dataType->model_name));

        // Get record
        $model = call_user_func([$dataType->model_name, 'withTrashed']);
        if ($dataType->scope && $dataType->scope != '' && method_exists($model, 'scope'.ucfirst($dataType->scope))) {
            $model = $model->{$dataType->scope}();
        }
        $data = $model->findOrFail($id);

        $displayName = $dataType->display_name_singular;

        $res = $data->restore($id);
        $data = $res
            ? [
                'message'    => __('voyager::generic.successfully_restored')." {$displayName}",
                'alert-type' => 'success',
            ]
            : [
                'message'    => __('voyager::generic.error_restoring')." {$displayName}",
                'alert-type' => 'error',
            ];

        if ($res) {
            event(new BreadDataRestored($dataType, $data));
        }

        return redirect()->route("voyager.{$dataType->slug}.index")->with($data);
    }

    /**
     * Remove translations, images and files related to a BREAD item.
     *
     * @param \Illuminate\Database\Eloquent\Model $dataType
     * @param \Illuminate\Database\Eloquent\Model $data
     *
     * @return void
     */
    protected function cleanup($dataType, $data)
    {
        // Delete Translations, if present
        if (is_bread_translatable($data)) {
            $data->deleteAttributeTranslations($data->getTranslatableAttributes());
        }

        // Delete Images
        $this->deleteBreadImages($data, $dataType->deleteRows->where('type', 'image'));

        // Delete Files
        foreach ($dataType->deleteRows->where('type', 'file') as $row) {
            if (isset($data->{$row->field})) {
                foreach (json_decode($data->{$row->field}) as $file) {
                    $this->deleteFileIfExists($file->download_link);
                }
            }
        }

        // Delete media-picker files
        $dataType->rows->where('type', 'media_picker')->where('details.delete_files', true)->each(function ($row) use ($data) {
            $content = $data->{$row->field};
            if (isset($content)) {
                if (!is_array($content)) {
                    $content = json_decode($content);
                }
                if (is_array($content)) {
                    foreach ($content as $file) {
                        $this->deleteFileIfExists($file);
                    }
                } else {
                    $this->deleteFileIfExists($content);
                }
            }
        });
    }

    /**
     * Delete all images related to a BREAD item.
     *
     * @param \Illuminate\Database\Eloquent\Model $data
     * @param \Illuminate\Database\Eloquent\Model $rows
     *
     * @return void
     */
    public function deleteBreadImages($data, $rows)
    {
        foreach ($rows as $row) {
            if ($data->{$row->field} != config('voyager.user.default_avatar')) {
                $this->deleteFileIfExists($data->{$row->field});
            }

            if (isset($row->details->thumbnails)) {
                foreach ($row->details->thumbnails as $thumbnail) {
                    $ext = explode('.', $data->{$row->field});
                    $extension = '.'.$ext[count($ext) - 1];

                    $path = str_replace($extension, '', $data->{$row->field});

                    $thumb_name = $thumbnail->name;

                    $this->deleteFileIfExists($path.'-'.$thumb_name.$extension);
                }
            }
        }

        if ($rows->count() > 0) {
            event(new BreadImagesDeleted($data, $rows));
        }
    }

    /**
     * Order BREAD items.
     *
     * @param string $table
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function order(Request $request)
    {
        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Check permission
        $this->authorize('edit', app($dataType->model_name));

        if (!isset($dataType->order_column) || !isset($dataType->order_display_column)) {
            return redirect()
            ->route("voyager.{$dataType->slug}.index")
            ->with([
                'message'    => __('voyager::bread.ordering_not_set'),
                'alert-type' => 'error',
            ]);
        }

        $model = app($dataType->model_name);
        if ($model && in_array(SoftDeletes::class, class_uses($model))) {
            $model = $model->withTrashed();
        }
        $results = $model->orderBy($dataType->order_column, $dataType->order_direction)->get();

        $display_column = $dataType->order_display_column;

        $dataRow = Voyager::model('DataRow')->whereDataTypeId($dataType->id)->whereField($display_column)->first();

        $view = 'voyager::bread.order';

        if (view()->exists("voyager::$slug.order")) {
            $view = "voyager::$slug.order";
        }

        return Voyager::view($view, compact(
            'dataType',
            'display_column',
            'dataRow',
            'results'
        ));
    }

    public function update_order(Request $request)
    {
        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        // Check permission
        $this->authorize('edit', app($dataType->model_name));

        $model = app($dataType->model_name);

        $order = json_decode($request->input('order'));
        $column = $dataType->order_column;
        foreach ($order as $key => $item) {
            if ($model && in_array(SoftDeletes::class, class_uses($model))) {
                $i = $model->withTrashed()->findOrFail($item->id);
            } else {
                $i = $model->findOrFail($item->id);
            }
            $i->$column = ($key + 1);
            $i->save();
        }
    }

    public function action(Request $request)
    {
        $slug = $this->getSlug($request);
        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        $action = new $request->action($dataType, null);

        return $action->massAction(explode(',', $request->ids), $request->headers->get('referer'));
    }
    /**
     * Get BREAD relations data.
     *
     * @param Request $request
     *
     * @return mixed
     */
    public function relation(Request $request)
    {
        $slug = $this->getSlug($request);
        $page = $request->input('page');
        $on_page = 50;
        $search = $request->input('search', false);
        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        $rows = $request->input('method', 'add') == 'add' ? $dataType->addRows : $dataType->editRows;
        foreach ($rows as $key => $row) {
            if ($row->field === $request->input('type')) {
                $options = $row->details;
                $skip = $on_page * ($page - 1);

                // If search query, use LIKE to filter results depending on field label
                if ($search) {
                    $total_count = app($options->model)->where($options->label, 'LIKE', '%'.$search.'%')->count();
                    $relationshipOptions = app($options->model)->take($on_page)->skip($skip)
                        ->where($options->label, 'LIKE', '%'.$search.'%')
                        ->get();
                } else {
                    $total_count = app($options->model)->count();
                    $relationshipOptions = app($options->model)->take($on_page)->skip($skip)->get();
                }

                $results = [];
                foreach ($relationshipOptions as $relationshipOption) {
                    $results[] = [
                        'id'   => $relationshipOption->{$options->key},
                        'text' => $relationshipOption->{$options->label},
                    ];
                }

                return response()->json([
                    'results'    => $results,
                    'pagination' => [
                        'more' => ($total_count > ($skip + $on_page)),
                    ],
                ]);
            }
        }

        // No result found, return empty array
        return response()->json([], 404);
    }

/*public function archiV($Datedeb, $DateFin)
{
    $date_deb = $Datedeb;
    $date_fin = $DateFin;
    //dd($date_deb);
    $Listac= \App\Actualite::whereBetween('created_at',[$date_deb,$date_fin])->update(['status' => "ARCHIVE"]);
    //dd($Listac);
}*/
public function indexArchive(Request $request)
    {
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
           /* if ($dataType->model_name=='App\Actualite') {
                if($request->input('archive')=="true")
                {
                    //if($this->validateArchive($request))
                    $request->validate([
                                 'date_deb' => 'required',
                                 'date_fin' => 'required',
                                     ]);
                    $date_deb = $request->input('date_deb');
                    $date_fin = $request->input('date_fin');
                    $query = $model::where('status','=','PUBLISHED');
                    //$ListActulaites= $model::whereBetween('created_at',[$date_deb,$date_fin])->get();
                    //dd($ListActulaites);
                    $this->archiV($date_deb,$date_fin);
                    $queryArchive = $model::where('status','=','ARCHIVE');
                }
                else
                {
                    $query = $model::where('status','=','ARCHIVE');
                    //dd($query);
                }
            } else {*/
            if ($dataType->scope && $dataType->scope != '' && method_exists($model, 'scope'.ucfirst($dataType->scope))) {
                $query = $model->{$dataType->scope}();
            } else {
                $query =$model::where('status','=','ARCHIVE');
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

        $view = 'vendor.voyager.'.$slug.'.Archive';

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
            'showSoftDeleted'
        ));

    }
    public function indexAttente(Request $request)
    {
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
           /* if ($dataType->model_name=='App\Actualite') {
                if($request->input('archive')=="true")
                {
                    //if($this->validateArchive($request))
                    $request->validate([
                                 'date_deb' => 'required',
                                 'date_fin' => 'required',
                                     ]);
                    $date_deb = $request->input('date_deb');
                    $date_fin = $request->input('date_fin');
                    $query = $model::where('status','=','PUBLISHED');
                    //$ListActulaites= $model::whereBetween('created_at',[$date_deb,$date_fin])->get();
                    //dd($ListActulaites);
                    $this->archiV($date_deb,$date_fin);
                    $queryArchive = $model::where('status','=','ARCHIVE');
                }
                else
                {
                    $query = $model::where('status','=','ARCHIVE');
                    //dd($query);
                }
            } else {*/
            if ($dataType->scope && $dataType->scope != '' && method_exists($model, 'scope'.ucfirst($dataType->scope))) {
                $query = $model->{$dataType->scope}();
            } else {
                $query =$model::where('status','=','ATTENTE');
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

         $view = 'vendor.voyager.'.$slug.'.Attente';
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
            'showSoftDeleted'
        ));

    }
    public function ModifEtat(Request $request, $id)
    {
        $curTime = new \DateTime();
        $slug = $this->getSlug($request);
        $CurrentUser = auth()->user();
        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();
         // Check permission
        //$this->authorize('delete', app($dataType->model_name));
        $raison = $request->input('raison');
        //dd($user);
        $idCitoyen=$id;
        $Citoyen = Citoyen::where('id', $idCitoyen)->first();
        //dd($Citoyen->Etat);
        //En attente
        if($Citoyen->Etat==0)
        {
            $Citoyen->Etat =1;
            $Citoyen->ConfirmePar=$CurrentUser->name;
            $data=[
                'message'    => "Le compte a été confirmé avec sussés",
                'alert-type' => 'success',
            ];
        }
        //Confirmé
        else if($Citoyen->Etat==1)
        {
            $Citoyen->Etat=2;
            $Citoyen->SuspenduPar=$CurrentUser->name;
            $Citoyen->RaisonSuspension=$raison;
            $Citoyen->DateSuspension=$curTime->format("Y-m-d H:i:s");
            $data=[
                'message'    => "Le compte a été suspendu avec sussés",
                'alert-type' => 'success',
            ];
        }
        //Suspendu
        else if($Citoyen->Etat==2)
        {
            $Citoyen->Etat=1;
            $Citoyen->ConfirmePar=$CurrentUser->name;
            $data=[
                'message'    => "Le compte a été activé avec sussés",
                'alert-type' => 'success',
            ];
        }
        $Citoyen->save();

        return redirect()->route("voyager.{$dataType->slug}.index")->with($data);
    }
  public function download() {
    $file_path = public_path().$_GET['file'];
    //dd($file_path);
    return response()->download($file_path);
  }
}