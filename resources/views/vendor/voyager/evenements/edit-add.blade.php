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
        action="@if(isset($dataTypeContent->id)){{ route('voyager.evenements.update', $dataTypeContent->id) }}@else{{ route('voyager.evenements.store') }}@endif"
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
                                Vignette & carrousel d'images</a>
                        </li>
                    </ul>

                    <div class="tab-content">
                        <div id="FR" class="tab-pane fade active in">
                            <!-- ### TITLE ### -->
                            <div class="form-group">
                                <label for="slug">Titre</label>
                                <input type="text" class="form-control" id="titre_fr" name="titre_fr"
                                    placeholder="Le titre de l'événement" value="{{ $dataTypeContent->titre_fr ?? '' }}"
                                    autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="slug">Le lieu</label>
                                <input type="text" class="form-control" id="lieu_fr" name="lieu_fr" placeholder="Lieu de l'événement"
                                    value="{{ $dataTypeContent->lieu_fr ?? '' }}" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="slug">Description</label>

                                @php
                                $dataTypeRows = $dataType->{(isset($dataTypeContent->id) ? 'editRows' : 'addRows'
                                )};
                                $row = $dataTypeRows->where('field', 'description_fr')->first();
                                @endphp
                                {!! app('voyager')->formField($row, $dataType, $dataTypeContent) !!}
                            </div>
                        </div>
                        <div id="AR" class="tab-pane fade " style="direction: rtl;">
                            <!-- ### TITLE ### -->
                            <div class="form-group">
                                <label for="slug">العنوان</label>
                                <input type="text" class="form-control" id="titre_ar" name="titre_ar"
                                    placeholder="اكتب العنوان " value="{{ $dataTypeContent->titre_ar ?? '' }}"
                                    autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="slug">المكان</label>
                                <input type="text" class="form-control" id="lieu_ar" name="lieu_ar" placeholder="مكان الحدث"
                                    value="{{ $dataTypeContent->lieu_ar ?? '' }}" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="slug">الوصف</label>
                                @php
                                $dataTypeRows = $dataType->{(isset($dataTypeContent->id) ? 'editRows' : 'addRows'
                                )};
                                $row = $dataTypeRows->where('field', 'description_ar')->first();
                                @endphp
                                {!! app('voyager')->formField($row, $dataType, $dataTypeContent) !!}
                            </div>
                        </div>
                        <div id="EN" class="tab-pane fade">
                            <!-- ### TITLE ### -->
                            <div class="form-group">
                                <label for="slug">The title</label>
                                <input type="text" class="form-control" id="titre_en" name="titre_en"
                                    placeholder="Title" value="{{ $dataTypeContent->titre_en ?? '' }}"
                                    autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="slug">The place</label>
                                <input type="text" class="form-control" id="lieu_en" name="lieu_en" placeholder="Place of event"
                                    value="{{ $dataTypeContent->lieu_en ?? '' }}" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="slug">Description</label>
                                @php
                                $dataTypeRows = $dataType->{(isset($dataTypeContent->id) ? 'editRows' : 'addRows'
                                )};
                                $row = $dataTypeRows->where('field', 'description_en')->first();
                                @endphp
                                {!! app('voyager')->formField($row, $dataType, $dataTypeContent) !!}
                            </div>
                        </div>
                        <div id="images" class="tab-pane fade">
                            <div class="form-group">
                                <label for="slug">Vignette</label>
                                @php
                                $dataTypeRows = $dataType->{(isset($dataTypeContent->id) ? 'editRows' : 'addRows' )};
                                $row = $dataTypeRows->where('field', 'Vignette')->first();
                                @endphp
                                {!! app('voyager')->formField($row, $dataType, $dataTypeContent) !!}
                            </div>
                            <div class="form-group">
                                <label for="slug">ALT</label>
                                @php
                                $dataTypeRows = $dataType->{(isset($dataTypeContent->id) ? 'editRows' : 'addRows' )};
                                $row = $dataTypeRows->where('field', 'Alt')->first();
                                @endphp
                                {!! app('voyager')->formField($row, $dataType, $dataTypeContent) !!}
                            </div>
                            <div class="form-group">
                                <label for="slug">Carousel</label>
                                @php
                                $dataTypeRows = $dataType->{(isset($dataTypeContent->id) ? 'editRows' : 'addRows' )};
                                $row = $dataTypeRows->where('field', 'carousel')->first();
                                @endphp
                                {!! app('voyager')->formField($row, $dataType, $dataTypeContent) !!}
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
                        <div class="form-group">
                            <label for="slug">Date début événement</label>

                            @php
                            $dataTypeRows = $dataType->{(isset($dataTypeContent->id) ? 'editRows' : 'addRows' )};
                            $row = $dataTypeRows->where('field', 'date_debut')->first();
                            @endphp
                            {!! app('voyager')->formField($row, $dataType, $dataTypeContent) !!}
                        </div>
                        <div class="form-group">
                            <label for="slug">Date fin événement</label>
                        
                            @php
                            $dataTypeRows = $dataType->{(isset($dataTypeContent->id) ? 'editRows' : 'addRows' )};
                            $row = $dataTypeRows->where('field', 'date_fin')->first();
                            @endphp
                            {!! app('voyager')->formField($row, $dataType, $dataTypeContent) !!}
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
                            <a class="panel-action voyager-angle-down" data-toggle="panel-collapse" aria-hidden="true"></a>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="form-group col-md-6 col-lg-6">
                            <label for="meta_description">Ajouter par</label>
                
                            @if((isset($dataTypeContent->id)))
                            @php
                            $Nomcreerpar=TCG\Voyager\Models\user::where('id', $dataTypeContent->creerPar)->first()->name;
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
                            $Nommodifierpar=TCG\Voyager\Models\user::where('id', $dataTypeContent->modifierPar)->first()->name;
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
</script>
@stop