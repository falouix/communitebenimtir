@extends('voyager::master')

@section('page_title', __('voyager::generic.'.(isset($dataTypeContent->id) ? 'edit' : 'add')).'
'.$dataType->display_name_singular)

@section('css')
<style>
    .panel .mce-panel {
        border-left-color: #fff;
        border-right-color: #fff;
    }

    .panel .mce-toolbar,
    .panel .mce-statusbar {
        padding-left: 20px;
    }

    .panel .mce-edit-area,
    .panel .mce-edit-area iframe,
    .panel .mce-edit-area iframe html {
        padding: 0 10px;
        min-height: 350px;
    }

    .mce-content-body {
        color: #555;
        font-size: 14px;
    }

    .panel.is-fullscreen .mce-statusbar {
        position: absolute;
        bottom: 0;
        width: 100%;
        z-index: 200000;
    }

    .panel.is-fullscreen .mce-tinymce {
        height: 100%;
    }

    .panel.is-fullscreen .mce-edit-area,
    .panel.is-fullscreen .mce-edit-area iframe,
    .panel.is-fullscreen .mce-edit-area iframe html {
        height: 100%;
        position: absolute;
        width: 99%;
        overflow-y: scroll;
        overflow-x: hidden;
        min-height: 100%;
    }
</style>
@stop

@section('page_header')
<h1 class="page-title">
    <i class="{{ $dataType->icon }}"></i>
    {{ __('voyager::generic.'.(isset($dataTypeContent->id) ? 'edit' : 'add')).' '.$dataType->display_name_singular }}
</h1>
@include('voyager::multilingual.language-selector')
@stop

@section('content')
<div class="page-content container-fluid">
    <form class="form-edit-add" role="form"
        action="@if(isset($dataTypeContent->id)){{ route('voyager.articles.update', $dataTypeContent->id) }}@else{{ route('voyager.articles.store') }}@endif"
        method="POST" enctype="multipart/form-data">
        <!-- PUT Method if we are editing -->
        @if(isset($dataTypeContent->id))
        {{ method_field("PUT") }}
        @endif
        {{ csrf_field() }}

        <div class="row">
            <div class="col-md-8">
                @if (count($errors) > 0)
                <div class="alert alert-danger">
                    <ul>
                        @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
                @endif

                <div class="page-content compass container panel panel panel-bordered panel-primary "
                    style="padding: 0px;">
                    <ul class="nav nav-tabs panel-heading">
                        <li class="active panel-title"><a data-toggle="tab" href="#FR" aria-expanded="true"
                                style="color: white;"><img src="{{asset('images/fr.jpg')}}">
                                Français</a></li>
                        <li class="panel-title"><a data-toggle="tab" href="#AR" aria-expanded="false"
                                style="color: white;"><img src="{{asset('images/ar.png')}}">
                                العربية</a></li>
                        <li class="panel-title"><a data-toggle="tab" href="#EN" aria-expanded="false"
                                style="color: white;"><img src="{{asset('images/en.jpg')}}">
                                English</a>
                        </li>
                        <li class="panel-title"><a data-toggle="tab" href="#images" aria-expanded="false"
                                style="color: white;">
                                Images & fichiers</a>
                        </li>
                        <li class="panel-title"><a data-toggle="tab" href="#list-pages" aria-expanded="false"
                                style="color: white;">
                                Liste des pages</a>
                        </li>
                    </ul>

                    <div class="tab-content">
                        <div id="FR" class="tab-pane fade active in">
                            <!-- ### TITLE ### -->
                            <div class="form-group">
                                <label for="slug">Titre</label>
                                <input type="text" class="form-control" id="titre_fr" name="titre_fr"
                                    placeholder="Titre" value="{{ $dataTypeContent->titre_fr ?? '' }}"
                                    autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="slug">Contenu</label>
                                @php
                                $dataTypeRows = $dataType->{(isset($dataTypeContent->id) ? 'editRows' : 'addRows'
                                )};
                                $row = $dataTypeRows->where('field', 'contenu_fr')->first();
                                @endphp
                                {!! app('voyager')->formField($row, $dataType, $dataTypeContent) !!}
                            </div>
                        </div>
                        <div id="AR" class="tab-pane fade" style="direction: rtl;">
                            <!-- ### TITLE ### -->
                            <div class="form-group">
                                <label for="slug">العنوان</label>
                                <input type="text" class="form-control" id="titre_ar" name="titre_ar"
                                    placeholder="العنوان" value="{{ $dataTypeContent->titre_ar ?? '' }}"
                                    autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="slug">المحتوى</label>
                                @php
                                $dataTypeRows = $dataType->{(isset($dataTypeContent->id) ? 'editRows' : 'addRows'
                                )};
                                $row = $dataTypeRows->where('field', 'contenu_ar')->first();
                                @endphp
                                {!! app('voyager')->formField($row, $dataType, $dataTypeContent) !!}
                            </div>
                        </div>
                        <div id="EN" class="tab-pane fade">
                            <!-- ### TITLE ### -->
                            <div class="form-group">
                                <label for="slug">Title</label>
                                <input type="text" class="form-control" id="titre_en" name="titre_en"
                                    placeholder="Title" value="{{ $dataTypeContent->titre_en ?? '' }}"
                                    autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="slug">Content</label>
                                @php
                                $dataTypeRows = $dataType->{(isset($dataTypeContent->id) ? 'editRows' : 'addRows'
                                )};
                                $row = $dataTypeRows->where('field', 'contenu_en')->first();
                                @endphp
                                {!! app('voyager')->formField($row, $dataType, $dataTypeContent) !!}
                            </div>
                        </div>
                        <div id="images" class="tab-pane fade">
                            <div class="form-group">
                                <button type="button" id="ajouterFichier" class="btn btn-primary">
                                    Ajouter un fichier
                                </button>
                            </div>

                            @if(isset($dataTypeContent->id))
                            @php
                            $listfichiers=App\ArticlePiecesJointe::where('article_id','=',$dataTypeContent->id)->get();
                            $nbrefichier=App\ArticlePiecesJointe::where('article_id','=',$dataTypeContent->id)->count();
                            @endphp
                            @if($nbrefichier>0)
                            <input type="hidden" id="nbrefichier" name="nbrefichier" value="{{ $nbrefichier }}" />
                            @else
                            <input type="hidden" id="nbrefichier" value=0 name="nbrefichier" />
                            @endif
                            @else
                            <input type="hidden" id="nbrefichier" value=0 name="nbrefichier" />
                            @endif
                            <input type="hidden" id="fichierSupprimer" value="" name="fichierSupprimer" />
                            <div id="parent-fichier" class="col-lg-12 col-md-12" style="padding-left: 0px;">
                                @php
                                $i=0;
                                @endphp
                                @if(isset($dataTypeContent->id))
                                @foreach ($listfichiers as $fichier)
                                <div class="col-md-12" id="divFichier{{ $i }}" style="padding-left: 0px;">
                                    <input type="hidden" value="{{ $fichier->id }}" id="idfichier{{ $i }}"
                                        name="idfichier{{ $i }}">
                                    <div class="form-group col-md-5" style="padding-left: 0px;">
                                        <input autocomplete="off" class="form-control" id="nomfichier{{ $i }}"
                                            name="nomfichier{{ $i }}" type="text" value="{{ $fichier->nom_fichier }}">
                                    </div>
                                    <div class="form-group col-md-5">
                                        <input autocomplete="off" class="form-control" id="lienfichier{{ $i }}"
                                            name="lienfichier{{ $i }}" type="file">
                                        <input autocomplete="off" class="form-control" id="hidden-lienfichier{{ $i }}"
                                            name="hidden-lienfichier{{ $i }}" type="hidden"
                                            value="{{ $fichier->lien_fichier }}">
                                    </div>

                                    <div class="form-group col-md-2" id="div-effacer-fichier{{ $i }}">
                                        @if($i==$nbrefichier-1)
                                        <button id="btn-effacer-fichier{{ $i }}" type="button"
                                            onclick="effacerfichier('divFichier{{ $i }}')" class="btn btn-primary"><i
                                                class="fa fa-trash"></i> Effacer</button>
                                        @endif
                                    </div>

                                </div>
                                @php
                                $i++;
                                @endphp
                                @endforeach
                                @endif
                            </div>
                            {{-- *************************************************************************************************** --}}




                            <div class="form-group">
                                <label for="slug">Images</label>
                                @php
                                $dataTypeRows = $dataType->{(isset($dataTypeContent->id) ? 'editRows' : 'addRows' )};
                                $row = $dataTypeRows->where('field', 'images')->first();
                                @endphp
                                {!! app('voyager')->formField($row, $dataType, $dataTypeContent) !!}
                            </div>
                            @php
                            $dataTypeRows = $dataType->{(isset($dataTypeContent->id) ? 'editRows' : 'addRows'
                            )};
                            $row = $dataTypeRows->where('field', 'ListStatistiques')->first();
                            @endphp
                            {!! app('voyager')->formField($row, $dataType, $dataTypeContent) !!}
                            <div class="col-lg-6 col-md-6 form-group">
                                <label for="statistiques">Choisir des statistiques</label>
                                <select class="form-control select2" name="statistiques" id="statistiques">
                                    @foreach(App\Statistique::all() as $stats)
                                    <option value="{{ $stats->id }}">{{ $stats->Titre_fr }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <br>
                            <div class="col-lg-6 col-md-6 form-group">
                                <button type="button" id="ajouterStat" class="btn btn-primary" onclick="AjouterStat()">
                                    Ajouter dans la page
                                </button>
                            </div>

                            @if(isset($dataTypeContent->id))
                            @if(isset($dataTypeContent->ListStatistiques))
                            <input type="hidden" id="nbrepoint"
                                value={{ sizeof(json_decode($dataTypeContent->ListStatistiques,true)) }} />
                            @else
                            <input type="hidden" id="nbrepoint" value=0 />
                            @endif
                            @else
                            <input type="hidden" id="nbrepoint" value=0 />
                            @endif
                            <div id="parent" class="col-lg-12 col-md-12" style="border: solid;">
                                @if(isset($dataTypeContent->ListStatistiques))
                                @php
                                $i=0;
                                $y=json_decode($dataTypeContent->ListStatistiques,true);
                                $tailleY=sizeof($y);
                                @endphp
                                @foreach(json_decode($dataTypeContent->ListStatistiques,true) as $statistique)
                                <div class="col-md-12" id="divstat{{ $i }}" style="padding-left: 0px;">
                                    <div class="form-group col-md-8" style="padding-left: 0px;margin-top: 10px;">
                                        @php
                                        $textstat=App\Statistique::where('id','=',$statistique)->firstOrFail()->Titre_fr;
                                        @endphp
                                        <input autocomplete="off" class="form-control" id="stat{{ $i }}"
                                            name="stat{{ $i }}" type="text" value="{{ $textstat }}" disabled>
                                        <input autocomplete="off" class="form-control" id="valuestat{{ $i }}"
                                            name="valuestat{{ $i }}" type="hidden" value="{{ $statistique }}">
                                    </div>
                                    <div class="form-group col-md-4" id="div-effacer{{ $i }}" style="margin-top: 5px;">
                                        @if($i==$tailleY-1)
                                        <button id="btn-effacer{{ $i }}" type="button"
                                            onclick="effacer('divstat{{ $i }}')" class="btn btn-primary"><i
                                                class="fa fa-trash"></i> Effacer</button>
                                        @endif
                                    </div>

                                </div>
                                @php
                                $i++;

                                @endphp
                                @endforeach
                                @endif



                            </div>
                        </div>
                        <div id="list-pages" class="tab-pane fade">

                            <div class="col-lg-6 col-md-6 form-group" style="padding-left: 0px;">
                                <label for="statistiques">Choisir des pages</label>
                                <select class="form-control select2" name="articles" id="articles"
                                    style="padding-left: 0px;">
                                    @foreach(App\Article::all() as $article)
                                    <option value="{{ $article->id }}">{{ $article->titre_ar }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <br>
                            <div class="col-lg-6 col-md-6 form-group" style="padding-left: 0px;">
                                <button type="button" id="ajouterpage" class="btn btn-primary" onclick="AjouterPage()">
                                    Ajouter dans la liste
                                </button>
                            </div>
                            @if(isset($dataTypeContent->id))
                            @php
                            $listarticlesfils=App\ListArticle::where('article_id','=',$dataTypeContent->id)->get();
                            $nbrepages=App\ListArticle::where('article_id','=',$dataTypeContent->id)->count();
                            @endphp
                            @if($nbrepages>0)
                            <input type="hidden" id="nbrepages" name="nbrepages" value="{{ $nbrepages }}" />
                            @else
                            <input type="hidden" id="nbrepages" value=0 name="nbrepages" />
                            @endif
                            @else
                            <input type="hidden" id="nbrepages" value=0 name="nbrepages" />
                            @endif
                            <input type="hidden" id="pagesSupprimer" value="" name="pagesSupprimer" />
                            <div id="parent-pages" class="col-lg-12 col-md-12" style="padding-left: 0px;border: solid;">
                                @php
                                $i=0;
                                @endphp
                                @if(isset($dataTypeContent->id))
                                @foreach ($listarticlesfils as $page)
                                @php
                                $nompage=App\Article::where('id','=',$page->id_article_fils)->get()->first()->titre_ar;
                                @endphp
                                <div class="col-md-12" id="divPage{{ $i }}" style="padding-left: 0px;">
                                    <input type="hidden" value="{{ $page->id }}" id="idpage{{ $i }}"
                                        name="idpage{{ $i }}">
                                    <input type="hidden" value="0" id="nv-page{{ $i }}" name="nv-page{{ $i }}">
                                    <div class="form-group col-md-6" style="padding-left: 5px;padding-top: 10px;">
                                        <input autocomplete="off" class="form-control" id="nompage{{ $i }}"
                                            name="nompage{{ $i }}" type="text" value="{{ $nompage }}" disabled>
                                    </div>

                                    <div class="form-group col-md-6" id="div-effacer-page{{ $i }}">
                                        @if($i==$nbrepages-1)
                                        <button id="btn-effacer-page{{ $i }}" type="button"
                                            onclick="effacerpage('divPage{{ $i }}')" class="btn btn-primary"><i
                                                class="fa fa-trash"></i> Effacer</button>
                                        @endif
                                    </div>

                                </div>
                                @php
                                $i++;
                                @endphp
                                @endforeach
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <!-- ### DETAILS ### -->
                <div class="panel panel panel-bordered panel-warning">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="icon wb-clipboard"></i> Détails</h3>
                        <div class="panel-actions">
                            <a class="panel-action voyager-angle-down" data-toggle="panel-collapse"
                                aria-hidden="true"></a>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <label for="slug">Slug</label>

                            <input type="text" class="form-control" id="slug" name="slug" placeholder="slug" {!!
                                isFieldSlugAutoGenerator($dataType, $dataTypeContent, "slug" ) !!}
                                value="{{ $dataTypeContent->slug ?? '' }}">
                        </div>
                        @can('publish', app($dataType->model_name))
                        <div class="form-group">
                            <label for="slug">Dépublier Le</label>
                            @php
                            $dataTypeRows = $dataType->{(isset($dataTypeContent->id) ? 'editRows' : 'addRows' )};
                            $row = $dataTypeRows->where('field', 'depublierLe')->first();
                            @endphp
                            {!! app('voyager')->formField($row, $dataType, $dataTypeContent) !!}
                        </div>
                        <div class="form-group">
                            <label for="status">Status</label>
                            <select class="form-control" name="status">
                                <option value="PUBLISHED" @if(isset($dataTypeContent->status) &&
                                    $dataTypeContent->status == 'PUBLISHED')
                                    selected="selected"@endif>Publié</option>
                                <option value="UNPUBLISHED" @if(isset($dataTypeContent->status) &&
                                    $dataTypeContent->status ==
                                    'UNPUBLISHED') selected="selected"@endif>Dépublié</option>
                                <option value="ARCHIVE" @if(isset($dataTypeContent->status) && $dataTypeContent->status
                                    == 'ARCHIVE') selected="selected"@endif>Archivé
                                </option>
                                <option value="ATTENTE" @if(isset($dataTypeContent->status) && $dataTypeContent->status
                                    == 'ATTENTE') selected="selected"@endif>Attente d'approbation
                                </option>
                            </select>
                        </div>
                        @else
                        <input type="hidden" name="status" id="status" value="ATTENTE" />
                        @endcan
                        <div class="form-group">
                            <label for="featured">Mise en avant</label>
                            <input type="checkbox" name="featured" @if(isset($dataTypeContent->featured) &&
                            $dataTypeContent->featured) checked="checked"@endif>
                        </div>

                    </div>
                </div>

                <!-- ### SEO CONTENT ### -->
                <div class="panel panel-bordered panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="icon wb-search"></i> Méta description
                        </h3>
                        <div class="panel-actions">
                            <a class="panel-action voyager-angle-down" data-toggle="panel-collapse"
                                aria-hidden="true"></a>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <label for="meta_description">Méta description</label>

                            <textarea class="form-control"
                                name="meta_description">{{ $dataTypeContent->meta_description ?? '' }}</textarea>
                        </div>
                        <div class="form-group">
                            <label for="meta_keywords">Mots clés</label>

                            <textarea class="form-control"
                                name="meta_keywords">{{ $dataTypeContent->meta_keywords ?? '' }}</textarea>
                        </div>
                        <div class="form-group">
                            <label for="seo_title">SEO Titre</label>

                            <input type="text" class="form-control" name="seo_title" placeholder="SEO Title"
                                value="{{ $dataTypeContent->seo_title ?? '' }}">
                        </div>
                    </div>
                </div>
                <!-- ### Informations générale ### -->
                <div class="panel panel-bordered panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="icon wb-search"></i> Informations généraux
                        </h3>
                        <div class="panel-actions">
                            <a class="panel-action voyager-angle-down" data-toggle="panel-collapse"
                                aria-hidden="true"></a>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="form-group col-md-6 col-lg-6">
                            <label for="meta_description">Ajouter par</label>

                            @if((isset($dataTypeContent->id)))
                            @php
                            $Nomcreerpar=TCG\Voyager\Models\user::where('id',
                            $dataTypeContent->creerPar)->first()->name;
                            @endphp
                            <input type="text" class="form-control" disabled value="{{ $Nomcreerpar }}">
                            <input type="hidden" class="form-control" id="creerPar" name="creerPar"
                                value="{{ $dataTypeContent->creerPar }}">
                            @else
                            <input type="text" class="form-control" disabled value="">
                            <input type="hidden" class="form-control" id="creerPar" name="creerPar"
                                value="{{ Auth::user()->id ?? '' }}">
                            @endif

                        </div>
                        <div class="form-group col-md-6 col-lg-6">
                            <label for="meta_description">Date de création</label>

                            @if((isset($dataTypeContent->id)))
                            <input type="text" class="form-control" disabled value="{{ $dataTypeContent->created_at}}">
                            @else
                            <input type="text" class="form-control" disabled value="">
                            @endif

                        </div>
                        <div class="form-group col-md-6 col-lg-6">
                            <label for="meta_keywords">Modifier par</label>
                            @if((isset($dataTypeContent->id)))
                            @php
                            if(isset($dataTypeContent->modifierPar)){
                            $Nommodifierpar=TCG\Voyager\Models\user::where('id',
                            $dataTypeContent->modifierPar)->first()->name;
                            }

                            else {
                            $Nommodifierpar="";
                            }
                            @endphp
                            <input type="text" class="form-control" disabled value="{{ $Nommodifierpar }}">
                            <input type="hidden" class="form-control" id="modifierPar" name="modifierPar"
                                value="{{ Auth::user()->id ?? '' }}">
                            @endif
                        </div>
                        <div class="form-group col-md-6 col-lg-6">
                            <label for="meta_description">Date de modification</label>

                            @if((isset($dataTypeContent->modifierPar)))
                            <input type="text" class="form-control" disabled value="{{ $dataTypeContent->updated_at}}">
                            @else
                            <input type="text" class="form-control" disabled value="">
                            @endif

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <button type="submit" class="btn btn-primary pull-right">
            @if(isset($dataTypeContent->id)) Modifier @else <i class="icon wb-plus-circle"></i>
            Créer @endif
        </button>
    </form>

    <iframe id="form_target" name="form_target" style="display:none"></iframe>
    <form id="my_form" action="{{ route('voyager.upload') }}" target="form_target" method="post"
        enctype="multipart/form-data" style="width:0px;height:0;overflow:hidden">
        {{ csrf_field() }}
        <input name="image" id="upload_file" type="file" onchange="$('#my_form').submit();this.value='';">
        <input type="hidden" name="type_slug" id="type_slug" value="{{ $dataType->slug }}">
    </form>
</div>
<div class="modal fade modal-danger" id="confirm_delete_modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title"><i class="voyager-warning"></i> {{ __('voyager::generic.are_you_sure') }}</h4>
            </div>
            <div class="modal-body">
                <h4>{{ __('voyager::generic.are_you_sure_delete') }} '<span class="confirm_delete_name"></span>'</h4>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                    data-dismiss="modal">{{ __('voyager::generic.cancel') }}</button>
                <button type="button" class="btn btn-danger"
                    id="confirm_delete">{{ __('voyager::generic.delete_confirm') }}
                </button>
            </div>
        </div>
    </div>
</div>

@stop

@section('javascript')
<script>
    $(function () {

    $('#ajouterFichier').click(function () {
    var nbrefichier = document.getElementById("nbrefichier").value;
    if (nbrefichier > 0) {
    var nomfichier = document.getElementById("nomfichier" + (nbrefichier - 1) + "").value;
    if (nomfichier == "") {
    alert("vous devez saisir le nom du fichier");
    return false;
    }
    var hidden_lienfichier = document.getElementById("hidden-lienfichier" + (nbrefichier - 1) + "").value;
    var lienfichier = document.getElementById("lienfichier" + (nbrefichier - 1) + "").value;
    if (lienfichier == "" && hidden_lienfichier=="") {
    alert("vous devez choisir le fichier");
    return false;
    }
    }
    $('#parent-fichier').append('<div class="col-md-12" id="divFichier' + nbrefichier + '" style="padding-left: 0px;">' +
        '<div class="form-group col-md-5" style="padding-left: 0px;">'
        +'<input type="hidden" value="0" id="idfichier'+ nbrefichier + '" name="idfichier'+ nbrefichier + '">'
            + '<input placeholder="Saisir le nom du fichier" autocomplete="off" class="form-control" id="nomfichier' + nbrefichier + '" name="nomfichier' + nbrefichier + '" type="text" value="" ">'
        + '</div>'
        + '<div class="form-group col-md-5">'
            + '<input  autocomplete="off" class="form-control" id="lienfichier' + nbrefichier + '" name="lienfichier' + nbrefichier + '" type="file" value="" >'
            +'<input autocomplete="off" class="form-control" id="hidden-lienfichier' + nbrefichier + '" name="hidden-lienfichier' + nbrefichier + '" type="hidden" value="" >'
            + '</div>'
        + '<div class="form-group col-md-2" id="div-effacer-fichier' + nbrefichier + '">'
            + '<button id="btn-effacer-fichier' + nbrefichier + '" type="button" onclick="effacerfichier(\'divFichier' + nbrefichier + '\')"  class="btn btn-primary"><i class="fa fa-trash"></i> Effacer</button>'
            + '</div>'
        + '</div>');
    if (nbrefichier >= 1) {
    $("#btn-effacer-fichier" + (nbrefichier - 1)).remove();
    }


    nbrefichier++;
    document.getElementById("nbrefichier").value = nbrefichier;
    });
    });
    $('document').ready(function() {
        $('#slug').slugify();

        @if($isModelTranslatable)
        $('.side-body').multilingual({
            "editing": true
        });
        @endif

        $('.side-body input[data-slug-origin]').each(function(i, el) {
            $(el).slugify();
        });
        $('.form-group').on('click', '.remove-multi-image', function(e) {
            e.preventDefault();
            $image = $(this).siblings('img');
            params = {
                slug: '{{ $dataType->slug }}',
                image: $image.data('image'),
                id: $image.data('id'),
                field: $image.parent().data('field-name'),
                _token: '{{ csrf_token() }}'
            }
            $('.confirm_delete_name').text($image.data('image'));
            $('#confirm_delete_modal').modal('show');
        });

        $('[data-toggle="tooltip"]').tooltip();

        $('.form-group').on('click', '.remove-multi-image', deleteHandler('img', true));
        $('.form-group').on('click', '.remove-single-image', deleteHandler('img', false));
        $('.form-group').on('click', '.remove-multi-file', deleteHandler('a', true));
        $('.form-group').on('click', '.remove-single-file', deleteHandler('a', false));
        var params = {};
        var $file;

        function deleteHandler(tag, isMulti) {
            return function() {
                $file = $(this).siblings(tag);

                params = {
                    slug: '{{ $dataType->slug }}',
                    filename: $file.data('file-name'),
                    id: $file.data('id'),
                    field: $file.parent().data('field-name'),
                    multi: isMulti,
                    _token: '{{ csrf_token() }}'
                }

                $('.confirm_delete_name').text(params.filename);
                $('#confirm_delete_modal').modal('show');
            };
        }
        $('#confirm_delete').on('click', function(){

        $.post('{{ route('voyager.media.remove') }}', params, function (response) {
        if ( response
        && response.data
        && response.data.status
        && response.data.status == 200 ) {

        toastr.success(response.data.message);
        $file.parent().fadeOut(300, function() { $(this).remove(); })
        } else {
        toastr.error("Error removing file.");
        }
        });

        $('#confirm_delete_modal').modal('hide');
        });
    });
    function AjouterStat() {
    var nbrepoint = document.getElementById("nbrepoint").value;
    var valueselectedStat=document.getElementById("statistiques").value;
    var textselectedStat
    =document.getElementById("statistiques").options[document.getElementById("statistiques").selectedIndex].text;
    if (nbrepoint > 0) {
    var stat = document.getElementById("stat" + (nbrepoint - 1) + "").value;
    if (stat == "") {
    alert("Vous devez choisir un élément");
    return false;
    }

    }
    $('#parent').append('<div class="col-md-12" id="divstat' + nbrepoint + '" style="padding-left: 0px;">' +
        '<div class="form-group col-md-8" style="padding-left: 0px;margin-top: 10px;">'
            + '<input autocomplete="off" class="form-control" id="stat' + nbrepoint + '" name="stat' + nbrepoint + '" type="text" value="'+textselectedStat+'" disabled>'
            + '<input autocomplete="off" class="form-control" id="valuestat' + nbrepoint + '" name="valuestat' + nbrepoint + '" type="hidden" value="'+valueselectedStat+'">'
            + '</div>'
        + '<div class="form-group col-md-4" style="margin-top: 5px;" id="div-effacer' + nbrepoint + '">'
            + '<button id="btn-effacer' + nbrepoint + '" type="button" onclick="effacer(\'divstat' + nbrepoint + '\')" class="btn btn-primary"><i class="fa fa-trash"></i> Effacer</button>'
            + '</div>'
        + '</div>');
    if (nbrepoint >= 1) {
    $("#btn-effacer" + (nbrepoint-1)+"").remove();
    }


    nbrepoint++;
    document.getElementById("nbrepoint").value = nbrepoint;
    remplirValues();
    }

    function remplirValues() {

    var nbrepoint = document.getElementById("nbrepoint").value - 1;
    if( nbrepoint>=1)
    {
    var ListStatistiques = "[";
    for (var i = 0; i <= nbrepoint-1; i++) { ListStatistiques=ListStatistiques +
        document.getElementById("valuestat"+i+"").value+","; }
        ListStatistiques=ListStatistiques+document.getElementById("valuestat"+nbrepoint+"").value+"]"; }
        else if(nbrepoint==0){
            var ListStatistiques="[" ; ListStatistiques="[" +document.getElementById("valuestat0").value+"]";
        }
        else{ var ListStatistiques="[]" ; }
         document.getElementsByName("ListStatistiques")[0].value=ListStatistiques;
         }
    function effacer(id) {
    $("#" + id).remove();
    var nbrepoint = document.getElementById("nbrepoint").value - 1;
    document.getElementById("nbrepoint").value = nbrepoint;
    $('#div-effacer' + (nbrepoint - 1)).append('<button id="btn-effacer' + (nbrepoint - 1) + '" type="button"onclick="effacer(\'divstat' + (nbrepoint - 1) + '\')" class="btn btn-primary"><i class="fa fa-trash"></i> Effacer</button>');
    remplirValues();
    }


        function effacerfichier(id) {

    var nbrefichier = document.getElementById("nbrefichier").value - 1;
    document.getElementById("fichierSupprimer").value+=";"+ document.getElementById("idfichier"+nbrefichier+"").value;
    document.getElementById("nbrefichier").value = nbrefichier;
    $("#" + id).remove();
    $('#div-effacer-fichier' + (nbrefichier - 1)).append('<button id="btn-effacer-fichier' + (nbrefichier - 1) + '" type="button"onclick="effacerfichier(\'divFichier' + (nbrefichier - 1) + '\')" class="btn btn-primary"><i class="fa fa-trash"></i> Effacer</button>');

  //  remplirValuesFichier();
    }
    function AjouterPage(){
   var nbrepages = document.getElementById("nbrepages").value;
    var valueselectedarticle=document.getElementById("articles").value;
    var textselectedarticle =document.getElementById("articles").options[document.getElementById("articles").selectedIndex].text;
    if (nbrepages > 0) {
    var page = document.getElementById("nompage" + (nbrepages - 1) + "").value;
    if (page == "") {
    alert("Vous devez choisir une page");
    return false;
    }

    }
    $('#parent-pages').append('<div class="col-md-12" id="divPage' + nbrepages + '" style="padding-left: 0px;">' +
        '<div class="form-group col-md-8" style="padding-left: 0px;margin-top: 10px;">'
            + '<input autocomplete="off" class="form-control" id="nompage' + nbrepages + '" name="nompage' + nbrepages
            + '" type="text" value="'+textselectedarticle+'" disabled>'
            + '<input autocomplete="off" class="form-control" id="idpage' + nbrepages
            + '" name="idpage' + nbrepages + '" type="hidden" value="'+valueselectedarticle+'">'
            + '<input autocomplete="off" class="form-control" id="nv-page' + nbrepages
            + '" name="nv-page' + nbrepages + '" type="hidden" value="1">'
            + '</div>'
        + '<div class="form-group col-md-4" style="margin-top: 5px;" id="div-effacer-page' + nbrepages + '">'
            + '<button id="btn-effacer-page' + nbrepages + '" type="button" onclick="effacerpage(\'divPage' + nbrepages
            + '\')"  class="btn btn-primary"><i class="fa fa-trash"></i> Effacer</button>'
            + '</div>'
        + '</div>');
    if (nbrepages >= 1) {
    $("#btn-effacer-page" + (nbrepages-1)+"").remove();
    }


    nbrepages++;
    document.getElementById("nbrepages").value = nbrepages;
    }
    function effacerpage(id) {

    var nbrepages = document.getElementById("nbrepages").value - 1;
    document.getElementById("pagesSupprimer").value+=";"+ document.getElementById("idpage"+nbrepages+"").value;
    document.getElementById("nbrepages").value = nbrepages;
    $("#" + id).remove();
    $('#div-effacer-page' + (nbrepages - 1)).append('<button id="btn-effacer-page' + (nbrepages - 1) + '" type="button" onclick="effacerpage(\'divPage' + (nbrepages - 1) + '\')" class="btn btn-primary"><i class="fa fa-trash"></i> Effacer</button>');

    // remplirValuesFichier();
    }
</script>
@stop
