@extends('voyager::master')

@section('page_title', __('voyager::generic.viewing').' '.$dataType->display_name_plural)

@section('page_header')
<div class="container-fluid">
    <h1 class="page-title">
        <i class="{{ $dataType->icon }}"></i> {{ $dataType->display_name_plural }}
    </h1>
    @include('voyager::multilingual.language-selector')
</div>
@stop
@php
$listRaccouciRapide=App\RaccourciRapide::where('status',"PUBLISHED")->get();
@endphp
@section('content')
<div class="page-content browse container-fluid">
    @include('voyager::alerts')
    <div class="row" dir="rtl">
        <div class="col-md-12">
            <div class="panel panel-bordered">
                <div class="panel-body">

                    <div class="col-lg-4 col-md-4" style="border-style: double;margin-bottom: 5px;">slider</div>
                    <div class="col-lg-2 col-md-2" style="border-style: double;margin-bottom: 5px;height: 450px;">
                        @php
                        $item=$dataTypeContent->where('position', '=','position-motif1')->first();
                        @endphp
                        <form class="form-edit-add" role="form"
                            action="@if(isset($item->id)){{ route('voyager.accueil-composants.update', $item->id) }}@else{{ route('voyager.accueil-composants.store') }}@endif"
                            method="POST" enctype="multipart/form-data" id="form-position-motif1">
                            <!-- PUT Method if we are editing -->
                            @if(isset($item->id))
                            {{ method_field("PUT") }}
                            @endif
                            {{ csrf_field() }}
                            @if (count($errors) > 0)
                            <div class="alert alert-danger">
                                <ul>
                                    @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                            @endif
                            <input type="hidden" value="{{ $item->id }}" id="id" name="id">
                            <input type="hidden" value="{{ $item->position }}" id="position" name="position">
                            <input type="hidden" value="{{ $item->status }}" id="status" name="status">
                            <input type="hidden" value="{{ $item->created_at }}" id="created_at" name="created_at">
                            <div class="form-group">
                                <label for="titre_ar">العنوان</label>
                                <input type="text" class="form-control" id="titre_ar" name="titre_ar"
                                    placeholder="العنوان بالعربية" value="{{ $item->titre_ar }}" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="titre_fr">Le titre</label>
                                <input type="text" class="form-control" id="titre_fr" name="titre_fr"
                                    placeholder="Le titre en français" value="{{ $item->titre_fr }}" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="titre_en">The title</label>
                                <input type="text" class="form-control" id="titre_en" name="titre_en"
                                    placeholder="The title in english" value="{{ $item->titre_en }}" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="slug">Type </label>

                                <select class="form-control form_control" name="type"
                                    onchange="ChoisirType('form-position-motif1')">
                                    <option value="1" @if($item->type ==1) selected="selected" @endif>Module</option>
                                    <option value="2" @if($item->type ==2) selected="selected" @endif>Texte riche
                                    </option>
                                    <option value="3" @if($item->type ==3) selected="selected" @endif>Raccourci rapide
                                    </option>
                                </select>
                            </div>
                            <div class="form-group" id="div-raccourci_rapideId-form-position-motif1" @if($item->type==3)
                                style="display: block;" @else style="display: none;" @endif;>
                                <label for="raccourci_rapideId">Choisir un raccourci</label>
                                <select class="form-control" name="raccourci_rapideId">
                                    @foreach( $listRaccouciRapide as $Raccourci)
                                    <option value="{{ $Raccourci->id }}" @if(isset($item->raccourci_rapideId)
                                        && $item->raccourci_rapideId ==
                                        $Raccourci->id) selected="selected"@endif>{{ $Raccourci->titre_ar }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group" id="div-lien_view-form-position-motif1" @if($item->type==1)
                                style="display: block;" @else style="display: none;" @endif;>
                                <label for="slug">Choisir un module</label>

                                @php
                                $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' : 'addRows' )};
                                $row = $dataTypeRows->where('field', 'lien_view')->first();
                                @endphp
                                {!! app('voyager')->formField($row, $dataType, $item) !!}
                            </div>

                            <div class="form-group col-lg-12 col-md-12" id="div-contenu-specific-form-position-motif1"
                                @if($item->type==2) style="display: block;padding-left: 0px;padding-right: 0px;" @else
                                style="display: none;padding-left: 0px;padding-right: 0px;" @endif;>
                                <button type="button" class="btn btn-success pull-right" data-toggle="modal"
                                    data-target="#modal-position-motif1">
                                    Editer le contenu
                                </button>
                            </div>
                            <div class="modal fade" id="modal-position-motif1" dir="ltr">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title">Edition du contenu</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <ul class="nav nav-tabs panel-heading" style="background-color: #19b5fe;">
                                                <li class="active panel-title"><a data-toggle="tab" href="#FR"
                                                        aria-expanded="true" style="color: white;"><img
                                                            src="{{asset('images/fr.jpg')}}">
                                                        Français</a></li>
                                                <li class="panel-title"><a data-toggle="tab" href="#AR"
                                                        aria-expanded="false" style="color: white;"><img
                                                            src="{{asset('images/ar.png')}}">
                                                        العربية</a></li>
                                                <li class="panel-title"><a data-toggle="tab" href="#EN"
                                                        aria-expanded="false" style="color: white;"><img
                                                            src="{{asset('images/en.jpg')}}">
                                                        English</a>
                                                </li>
                                            </ul>
                                            <div class="tab-content">
                                                <div id="FR" class="tab-pane fade active in">
                                                    @php
                                                    $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                    'addRows' )};
                                                    $row = $dataTypeRows->where('field',
                                                    'contenu_specifique_fr')->first();
                                                    @endphp
                                                    {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                </div>
                                                <div id="AR" class="tab-pane fade" style="direction: rtl;">
                                                    @php
                                                    $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                    'addRows' )};
                                                    $row = $dataTypeRows->where('field',
                                                    'contenu_specifique_ar')->first();
                                                    @endphp
                                                    {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                </div>
                                                <div id="EN" class="tab-pane fade">
                                                    @php
                                                    $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                    'addRows' )};
                                                    $row = $dataTypeRows->where('field',
                                                    'contenu_specifique_en')->first();
                                                    @endphp
                                                    {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                </div>
                                            </div>
                                            {{--
                                            --}}
                                        </div>
                                        <div class="modal-footer justify-content-between">
                                            <button type="button" class="btn btn-default"
                                                data-dismiss="modal">Annuler</button>
                                            <button type="button" class="btn btn-primary"
                                                data-dismiss="modal">Enregistrer</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->
                            <button type="submit" class="btn btn-primary pull-right">
                                Enregistrer
                            </button>
                        </form>
                    </div>
                    <div class="col-lg-2 col-md-2" style="border-style: double;margin-bottom: 5px;height: 450px;">
                        @php
                        $item=$dataTypeContent->where('position', '=','position-motif2')->first();
                        @endphp
                        <form class="form-edit-add" role="form"
                            action="@if(isset($item->id)){{ route('voyager.accueil-composants.update', $item->id) }}@else{{ route('voyager.accueil-composants.store') }}@endif"
                            method="POST" enctype="multipart/form-data" id="form-position-motif2">
                            <!-- PUT Method if we are editing -->
                            @if(isset($item->id))
                            {{ method_field("PUT") }}
                            @endif
                            {{ csrf_field() }}
                            @if (count($errors) > 0)
                            <div class="alert alert-danger">
                                <ul>
                                    @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                            @endif
                            <input type="hidden" value="{{ $item->id }}" id="id" name="id">
                            <input type="hidden" value="{{ $item->position }}" id="position" name="position">
                            <input type="hidden" value="{{ $item->status }}" id="status" name="status">
                            <input type="hidden" value="{{ $item->created_at }}" id="created_at" name="created_at">
                            <div class="form-group">
                                <label for="titre_ar">العنوان</label>
                                <input type="text" class="form-control" id="titre_ar" name="titre_ar"
                                    placeholder="العنوان بالعربية" value="{{ $item->titre_ar }}" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="titre_fr">Le titre</label>
                                <input type="text" class="form-control" id="titre_fr" name="titre_fr"
                                    placeholder="Le titre en français" value="{{ $item->titre_fr }}" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="titre_en">The title</label>
                                <input type="text" class="form-control" id="titre_en" name="titre_en"
                                    placeholder="The title in english" value="{{ $item->titre_en }}" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="slug">Type </label>

                                <select class="form-control form_control" name="type"
                                    onchange="ChoisirType('form-position-motif2')">
                                    <option value="1" @if($item->type ==1) selected="selected" @endif>Module</option>
                                    <option value="2" @if($item->type ==2) selected="selected" @endif>Texte riche
                                    </option>
                                    <option value="3" @if($item->type ==3) selected="selected" @endif>Raccourci rapide
                                    </option>
                                </select>
                            </div>
                            <div class="form-group" id="div-raccourci_rapideId-form-position-motif2" @if($item->type==3)
                                style="display: block;"
                                @else style="display: none;" @endif;>
                                <label for="raccourci_rapideId">Choisir un raccourci</label>
                                <select class="form-control" name="raccourci_rapideId">
                                    @foreach( $listRaccouciRapide as $Raccourci)
                                    <option value="{{ $Raccourci->id }}" @if(isset($item->raccourci_rapideId)
                                        && $item->raccourci_rapideId ==
                                        $Raccourci->id) selected="selected"@endif>{{ $Raccourci->titre_ar }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group" id="div-lien_view-form-position-motif2" @if($item->type==1)
                                style="display: block;" @else
                                style="display: none;" @endif;>
                                <label for="slug">Choisir un module</label>

                                @php
                                $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' : 'addRows' )};
                                $row = $dataTypeRows->where('field', 'lien_view')->first();
                                @endphp
                                {!! app('voyager')->formField($row, $dataType, $item) !!}
                            </div>

                            <div class="form-group col-lg-12 col-md-12" id="div-contenu-specific-form-position-motif2"
                                @if($item->type==2)
                                style="display: block;padding-left: 0px;padding-right: 0px;" @else
                                style="display: none;padding-left: 0px;padding-right: 0px;" @endif;>
                                <button type="button" class="btn btn-success pull-right" data-toggle="modal"
                                    data-target="#modal-position-motif1">
                                    Editer le contenu
                                </button>
                            </div>
                            <div class="modal fade" id="modal-position-motif2" dir="ltr">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title">Edition du contenu</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <ul class="nav nav-tabs panel-heading" style="background-color: #19b5fe;">
                                                <li class="active panel-title"><a data-toggle="tab" href="#FR"
                                                        aria-expanded="true" style="color: white;"><img
                                                            src="{{asset('images/fr.jpg')}}">
                                                        Français</a></li>
                                                <li class="panel-title"><a data-toggle="tab" href="#AR"
                                                        aria-expanded="false" style="color: white;"><img
                                                            src="{{asset('images/ar.png')}}">
                                                        العربية</a></li>
                                                <li class="panel-title"><a data-toggle="tab" href="#EN"
                                                        aria-expanded="false" style="color: white;"><img
                                                            src="{{asset('images/en.jpg')}}">
                                                        English</a>
                                                </li>
                                            </ul>
                                            <div class="tab-content">
                                                <div id="FR" class="tab-pane fade active in">
                                                    @php
                                                    $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                    'addRows' )};
                                                    $row = $dataTypeRows->where('field',
                                                    'contenu_specifique_fr')->first();
                                                    @endphp
                                                    {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                </div>
                                                <div id="AR" class="tab-pane fade" style="direction: rtl;">
                                                    @php
                                                    $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                    'addRows' )};
                                                    $row = $dataTypeRows->where('field',
                                                    'contenu_specifique_ar')->first();
                                                    @endphp
                                                    {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                </div>
                                                <div id="EN" class="tab-pane fade">
                                                    @php
                                                    $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                    'addRows' )};
                                                    $row = $dataTypeRows->where('field',
                                                    'contenu_specifique_en')->first();
                                                    @endphp
                                                    {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                </div>
                                            </div>
                                            {{--
                                                                        --}}
                                        </div>
                                        <div class="modal-footer justify-content-between">
                                            <button type="button" class="btn btn-default"
                                                data-dismiss="modal">Annuler</button>
                                            <button type="button" class="btn btn-primary"
                                                data-dismiss="modal">Enregistrer</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->
                            <button type="submit" class="btn btn-primary pull-right">
                                Enregistrer
                            </button>
                        </form>
                    </div>
                    <div class="col-lg-2 col-md-2" style="border-style: double;margin-bottom: 5px;height: 450px;">
                        @php
                        $item=$dataTypeContent->where('position', '=','position-motif3')->first();
                        @endphp
                        <form class="form-edit-add" role="form"
                            action="@if(isset($item->id)){{ route('voyager.accueil-composants.update', $item->id) }}@else{{ route('voyager.accueil-composants.store') }}@endif"
                            method="POST" enctype="multipart/form-data" id="form-position-motif3"
                            name="form-position-motif3">
                            <!-- PUT Method if we are editing -->
                            @if(isset($item->id))
                            {{ method_field("PUT") }}
                            @endif
                            {{ csrf_field() }}
                            @if (count($errors) > 0)
                            <div class="alert alert-danger">
                                <ul>
                                    @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                            @endif
                            <input type="hidden" value="{{ $item->id }}" id="id" name="id">
                            <input type="hidden" value="{{ $item->position }}" id="position" name="position">
                            <input type="hidden" value="{{ $item->status }}" id="status" name="status">
                            <input type="hidden" value="{{ $item->created_at }}" id="created_at" name="created_at">
                            <div class="form-group">
                                <label for="titre_ar">العنوان</label>
                                <input type="text" class="form-control" id="titre_ar" name="titre_ar"
                                    placeholder="العنوان بالعربية" value="{{ $item->titre_ar }}" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="titre_fr">Le titre</label>
                                <input type="text" class="form-control" id="titre_fr" name="titre_fr"
                                    placeholder="Le titre en français" value="{{ $item->titre_fr }}" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="titre_en">The title</label>
                                <input type="text" class="form-control" id="titre_en" name="titre_en"
                                    placeholder="The title in english" value="{{ $item->titre_en }}" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="slug">Type </label>

                                <select class="form-control form_control" name="type"
                                    onchange="ChoisirType('form-position-motif3')">
                                    <option value="1" @if($item->type ==1) selected="selected" @endif>Module</option>
                                    <option value="2" @if($item->type ==2) selected="selected" @endif>Texte riche
                                    </option>
                                    <option value="3" @if($item->type ==3) selected="selected" @endif>Raccourci rapide
                                    </option>
                                </select>
                            </div>
                            <div class="form-group" id="div-raccourci_rapideId-form-position-motif3" @if($item->type==3)
                                style="display: block;"
                                @else style="display: none;" @endif;>
                                <label for="raccourci_rapideId">Choisir un raccourci</label>
                                <select class="form-control" name="raccourci_rapideId">
                                    @foreach( $listRaccouciRapide as $Raccourci)
                                    <option value="{{ $Raccourci->id }}" @if(isset($item->raccourci_rapideId)
                                        && $item->raccourci_rapideId ==
                                        $Raccourci->id) selected="selected"@endif>{{ $Raccourci->titre_ar }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group" id="div-lien_view-form-position-motif3" @if($item->type==1)
                                style="display: block;" @else
                                style="display: none;" @endif;>
                                <label for="slug">Choisir un module</label>

                                @php
                                $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' : 'addRows' )};
                                $row = $dataTypeRows->where('field', 'lien_view')->first();
                                @endphp
                                {!! app('voyager')->formField($row, $dataType, $item) !!}
                            </div>

                            <div class="form-group col-lg-12 col-md-12" id="div-contenu-specific-form-position-motif3"
                                @if($item->type==2)
                                style="display: block;padding-left: 0px;padding-right: 0px;" @else
                                style="display: none;padding-left: 0px;padding-right: 0px;" @endif;>
                                <button type="button" class="btn btn-success pull-right" data-toggle="modal"
                                    data-target="#modal-position-motif3">
                                    Editer le contenu
                                </button>
                            </div>
                            <div class="modal fade" id="modal-position-motif3" dir="ltr">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title">Edition du contenu</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <ul class="nav nav-tabs panel-heading" style="background-color: #19b5fe;">
                                                <li class="active panel-title"><a data-toggle="tab" href="#FR"
                                                        aria-expanded="true" style="color: white;"><img
                                                            src="{{asset('images/fr.jpg')}}">
                                                        Français</a></li>
                                                <li class="panel-title"><a data-toggle="tab" href="#AR"
                                                        aria-expanded="false" style="color: white;"><img
                                                            src="{{asset('images/ar.png')}}">
                                                        العربية</a></li>
                                                <li class="panel-title"><a data-toggle="tab" href="#EN"
                                                        aria-expanded="false" style="color: white;"><img
                                                            src="{{asset('images/en.jpg')}}">
                                                        English</a>
                                                </li>
                                            </ul>
                                            <div class="tab-content">
                                                <div id="FR" class="tab-pane fade active in">
                                                    @php
                                                    $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                    'addRows' )};
                                                    $row = $dataTypeRows->where('field',
                                                    'contenu_specifique_fr')->first();
                                                    @endphp
                                                    {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                </div>
                                                <div id="AR" class="tab-pane fade" style="direction: rtl;">
                                                    @php
                                                    $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                    'addRows' )};
                                                    $row = $dataTypeRows->where('field',
                                                    'contenu_specifique_ar')->first();
                                                    @endphp
                                                    {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                </div>
                                                <div id="EN" class="tab-pane fade">
                                                    @php
                                                    $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                    'addRows' )};
                                                    $row = $dataTypeRows->where('field',
                                                    'contenu_specifique_en')->first();
                                                    @endphp
                                                    {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                </div>
                                            </div>
                                            {{--
                                                                                                    --}}
                                        </div>
                                        <div class="modal-footer justify-content-between">
                                            <button type="button" class="btn btn-default"
                                                data-dismiss="modal">Annuler</button>
                                            <button type="button" class="btn btn-primary"
                                                data-dismiss="modal">Enregistrer</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->
                            <button type="submit" class="btn btn-primary pull-right">
                                Enregistrer
                            </button>
                        </form>
                    </div>
                    <div class="col-lg-2 col-md-2" style="border-style: double;margin-bottom: 5px;height: 450px;">
                        @php
                        $item=$dataTypeContent->where('position', '=','position-motif4')->first();
                        @endphp
                        <form class="form-edit-add" role="form"
                            action="@if(isset($item->id)){{ route('voyager.accueil-composants.update', $item->id) }}@else{{ route('voyager.accueil-composants.store') }}@endif"
                            method="POST" enctype="multipart/form-data" id="form-position-motif4"
                            name="form-position-motif4">
                            <!-- PUT Method if we are editing -->
                            @if(isset($item->id))
                            {{ method_field("PUT") }}
                            @endif
                            {{ csrf_field() }}
                            @if (count($errors) > 0)
                            <div class="alert alert-danger">
                                <ul>
                                    @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                            @endif
                            <input type="hidden" value="{{ $item->id }}" id="id" name="id">
                            <input type="hidden" value="{{ $item->position }}" id="position" name="position">
                            <input type="hidden" value="{{ $item->status }}" id="status" name="status">
                            <input type="hidden" value="{{ $item->created_at }}" id="created_at" name="created_at">
                            <div class="form-group">
                                <label for="titre_ar">العنوان</label>
                                <input type="text" class="form-control" id="titre_ar" name="titre_ar"
                                    placeholder="العنوان بالعربية" value="{{ $item->titre_ar }}" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="titre_fr">Le titre</label>
                                <input type="text" class="form-control" id="titre_fr" name="titre_fr"
                                    placeholder="Le titre en français" value="{{ $item->titre_fr }}" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="titre_en">The title</label>
                                <input type="text" class="form-control" id="titre_en" name="titre_en"
                                    placeholder="The title in english" value="{{ $item->titre_en }}" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="slug">Type </label>

                                <select class="form-control form_control" name="type"
                                    onchange="ChoisirType('form-position-motif4')">
                                    <option value="1" @if($item->type ==1) selected="selected" @endif>Module</option>
                                    <option value="2" @if($item->type ==2) selected="selected" @endif>Texte riche
                                    </option>
                                    <option value="3" @if($item->type ==3) selected="selected" @endif>Raccourci rapide
                                    </option>
                                </select>
                            </div>
                            <div class="form-group" id="div-raccourci_rapideId-form-position-motif4" @if($item->type==3)
                                style="display: block;"
                                @else style="display: none;" @endif;>
                                <label for="raccourci_rapideId">Choisir un raccourci</label>
                                <select class="form-control" name="raccourci_rapideId">
                                    @foreach( $listRaccouciRapide as $Raccourci)
                                    <option value="{{ $Raccourci->id }}" @if(isset($item->raccourci_rapideId)
                                        && $item->raccourci_rapideId ==
                                        $Raccourci->id) selected="selected"@endif>{{ $Raccourci->titre_ar }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group" id="div-lien_view-form-position-motif4" @if($item->type==1)
                                style="display: block;" @else
                                style="display: none;" @endif;>
                                <label for="slug">Choisir un module</label>

                                @php
                                $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' : 'addRows' )};
                                $row = $dataTypeRows->where('field', 'lien_view')->first();
                                @endphp
                                {!! app('voyager')->formField($row, $dataType, $item) !!}
                            </div>

                            <div class="form-group col-lg-12 col-md-12" id="div-contenu-specific-form-position-motif4"
                                @if($item->type==2)
                                style="display: block;padding-left: 0px;padding-right: 0px;" @else
                                style="display: none;padding-left: 0px;padding-right: 0px;" @endif;>
                                <button type="button" class="btn btn-success pull-right" data-toggle="modal"
                                    data-target="#modal-position-motif4">
                                    Editer le contenu
                                </button>
                            </div>
                            <div class="modal fade" id="modal-position-motif4" dir="ltr">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title">Edition du contenu</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <ul class="nav nav-tabs panel-heading" style="background-color: #19b5fe;">
                                                <li class="active panel-title"><a data-toggle="tab" href="#FR"
                                                        aria-expanded="true" style="color: white;"><img
                                                            src="{{asset('images/fr.jpg')}}">
                                                        Français</a></li>
                                                <li class="panel-title"><a data-toggle="tab" href="#AR"
                                                        aria-expanded="false" style="color: white;"><img
                                                            src="{{asset('images/ar.png')}}">
                                                        العربية</a></li>
                                                <li class="panel-title"><a data-toggle="tab" href="#EN"
                                                        aria-expanded="false" style="color: white;"><img
                                                            src="{{asset('images/en.jpg')}}">
                                                        English</a>
                                                </li>
                                            </ul>
                                            <div class="tab-content">
                                                <div id="FR" class="tab-pane fade active in">
                                                    @php
                                                    $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                    'addRows' )};
                                                    $row = $dataTypeRows->where('field',
                                                    'contenu_specifique_fr')->first();
                                                    @endphp
                                                    {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                </div>
                                                <div id="AR" class="tab-pane fade" style="direction: rtl;">
                                                    @php
                                                    $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                    'addRows' )};
                                                    $row = $dataTypeRows->where('field',
                                                    'contenu_specifique_ar')->first();
                                                    @endphp
                                                    {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                </div>
                                                <div id="EN" class="tab-pane fade">
                                                    @php
                                                    $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                    'addRows' )};
                                                    $row = $dataTypeRows->where('field',
                                                    'contenu_specifique_en')->first();
                                                    @endphp
                                                    {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                </div>
                                            </div>
                                            {{--
                                                                                                                                --}}
                                        </div>
                                        <div class="modal-footer justify-content-between">
                                            <button type="button" class="btn btn-default"
                                                data-dismiss="modal">Annuler</button>
                                            <button type="button" class="btn btn-primary"
                                                data-dismiss="modal">Enregistrer</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->
                            <button type="submit" class="btn btn-primary pull-right">
                                Enregistrer
                            </button>
                        </form>
                    </div>
                    <div class="col-lg-6 col-md-6" style="border-style: double;margin-bottom: 5px;height: 450px;">
                        @php
                        $item=$dataTypeContent->where('position', '=','position-actualites')->first();
                        @endphp
                        <form class="form-edit-add" role="form"
                            action="@if(isset($item->id)){{ route('voyager.accueil-composants.update', $item->id) }}@else{{ route('voyager.accueil-composants.store') }}@endif"
                            method="POST" enctype="multipart/form-data" id="form-position-actualites">
                            <!-- PUT Method if we are editing -->
                            @if(isset($item->id))
                            {{ method_field("PUT") }}
                            @endif
                            {{ csrf_field() }}
                            @if (count($errors) > 0)
                            <div class="alert alert-danger">
                                <ul>
                                    @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                            @endif
                            <input type="hidden" value="{{ $item->id }}" id="id" name="id">
                            <input type="hidden" value="{{ $item->position }}" id="position" name="position">
                            <input type="hidden" value="{{ $item->status }}" id="status" name="status">
                            <input type="hidden" value="{{ $item->created_at }}" id="created_at" name="created_at">
                            <div class="form-group">
                                <label for="titre_ar">العنوان</label>
                                <input type="text" class="form-control" id="titre_ar" name="titre_ar"
                                    placeholder="العنوان بالعربية" value="{{ $item->titre_ar }}" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="titre_fr">Le titre</label>
                                <input type="text" class="form-control" id="titre_fr" name="titre_fr"
                                    placeholder="Le titre en français" value="{{ $item->titre_fr }}" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="titre_en">The title</label>
                                <input type="text" class="form-control" id="titre_en" name="titre_en"
                                    placeholder="The title in english" value="{{ $item->titre_en }}" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="slug">Type </label>

                                <select class="form-control form_control" name="type"
                                    onchange="ChoisirType('form-position-actualites')">
                                    <option value="1" @if($item->type ==1) selected="selected" @endif>Module</option>
                                    <option value="2" @if($item->type ==2) selected="selected" @endif>Texte riche
                                    </option>
                                    <option value="3" @if($item->type ==3) selected="selected" @endif>Raccourci rapide
                                    </option>
                                </select>
                            </div>
                            <div class="form-group" id="div-raccourci_rapideId-form-position-actualites" @if($item->
                                type==3) style="display: block;"
                                @else style="display: none;" @endif;>
                                <label for="raccourci_rapideId">Choisir un raccourci</label>
                                <select class="form-control" name="raccourci_rapideId">
                                    @foreach( $listRaccouciRapide as $Raccourci)
                                    <option value="{{ $Raccourci->id }}" @if(isset($item->raccourci_rapideId)
                                        && $item->raccourci_rapideId ==
                                        $Raccourci->id) selected="selected"@endif>{{ $Raccourci->titre_ar }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group" id="div-lien_view-form-position-actualites" @if($item->type==1)
                                style="display: block;" @else
                                style="display: none;" @endif;>
                                <label for="slug">Choisir un module</label>

                                @php
                                $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' : 'addRows' )};
                                $row = $dataTypeRows->where('field', 'lien_view')->first();
                                @endphp
                                {!! app('voyager')->formField($row, $dataType, $item) !!}
                            </div>

                            <div class="form-group col-lg-12 col-md-12"
                                id="div-contenu-specific-form-position-actualites" @if($item->type==2)
                                style="display: block;padding-left: 0px;padding-right: 0px;" @else
                                style="display: none;padding-left: 0px;padding-right: 0px;" @endif;>
                                <button type="button" class="btn btn-success pull-right" data-toggle="modal"
                                    data-target="#modal-position-actualites">
                                    Editer le contenu
                                </button>
                            </div>
                            <div class="modal fade" id="modal-position-actualites" dir="ltr">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title">Edition du contenu</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <ul class="nav nav-tabs panel-heading" style="background-color: #19b5fe;">
                                                <li class="active panel-title"><a data-toggle="tab" href="#FR"
                                                        aria-expanded="true" style="color: white;"><img
                                                            src="{{asset('images/fr.jpg')}}">
                                                        Français</a></li>
                                                <li class="panel-title"><a data-toggle="tab" href="#AR"
                                                        aria-expanded="false" style="color: white;"><img
                                                            src="{{asset('images/ar.png')}}">
                                                        العربية</a></li>
                                                <li class="panel-title"><a data-toggle="tab" href="#EN"
                                                        aria-expanded="false" style="color: white;"><img
                                                            src="{{asset('images/en.jpg')}}">
                                                        English</a>
                                                </li>
                                            </ul>
                                            <div class="tab-content">
                                                <div id="FR" class="tab-pane fade active in">
                                                    @php
                                                    $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                    'addRows' )};
                                                    $row = $dataTypeRows->where('field',
                                                    'contenu_specifique_fr')->first();
                                                    @endphp
                                                    {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                </div>
                                                <div id="AR" class="tab-pane fade" style="direction: rtl;">
                                                    @php
                                                    $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                    'addRows' )};
                                                    $row = $dataTypeRows->where('field',
                                                    'contenu_specifique_ar')->first();
                                                    @endphp
                                                    {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                </div>
                                                <div id="EN" class="tab-pane fade">
                                                    @php
                                                    $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                    'addRows' )};
                                                    $row = $dataTypeRows->where('field',
                                                    'contenu_specifique_en')->first();
                                                    @endphp
                                                    {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                </div>
                                            </div>
                                            {{--
                                                                                                                                                            --}}
                                        </div>
                                        <div class="modal-footer justify-content-between">
                                            <button type="button" class="btn btn-default"
                                                data-dismiss="modal">Annuler</button>
                                            <button type="button" class="btn btn-primary"
                                                data-dismiss="modal">Enregistrer</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->
                            <button type="submit" class="btn btn-primary pull-right">
                                Enregistrer
                            </button>
                        </form>
                    </div>
                    <div class="col-lg-6 col-md-6" style="border-style: double;margin-bottom: 5px;height: 450px;">
                        @php
                        $item=$dataTypeContent->where('position', '=','position-events')->first();
                        @endphp
                        <form class="form-edit-add" role="form"
                            action="@if(isset($item->id)){{ route('voyager.accueil-composants.update', $item->id) }}@else{{ route('voyager.accueil-composants.store') }}@endif"
                            method="POST" enctype="multipart/form-data" id="form-position-events">
                            <!-- PUT Method if we are editing -->
                            @if(isset($item->id))
                            {{ method_field("PUT") }}
                            @endif
                            {{ csrf_field() }}
                            @if (count($errors) > 0)
                            <div class="alert alert-danger">
                                <ul>
                                    @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                            @endif
                            <input type="hidden" value="{{ $item->id }}" id="id" name="id">
                            <input type="hidden" value="{{ $item->position }}" id="position" name="position">
                            <input type="hidden" value="{{ $item->status }}" id="status" name="status">
                            <input type="hidden" value="{{ $item->created_at }}" id="created_at" name="created_at">
                            <div class="form-group">
                                <label for="titre_ar">العنوان</label>
                                <input type="text" class="form-control" id="titre_ar" name="titre_ar"
                                    placeholder="العنوان بالعربية" value="{{ $item->titre_ar }}" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="titre_fr">Le titre</label>
                                <input type="text" class="form-control" id="titre_fr" name="titre_fr"
                                    placeholder="Le titre en français" value="{{ $item->titre_fr }}" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="titre_en">The title</label>
                                <input type="text" class="form-control" id="titre_en" name="titre_en"
                                    placeholder="The title in english" value="{{ $item->titre_en }}" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="slug">Type </label>

                                <select class="form-control form_control" name="type"
                                    onchange="ChoisirType('form-position-events')">
                                    <option value="1" @if($item->type ==1) selected="selected" @endif>Module</option>
                                    <option value="2" @if($item->type ==2) selected="selected" @endif>Texte riche
                                    </option>
                                    <option value="3" @if($item->type ==3) selected="selected" @endif>Raccourci rapide
                                    </option>
                                </select>
                            </div>
                            <div class="form-group" id="div-raccourci_rapideId-form-position-events" @if($item->type==3)
                                style="display: block;"
                                @else style="display: none;" @endif;>
                                <label for="raccourci_rapideId">Choisir un raccourci</label>
                                <select class="form-control" name="raccourci_rapideId">
                                    @foreach( $listRaccouciRapide as $Raccourci)
                                    <option value="{{ $Raccourci->id }}" @if(isset($item->raccourci_rapideId)
                                        && $item->raccourci_rapideId ==
                                        $Raccourci->id) selected="selected"@endif>{{ $Raccourci->titre_ar }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group" id="div-lien_view-form-position-events" @if($item->type==1)
                                style="display: block;" @else
                                style="display: none;" @endif;>
                                <label for="slug">Choisir un module</label>

                                @php
                                $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' : 'addRows' )};
                                $row = $dataTypeRows->where('field', 'lien_view')->first();
                                @endphp
                                {!! app('voyager')->formField($row, $dataType, $item) !!}
                            </div>

                            <div class="form-group col-lg-12 col-md-12" id="div-contenu-specific-form-position-events"
                                @if($item->type==2)
                                style="display: block;padding-left: 0px;padding-right: 0px;" @else
                                style="display: none;padding-left: 0px;padding-right: 0px;" @endif;>
                                <button type="button" class="btn btn-success pull-right" data-toggle="modal"
                                    data-target="#modal-position-events">
                                    Editer le contenu
                                </button>
                            </div>
                            <div class="modal fade" id="modal-position-events" dir="ltr">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title">Edition du contenu</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <ul class="nav nav-tabs panel-heading" style="background-color: #19b5fe;">
                                                <li class="active panel-title"><a data-toggle="tab" href="#FR"
                                                        aria-expanded="true" style="color: white;"><img
                                                            src="{{asset('images/fr.jpg')}}">
                                                        Français</a></li>
                                                <li class="panel-title"><a data-toggle="tab" href="#AR"
                                                        aria-expanded="false" style="color: white;"><img
                                                            src="{{asset('images/ar.png')}}">
                                                        العربية</a></li>
                                                <li class="panel-title"><a data-toggle="tab" href="#EN"
                                                        aria-expanded="false" style="color: white;"><img
                                                            src="{{asset('images/en.jpg')}}">
                                                        English</a>
                                                </li>
                                            </ul>
                                            <div class="tab-content">
                                                <div id="FR" class="tab-pane fade active in">
                                                    @php
                                                    $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                    'addRows' )};
                                                    $row = $dataTypeRows->where('field',
                                                    'contenu_specifique_fr')->first();
                                                    @endphp
                                                    {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                </div>
                                                <div id="AR" class="tab-pane fade" style="direction: rtl;">
                                                    @php
                                                    $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                    'addRows' )};
                                                    $row = $dataTypeRows->where('field',
                                                    'contenu_specifique_ar')->first();
                                                    @endphp
                                                    {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                </div>
                                                <div id="EN" class="tab-pane fade">
                                                    @php
                                                    $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                    'addRows' )};
                                                    $row = $dataTypeRows->where('field',
                                                    'contenu_specifique_en')->first();
                                                    @endphp
                                                    {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                </div>
                                            </div>
                                            {{--
                                                                                                                                                                                        --}}
                                        </div>
                                        <div class="modal-footer justify-content-between">
                                            <button type="button" class="btn btn-default"
                                                data-dismiss="modal">Annuler</button>
                                            <button type="button" class="btn btn-primary"
                                                data-dismiss="modal">Enregistrer</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->
                            <button type="submit" class="btn btn-primary pull-right">
                                Enregistrer
                            </button>
                        </form>
                    </div>
                    <div class="col-lg-8 col-md-8" style="margin-bottom: 5px;padding-right: 0px;padding-left: 0px;">
                        <div class="col-lg-6 col-md-6" style="border-style: double;margin-bottom: 5px;height: 450px;">
                            @php
                            $item=$dataTypeContent->where('position', '=','position-hajj')->first();
                            @endphp
                            <form class="form-edit-add" role="form"
                                action="@if(isset($item->id)){{ route('voyager.accueil-composants.update', $item->id) }}@else{{ route('voyager.accueil-composants.store') }}@endif"
                                method="POST" enctype="multipart/form-data" id="form-position-hajj">
                                <!-- PUT Method if we are editing -->
                                @if(isset($item->id))
                                {{ method_field("PUT") }}
                                @endif
                                {{ csrf_field() }}
                                @if (count($errors) > 0)
                                <div class="alert alert-danger">
                                    <ul>
                                        @foreach ($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                        @endforeach
                                    </ul>
                                </div>
                                @endif
                                <input type="hidden" value="{{ $item->id }}" id="id" name="id">
                                <input type="hidden" value="{{ $item->position }}" id="position" name="position">
                                <input type="hidden" value="{{ $item->status }}" id="status" name="status">
                                <input type="hidden" value="{{ $item->created_at }}" id="created_at" name="created_at">
                                <div class="form-group">
                                    <label for="titre_ar">العنوان</label>
                                    <input type="text" class="form-control" id="titre_ar" name="titre_ar"
                                        placeholder="العنوان بالعربية" value="{{ $item->titre_ar }}" autocomplete="off">
                                </div>
                                <div class="form-group">
                                    <label for="titre_fr">Le titre</label>
                                    <input type="text" class="form-control" id="titre_fr" name="titre_fr"
                                        placeholder="Le titre en français" value="{{ $item->titre_fr }}"
                                        autocomplete="off">
                                </div>
                                <div class="form-group">
                                    <label for="titre_en">The title</label>
                                    <input type="text" class="form-control" id="titre_en" name="titre_en"
                                        placeholder="The title in english" value="{{ $item->titre_en }}"
                                        autocomplete="off">
                                </div>
                                <div class="form-group">
                                    <label for="slug">Type </label>

                                    <select class="form-control form_control" name="type"
                                        onchange="ChoisirType('form-position-hajj')">
                                        <option value="1" @if($item->type ==1) selected="selected" @endif>Module
                                        </option>
                                        <option value="2" @if($item->type ==2) selected="selected" @endif>Texte riche
                                        </option>
                                        <option value="3" @if($item->type ==3) selected="selected" @endif>Raccourci
                                            rapide</option>
                                    </select>
                                </div>
                                <div class="form-group" id="div-raccourci_rapideId-form-position-hajj" @if($item->
                                    type==3) style="display: block;"
                                    @else style="display: none;" @endif;>
                                    <label for="raccourci_rapideId">Choisir un raccourci</label>
                                    <select class="form-control" name="raccourci_rapideId">
                                        @foreach( $listRaccouciRapide as $Raccourci)
                                        <option value="{{ $Raccourci->id }}" @if(isset($item->raccourci_rapideId)
                                            && $item->raccourci_rapideId ==
                                            $Raccourci->id) selected="selected"@endif>{{ $Raccourci->titre_ar }}
                                        </option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="form-group" id="div-lien_view-form-position-hajj" @if($item->type==1)
                                    style="display: block;" @else
                                    style="display: none;" @endif;>
                                    <label for="slug">Choisir un module</label>

                                    @php
                                    $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' : 'addRows' )};
                                    $row = $dataTypeRows->where('field', 'lien_view')->first();
                                    @endphp
                                    {!! app('voyager')->formField($row, $dataType, $item) !!}
                                </div>

                                <div class="form-group col-lg-12 col-md-12" id="div-contenu-specific-form-position-hajj"
                                    @if($item->type==2)
                                    style="display: block;padding-left: 0px;padding-right: 0px;" @else
                                    style="display: none;padding-left: 0px;padding-right: 0px;" @endif;>
                                    <button type="button" class="btn btn-success pull-right" data-toggle="modal"
                                        data-target="#modal-position-hajj">
                                        Editer le contenu
                                    </button>
                                </div>
                                <div class="modal fade" id="modal-position-hajj" dir="ltr">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">Edition du contenu</h4>
                                                <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <ul class="nav nav-tabs panel-heading"
                                                    style="background-color: #19b5fe;">
                                                    <li class="active panel-title"><a data-toggle="tab" href="#FR"
                                                            aria-expanded="true" style="color: white;"><img
                                                                src="{{asset('images/fr.jpg')}}">
                                                            Français</a></li>
                                                    <li class="panel-title"><a data-toggle="tab" href="#AR"
                                                            aria-expanded="false" style="color: white;"><img
                                                                src="{{asset('images/ar.png')}}">
                                                            العربية</a></li>
                                                    <li class="panel-title"><a data-toggle="tab" href="#EN"
                                                            aria-expanded="false" style="color: white;"><img
                                                                src="{{asset('images/en.jpg')}}">
                                                            English</a>
                                                    </li>
                                                </ul>
                                                <div class="tab-content">
                                                    <div id="FR" class="tab-pane fade active in">
                                                        @php
                                                        $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                        'addRows' )};
                                                        $row = $dataTypeRows->where('field',
                                                        'contenu_specifique_fr')->first();
                                                        @endphp
                                                        {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                    </div>
                                                    <div id="AR" class="tab-pane fade" style="direction: rtl;">
                                                        @php
                                                        $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                        'addRows' )};
                                                        $row = $dataTypeRows->where('field',
                                                        'contenu_specifique_ar')->first();
                                                        @endphp
                                                        {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                    </div>
                                                    <div id="EN" class="tab-pane fade">
                                                        @php
                                                        $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                        'addRows' )};
                                                        $row = $dataTypeRows->where('field',
                                                        'contenu_specifique_en')->first();
                                                        @endphp
                                                        {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                    </div>
                                                </div>
                                                {{--
                                                                                                                                                                                                                        --}}
                                            </div>
                                            <div class="modal-footer justify-content-between">
                                                <button type="button" class="btn btn-default"
                                                    data-dismiss="modal">Annuler</button>
                                                <button type="button" class="btn btn-primary"
                                                    data-dismiss="modal">Enregistrer</button>
                                            </div>
                                        </div>
                                        <!-- /.modal-content -->
                                    </div>
                                    <!-- /.modal-dialog -->
                                </div>
                                <!-- /.modal -->
                                <button type="submit" class="btn btn-primary pull-right">
                                    Enregistrer
                                </button>
                            </form>
                        </div>
                        <div class="col-lg-6 col-md-6" style="border-style: double;margin-bottom: 5px;height: 450px;">
                            @php
                            $item=$dataTypeContent->where('position', '=','position-prayer')->first();
                            @endphp
                            <form class="form-edit-add" role="form"
                                action="@if(isset($item->id)){{ route('voyager.accueil-composants.update', $item->id) }}@else{{ route('voyager.accueil-composants.store') }}@endif"
                                method="POST" enctype="multipart/form-data" id="form-position-prayer">
                                <!-- PUT Method if we are editing -->
                                @if(isset($item->id))
                                {{ method_field("PUT") }}
                                @endif
                                {{ csrf_field() }}
                                @if (count($errors) > 0)
                                <div class="alert alert-danger">
                                    <ul>
                                        @foreach ($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                        @endforeach
                                    </ul>

                                </div>
                                @endif
                                <input type="hidden" value="{{ $item->id }}" id="id" name="id">
                                <input type="hidden" value="{{ $item->position }}" id="position" name="position">
                                <input type="hidden" value="{{ $item->status }}" id="status" name="status">
                                <input type="hidden" value="{{ $item->created_at }}" id="created_at" name="created_at">
                                <div class="form-group">
                                    <label for="titre_ar">العنوان</label>
                                    <input type="text" class="form-control" id="titre_ar" name="titre_ar"
                                        placeholder="العنوان بالعربية" value="{{ $item->titre_ar }}" autocomplete="off">
                                </div>
                                <div class="form-group">
                                    <label for="titre_fr">Le titre</label>
                                    <input type="text" class="form-control" id="titre_fr" name="titre_fr"
                                        placeholder="Le titre en français" value="{{ $item->titre_fr }}"
                                        autocomplete="off">
                                </div>
                                <div class="form-group">
                                    <label for="titre_en">The title</label>
                                    <input type="text" class="form-control" id="titre_en" name="titre_en"
                                        placeholder="The title in english" value="{{ $item->titre_en }}"
                                        autocomplete="off">
                                </div>
                                <div class="form-group">
                                    <label for="slug">Type </label>

                                    <select class="form-control form_control" name="type"
                                        onchange="ChoisirType('form-position-prayer')">
                                        <option value="1" @if($item->type ==1) selected="selected" @endif>Module
                                        </option>
                                        <option value="2" @if($item->type ==2) selected="selected" @endif>Texte riche
                                        </option>
                                        <option value="3" @if($item->type ==3) selected="selected" @endif>Raccourci
                                            rapide</option>
                                    </select>
                                </div>
                                <div class="form-group" id="div-raccourci_rapideId-form-position-prayer" @if($item->
                                    type==3) style="display: block;"
                                    @else style="display: none;" @endif;>
                                    <label for="raccourci_rapideId">Choisir un raccourci</label>
                                    <select class="form-control" name="raccourci_rapideId">
                                        @foreach( $listRaccouciRapide as $Raccourci)
                                        <option value="{{ $Raccourci->id }}" @if(isset($item->raccourci_rapideId)
                                            && $item->raccourci_rapideId ==
                                            $Raccourci->id) selected="selected"@endif>{{ $Raccourci->titre_ar }}
                                        </option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="form-group" id="div-lien_view-form-position-prayer" @if($item->type==1)
                                    style="display: block;" @else
                                    style="display: none;" @endif;>
                                    <label for="slug">Choisir un module</label>

                                    @php
                                    $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' : 'addRows' )};
                                    $row = $dataTypeRows->where('field', 'lien_view')->first();
                                    @endphp
                                    {!! app('voyager')->formField($row, $dataType, $item) !!}
                                </div>

                                <div class="form-group col-lg-12 col-md-12"
                                    id="div-contenu-specific-form-position-prayer" @if($item->type==2)
                                    style="display: block;padding-left: 0px;padding-right: 0px;" @else
                                    style="display: none;padding-left: 0px;padding-right: 0px;" @endif;>
                                    <button type="button" class="btn btn-success pull-right" data-toggle="modal"
                                        data-target="#modal-position-prayer">
                                        Editer le contenu
                                    </button>
                                </div>
                                <div class="modal fade" id="modal-position-prayer" dir="ltr">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">Edition du contenu</h4>
                                                <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <ul class="nav nav-tabs panel-heading"
                                                    style="background-color: #19b5fe;">
                                                    <li class="active panel-title"><a data-toggle="tab" href="#FR"
                                                            aria-expanded="true" style="color: white;"><img
                                                                src="{{asset('images/fr.jpg')}}">
                                                            Français</a></li>
                                                    <li class="panel-title"><a data-toggle="tab" href="#AR"
                                                            aria-expanded="false" style="color: white;"><img
                                                                src="{{asset('images/ar.png')}}">
                                                            العربية</a></li>
                                                    <li class="panel-title"><a data-toggle="tab" href="#EN"
                                                            aria-expanded="false" style="color: white;"><img
                                                                src="{{asset('images/en.jpg')}}">
                                                            English</a>
                                                    </li>
                                                </ul>
                                                <div class="tab-content">
                                                    <div id="FR" class="tab-pane fade active in">
                                                        @php
                                                        $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                        'addRows' )};
                                                        $row = $dataTypeRows->where('field',
                                                        'contenu_specifique_fr')->first();
                                                        @endphp
                                                        {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                    </div>
                                                    <div id="AR" class="tab-pane fade" style="direction: rtl;">
                                                        @php
                                                        $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                        'addRows' )};
                                                        $row = $dataTypeRows->where('field',
                                                        'contenu_specifique_ar')->first();
                                                        @endphp
                                                        {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                    </div>
                                                    <div id="EN" class="tab-pane fade">
                                                        @php
                                                        $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                        'addRows' )};
                                                        $row = $dataTypeRows->where('field',
                                                        'contenu_specifique_en')->first();
                                                        @endphp
                                                        {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                    </div>
                                                </div>
                                                {{--
                                                                                                                                                                                                                                                        --}}
                                            </div>
                                            <div class="modal-footer justify-content-between">
                                                <button type="button" class="btn btn-default"
                                                    data-dismiss="modal">Annuler</button>
                                                <button type="button" class="btn btn-primary"
                                                    data-dismiss="modal">Enregistrer</button>
                                            </div>
                                        </div>
                                        <!-- /.modal-content -->
                                    </div>
                                    <!-- /.modal-dialog -->
                                </div>
                                <!-- /.modal -->
                                <button type="submit" class="btn btn-primary pull-right">
                                    Enregistrer
                                </button>
                            </form>
                        </div>
                        <div class="col-lg-6 col-md-6" style="border-style: double;margin-bottom: 5px;height: 450px;">
                            @php
                            $item=$dataTypeContent->where('position', '=','position-hawkma')->first();
                            @endphp
                            <form class="form-edit-add" role="form"
                                action="@if(isset($item->id)){{ route('voyager.accueil-composants.update', $item->id) }}@else{{ route('voyager.accueil-composants.store') }}@endif"
                                method="POST" enctype="multipart/form-data" id="form-position-hawkma">
                                <!-- PUT Method if we are editing -->
                                @if(isset($item->id))
                                {{ method_field("PUT") }}
                                @endif
                                {{ csrf_field() }}
                                @if (count($errors) > 0)
                                <div class="alert alert-danger">
                                    <ul>
                                        @foreach ($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                        @endforeach
                                    </ul>

                                </div>
                                @endif
                                <input type="hidden" value="{{ $item->id }}" id="id" name="id">
                                <input type="hidden" value="{{ $item->position }}" id="position" name="position">
                                <input type="hidden" value="{{ $item->status }}" id="status" name="status">
                                <input type="hidden" value="{{ $item->created_at }}" id="created_at" name="created_at">
                                <div class="form-group">
                                    <label for="titre_ar">العنوان</label>
                                    <input type="text" class="form-control" id="titre_ar" name="titre_ar"
                                        placeholder="العنوان بالعربية" value="{{ $item->titre_ar }}" autocomplete="off">
                                </div>
                                <div class="form-group">
                                    <label for="titre_fr">Le titre</label>
                                    <input type="text" class="form-control" id="titre_fr" name="titre_fr"
                                        placeholder="Le titre en français" value="{{ $item->titre_fr }}"
                                        autocomplete="off">
                                </div>
                                <div class="form-group">
                                    <label for="titre_en">The title</label>
                                    <input type="text" class="form-control" id="titre_en" name="titre_en"
                                        placeholder="The title in english" value="{{ $item->titre_en }}"
                                        autocomplete="off">
                                </div>
                                <div class="form-group">
                                    <label for="slug">Type </label>

                                    <select class="form-control form_control" name="type"
                                        onchange="ChoisirType('form-position-hawkma')">
                                        <option value="1" @if($item->type ==1) selected="selected" @endif>Module
                                        </option>
                                        <option value="2" @if($item->type ==2) selected="selected" @endif>Texte riche
                                        </option>
                                        <option value="3" @if($item->type ==3) selected="selected" @endif>Raccourci
                                            rapide</option>
                                    </select>
                                </div>
                                <div class="form-group" id="div-raccourci_rapideId-form-position-hawkma" @if($item->
                                    type==3) style="display:
                                    block;"
                                    @else style="display: none;" @endif;>
                                    <label for="raccourci_rapideId">Choisir un raccourci</label>
                                    <select class="form-control" name="raccourci_rapideId">
                                        @foreach( $listRaccouciRapide as $Raccourci)
                                        <option value="{{ $Raccourci->id }}" @if(isset($item->raccourci_rapideId)
                                            && $item->raccourci_rapideId ==
                                            $Raccourci->id) selected="selected"@endif>{{ $Raccourci->titre_ar }}
                                        </option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="form-group" id="div-lien_view-form-position-hawkma" @if($item->type==1)
                                    style="display: block;"
                                    @else
                                    style="display: none;" @endif;>
                                    <label for="slug">Choisir un module</label>

                                    @php
                                    $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' : 'addRows' )};
                                    $row = $dataTypeRows->where('field', 'lien_view')->first();
                                    @endphp
                                    {!! app('voyager')->formField($row, $dataType, $item) !!}
                                </div>

                                <div class="form-group col-lg-12 col-md-12"
                                    id="div-contenu-specific-form-position-hawkma" @if($item->type==2)
                                    style="display: block;padding-left: 0px;padding-right: 0px;" @else
                                    style="display: none;padding-left: 0px;padding-right: 0px;" @endif;>
                                    <button type="button" class="btn btn-success pull-right" data-toggle="modal"
                                        data-target="#modal-position-hawkma">
                                        Editer le contenu
                                    </button>
                                </div>
                                <div class="modal fade" id="modal-position-hawkma" dir="ltr">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">Edition du contenu</h4>
                                                <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <ul class="nav nav-tabs panel-heading"
                                                    style="background-color: #19b5fe;">
                                                    <li class="active panel-title"><a data-toggle="tab" href="#FR"
                                                            aria-expanded="true" style="color: white;"><img
                                                                src="{{asset('images/fr.jpg')}}">
                                                            Français</a></li>
                                                    <li class="panel-title"><a data-toggle="tab" href="#AR"
                                                            aria-expanded="false" style="color: white;"><img
                                                                src="{{asset('images/ar.png')}}">
                                                            العربية</a></li>
                                                    <li class="panel-title"><a data-toggle="tab" href="#EN"
                                                            aria-expanded="false" style="color: white;"><img
                                                                src="{{asset('images/en.jpg')}}">
                                                            English</a>
                                                    </li>
                                                </ul>
                                                <div class="tab-content">
                                                    <div id="FR" class="tab-pane fade active in">
                                                        @php
                                                        $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                        'addRows' )};
                                                        $row = $dataTypeRows->where('field',
                                                        'contenu_specifique_fr')->first();
                                                        @endphp
                                                        {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                    </div>
                                                    <div id="AR" class="tab-pane fade" style="direction: rtl;">
                                                        @php
                                                        $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                        'addRows' )};
                                                        $row = $dataTypeRows->where('field',
                                                        'contenu_specifique_ar')->first();
                                                        @endphp
                                                        {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                    </div>
                                                    <div id="EN" class="tab-pane fade">
                                                        @php
                                                        $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                        'addRows' )};
                                                        $row = $dataTypeRows->where('field',
                                                        'contenu_specifique_en')->first();
                                                        @endphp
                                                        {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                    </div>
                                                </div>
                                                {{--
                                                                                                                                                                                                                                                                                --}}
                                            </div>
                                            <div class="modal-footer justify-content-between">
                                                <button type="button" class="btn btn-default"
                                                    data-dismiss="modal">Annuler</button>
                                                <button type="button" class="btn btn-primary"
                                                    data-dismiss="modal">Enregistrer</button>
                                            </div>
                                        </div>
                                        <!-- /.modal-content -->
                                    </div>
                                    <!-- /.modal-dialog -->
                                </div>
                                <!-- /.modal -->
                                <button type="submit" class="btn btn-primary pull-right">
                                    Enregistrer
                                </button>
                            </form>
                        </div>
                        <div class="col-lg-6 col-md-6" style="border-style: double;margin-bottom: 5px;height: 450px;">
                            @php
                            $item=$dataTypeContent->where('position', '=','position-accesInfos')->first();
                            @endphp
                            <form class="form-edit-add" role="form"
                                action="@if(isset($item->id)){{ route('voyager.accueil-composants.update', $item->id) }}@else{{ route('voyager.accueil-composants.store') }}@endif"
                                method="POST" enctype="multipart/form-data" id="form-position-accesInfos">
                                <!-- PUT Method if we are editing -->
                                @if(isset($item->id))
                                {{ method_field("PUT") }}
                                @endif
                                {{ csrf_field() }}
                                @if (count($errors) > 0)
                                <div class="alert alert-danger">
                                    <ul>
                                        @foreach ($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                        @endforeach
                                    </ul>

                                </div>
                                @endif
                                <input type="hidden" value="{{ $item->id }}" id="id" name="id">
                                <input type="hidden" value="{{ $item->position }}" id="position" name="position">
                                <input type="hidden" value="{{ $item->status }}" id="status" name="status">
                                <input type="hidden" value="{{ $item->created_at }}" id="created_at" name="created_at">
                                <div class="form-group">
                                    <label for="titre_ar">العنوان</label>
                                    <input type="text" class="form-control" id="titre_ar" name="titre_ar"
                                        placeholder="العنوان بالعربية" value="{{ $item->titre_ar }}" autocomplete="off">
                                </div>
                                <div class="form-group">
                                    <label for="titre_fr">Le titre</label>
                                    <input type="text" class="form-control" id="titre_fr" name="titre_fr"
                                        placeholder="Le titre en français" value="{{ $item->titre_fr }}"
                                        autocomplete="off">
                                </div>
                                <div class="form-group">
                                    <label for="titre_en">The title</label>
                                    <input type="text" class="form-control" id="titre_en" name="titre_en"
                                        placeholder="The title in english" value="{{ $item->titre_en }}"
                                        autocomplete="off">
                                </div>
                                <div class="form-group">
                                    <label for="slug">Type </label>

                                    <select class="form-control form_control" name="type"
                                        onchange="ChoisirType('form-position-accesInfos')">
                                        <option value="1" @if($item->type ==1) selected="selected" @endif>Module
                                        </option>
                                        <option value="2" @if($item->type ==2) selected="selected" @endif>Texte riche
                                        </option>
                                        <option value="3" @if($item->type ==3) selected="selected" @endif>Raccourci
                                            rapide</option>
                                    </select>
                                </div>
                                <div class="form-group" id="div-raccourci_rapideId-form-position-accesInfos" @if($item->
                                    type==3) style="display:
                                    block;"
                                    @else style="display: none;" @endif;>
                                    <label for="raccourci_rapideId">Choisir un raccourci</label>
                                    <select class="form-control" name="raccourci_rapideId">
                                        @foreach( $listRaccouciRapide as $Raccourci)
                                        <option value="{{ $Raccourci->id }}" @if(isset($item->raccourci_rapideId)
                                            && $item->raccourci_rapideId ==
                                            $Raccourci->id) selected="selected"@endif>{{ $Raccourci->titre_ar }}
                                        </option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="form-group" id="div-lien_view-form-position-accesInfos" @if($item->type==1)
                                    style="display: block;"
                                    @else
                                    style="display: none;" @endif;>
                                    <label for="slug">Choisir un module</label>

                                    @php
                                    $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' : 'addRows' )};
                                    $row = $dataTypeRows->where('field', 'lien_view')->first();
                                    @endphp
                                    {!! app('voyager')->formField($row, $dataType, $item) !!}
                                </div>

                                <div class="form-group col-lg-12 col-md-12"
                                    id="div-contenu-specific-form-position-accesInfos" @if($item->type==2)
                                    style="display: block;padding-left: 0px;padding-right: 0px;" @else
                                    style="display: none;padding-left: 0px;padding-right: 0px;" @endif;>
                                    <button type="button" class="btn btn-success pull-right" data-toggle="modal"
                                        data-target="#modal-position-accesInfos">
                                        Editer le contenu
                                    </button>
                                </div>
                                <div class="modal fade" id="modal-position-accesInfos" dir="ltr">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">Edition du contenu</h4>
                                                <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <ul class="nav nav-tabs panel-heading"
                                                    style="background-color: #19b5fe;">
                                                    <li class="active panel-title"><a data-toggle="tab" href="#FR"
                                                            aria-expanded="true" style="color: white;"><img
                                                                src="{{asset('images/fr.jpg')}}">
                                                            Français</a></li>
                                                    <li class="panel-title"><a data-toggle="tab" href="#AR"
                                                            aria-expanded="false" style="color: white;"><img
                                                                src="{{asset('images/ar.png')}}">
                                                            العربية</a></li>
                                                    <li class="panel-title"><a data-toggle="tab" href="#EN"
                                                            aria-expanded="false" style="color: white;"><img
                                                                src="{{asset('images/en.jpg')}}">
                                                            English</a>
                                                    </li>
                                                </ul>
                                                <div class="tab-content">
                                                    <div id="FR" class="tab-pane fade active in">
                                                        @php
                                                        $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                        'addRows' )};
                                                        $row = $dataTypeRows->where('field',
                                                        'contenu_specifique_fr')->first();
                                                        @endphp
                                                        {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                    </div>
                                                    <div id="AR" class="tab-pane fade" style="direction: rtl;">
                                                        @php
                                                        $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                        'addRows' )};
                                                        $row = $dataTypeRows->where('field',
                                                        'contenu_specifique_ar')->first();
                                                        @endphp
                                                        {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                    </div>
                                                    <div id="EN" class="tab-pane fade">
                                                        @php
                                                        $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                        'addRows' )};
                                                        $row = $dataTypeRows->where('field',
                                                        'contenu_specifique_en')->first();
                                                        @endphp
                                                        {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                    </div>
                                                </div>
                                                {{--
                                                                                                                                                                                                                                                                                                        --}}
                                            </div>
                                            <div class="modal-footer justify-content-between">
                                                <button type="button" class="btn btn-default"
                                                    data-dismiss="modal">Annuler</button>
                                                <button type="button" class="btn btn-primary"
                                                    data-dismiss="modal">Enregistrer</button>
                                            </div>
                                        </div>
                                        <!-- /.modal-content -->
                                    </div>
                                    <!-- /.modal-dialog -->
                                </div>
                                <!-- /.modal -->
                                <button type="submit" class="btn btn-primary pull-right">
                                    Enregistrer
                                </button>
                            </form>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4"
                        style="margin-bottom: 5px;padding-right: 0px;padding-left: 0px;height: 450px">
                        <div class="col-lg-6 col-md-6">
                            <div class="col-lg-12 col-md-12"
                                style="border-style: double;margin-bottom: 5px;overflow:auto;height: 225px;">
                                @php
                                $item=$dataTypeContent->where('position', '=','position-thumbnail1')->first();
                                @endphp
                                <form class="form-edit-add" role="form"
                                    action="@if(isset($item->id)){{ route('voyager.accueil-composants.update', $item->id) }}@else{{ route('voyager.accueil-composants.store') }}@endif"
                                    method="POST" enctype="multipart/form-data" id="form-position-thumbnail1">
                                    <!-- PUT Method if we are editing -->
                                    @if(isset($item->id))
                                    {{ method_field("PUT") }}
                                    @endif
                                    {{ csrf_field() }}
                                    @if (count($errors) > 0)
                                    <div class="alert alert-danger">
                                        <ul>
                                            @foreach ($errors->all() as $error)
                                            <li>{{ $error }}</li>
                                            @endforeach
                                        </ul>
                                    </div>
                                    @endif
                                    <input type="hidden" value="{{ $item->id }}" id="id" name="id">
                                    <input type="hidden" value="{{ $item->position }}" id="position" name="position">
                                    <input type="hidden" value="{{ $item->status }}" id="status" name="status">
                                    <input type="hidden" value="{{ $item->created_at }}" id="created_at"
                                        name="created_at">
                                    <div class="form-group">
                                        <label for="titre_ar">العنوان</label>
                                        <input type="text" class="form-control" id="titre_ar" name="titre_ar"
                                            placeholder="العنوان بالعربية" value="{{ $item->titre_ar }}"
                                            autocomplete="off">
                                    </div>
                                    <div class="form-group">
                                        <label for="titre_fr">Le titre</label>
                                        <input type="text" class="form-control" id="titre_fr" name="titre_fr"
                                            placeholder="Le titre en français" value="{{ $item->titre_fr }}"
                                            autocomplete="off">
                                    </div>
                                    <div class="form-group">
                                        <label for="titre_en">The title</label>
                                        <input type="text" class="form-control" id="titre_en" name="titre_en"
                                            placeholder="The title in english" value="{{ $item->titre_en }}"
                                            autocomplete="off">
                                    </div>
                                    <div class="form-group">
                                        <label for="slug">Type </label>

                                        <select class="form-control form_control" name="type"
                                            onchange="ChoisirType('form-position-thumbnail1')">
                                            <option value="1" @if($item->type ==1) selected="selected" @endif>Module
                                            </option>
                                            <option value="2" @if($item->type ==2) selected="selected" @endif>Texte
                                                riche
                                            </option>
                                            <option value="3" @if($item->type ==3) selected="selected" @endif>Raccourci
                                                rapide</option>
                                        </select>
                                    </div>
                                    <div class="form-group" id="div-raccourci_rapideId-form-position-thumbnail1"
                                        @if($item->
                                        type==3) style="display:
                                        block;"
                                        @else style="display: none;" @endif;>
                                        <label for="raccourci_rapideId">Choisir un raccourci</label>
                                        <select class="form-control" name="raccourci_rapideId">
                                            @foreach( $listRaccouciRapide as $Raccourci)
                                            <option value="{{ $Raccourci->id }}" @if(isset($item->raccourci_rapideId)
                                                && $item->raccourci_rapideId ==
                                                $Raccourci->id) selected="selected"@endif>{{ $Raccourci->titre_ar }}
                                            </option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group" id="div-lien_view-form-position-thumbnail1" @if($item->
                                        type==1)
                                        style="display: block;" @else
                                        style="display: none;" @endif;>
                                        <label for="slug">Choisir un module</label>

                                        @php
                                        $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' : 'addRows' )};
                                        $row = $dataTypeRows->where('field', 'lien_view')->first();
                                        @endphp
                                        {!! app('voyager')->formField($row, $dataType, $item) !!}
                                    </div>

                                    <div class="form-group col-lg-12 col-md-12"
                                        id="div-contenu-specific-form-position-thumbnail1" @if($item->type==2)
                                        style="display: block;padding-left: 0px;padding-right: 0px;" @else
                                        style="display: none;padding-left: 0px;padding-right: 0px;" @endif;>
                                        <button type="button" class="btn btn-success pull-right" data-toggle="modal"
                                            data-target="#modal-position-thumbnail1">
                                            Editer le contenu
                                        </button>
                                    </div>
                                    <div class="modal fade" id="modal-position-thumbnail1" dir="ltr">
                                        <div class="modal-dialog modal-lg">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Edition du contenu</h4>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <ul class="nav nav-tabs panel-heading"
                                                        style="background-color: #19b5fe;">
                                                        <li class="active panel-title"><a data-toggle="tab" href="#FR"
                                                                aria-expanded="true" style="color: white;"><img
                                                                    src="{{asset('images/fr.jpg')}}">
                                                                Français</a></li>
                                                        <li class="panel-title"><a data-toggle="tab" href="#AR"
                                                                aria-expanded="false" style="color: white;"><img
                                                                    src="{{asset('images/ar.png')}}">
                                                                العربية</a></li>
                                                        <li class="panel-title"><a data-toggle="tab" href="#EN"
                                                                aria-expanded="false" style="color: white;"><img
                                                                    src="{{asset('images/en.jpg')}}">
                                                                English</a>
                                                        </li>
                                                    </ul>
                                                    <div class="tab-content">
                                                        <div id="FR" class="tab-pane fade active in">
                                                            @php
                                                            $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                            'addRows' )};
                                                            $row = $dataTypeRows->where('field',
                                                            'contenu_specifique_fr')->first();
                                                            @endphp
                                                            {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                        </div>
                                                        <div id="AR" class="tab-pane fade" style="direction: rtl;">
                                                            @php
                                                            $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                            'addRows' )};
                                                            $row = $dataTypeRows->where('field',
                                                            'contenu_specifique_ar')->first();
                                                            @endphp
                                                            {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                        </div>
                                                        <div id="EN" class="tab-pane fade">
                                                            @php
                                                            $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                            'addRows' )};
                                                            $row = $dataTypeRows->where('field',
                                                            'contenu_specifique_en')->first();
                                                            @endphp
                                                            {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                        </div>
                                                    </div>
                                                    {{--
                                                                                                                                                                                                                        --}}
                                                </div>
                                                <div class="modal-footer justify-content-between">
                                                    <button type="button" class="btn btn-default"
                                                        data-dismiss="modal">Annuler</button>
                                                    <button type="button" class="btn btn-primary"
                                                        data-dismiss="modal">Enregistrer</button>
                                                </div>
                                            </div>
                                            <!-- /.modal-content -->
                                        </div>
                                        <!-- /.modal-dialog -->
                                    </div>
                                    <!-- /.modal -->
                                    <button type="submit" class="btn btn-primary pull-right">
                                        Enregistrer
                                    </button>
                                </form>
                            </div>
                            <div class="col-lg-12 col-md-12"
                                style="border-style: double;margin-bottom: 5px;overflow:auto;height: 220px;">
                                @php
                                $item=$dataTypeContent->where('position', '=','position-thumbnail2')->first();
                                @endphp
                                <form class="form-edit-add" role="form"
                                    action="@if(isset($item->id)){{ route('voyager.accueil-composants.update', $item->id) }}@else{{ route('voyager.accueil-composants.store') }}@endif"
                                    method="POST" enctype="multipart/form-data" id="form-position-thumbnail2">
                                    <!-- PUT Method if we are editing -->
                                    @if(isset($item->id))
                                    {{ method_field("PUT") }}
                                    @endif
                                    {{ csrf_field() }}
                                    @if (count($errors) > 0)
                                    <div class="alert alert-danger">
                                        <ul>
                                            @foreach ($errors->all() as $error)
                                            <li>{{ $error }}</li>
                                            @endforeach
                                        </ul>
                                    </div>
                                    @endif
                                    <input type="hidden" value="{{ $item->id }}" id="id" name="id">
                                    <input type="hidden" value="{{ $item->position }}" id="position" name="position">
                                    <input type="hidden" value="{{ $item->status }}" id="status" name="status">
                                    <input type="hidden" value="{{ $item->created_at }}" id="created_at"
                                        name="created_at">
                                    <div class="form-group">
                                        <label for="titre_ar">العنوان</label>
                                        <input type="text" class="form-control" id="titre_ar" name="titre_ar"
                                            placeholder="العنوان بالعربية" value="{{ $item->titre_ar }}"
                                            autocomplete="off">
                                    </div>
                                    <div class="form-group">
                                        <label for="titre_fr">Le titre</label>
                                        <input type="text" class="form-control" id="titre_fr" name="titre_fr"
                                            placeholder="Le titre en français" value="{{ $item->titre_fr }}"
                                            autocomplete="off">
                                    </div>
                                    <div class="form-group">
                                        <label for="titre_en">The title</label>
                                        <input type="text" class="form-control" id="titre_en" name="titre_en"
                                            placeholder="The title in english" value="{{ $item->titre_en }}"
                                            autocomplete="off">
                                    </div>
                                    <div class="form-group">
                                        <label for="slug">Type </label>

                                        <select class="form-control form_control" name="type"
                                            onchange="ChoisirType('form-position-thumbnail2')">
                                            <option value="1" @if($item->type ==1) selected="selected" @endif>Module
                                            </option>
                                            <option value="2" @if($item->type ==2) selected="selected" @endif>Texte
                                                riche
                                            </option>
                                            <option value="3" @if($item->type ==3) selected="selected" @endif>Raccourci
                                                rapide</option>
                                        </select>
                                    </div>
                                    <div class="form-group" id="div-raccourci_rapideId-form-position-thumbnail2"
                                        @if($item->
                                        type==3) style="display:
                                        block;"
                                        @else style="display: none;" @endif;>
                                        <label for="raccourci_rapideId">Choisir un raccourci</label>
                                        <select class="form-control" name="raccourci_rapideId">
                                            @foreach( $listRaccouciRapide as $Raccourci)
                                            <option value="{{ $Raccourci->id }}" @if(isset($item->raccourci_rapideId)
                                                && $item->raccourci_rapideId ==
                                                $Raccourci->id) selected="selected"@endif>{{ $Raccourci->titre_ar }}
                                            </option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group" id="div-lien_view-form-position-thumbnail2" @if($item->
                                        type==1)
                                        style="display: block;" @else
                                        style="display: none;" @endif;>
                                        <label for="slug">Choisir un module</label>

                                        @php
                                        $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' : 'addRows' )};
                                        $row = $dataTypeRows->where('field', 'lien_view')->first();
                                        @endphp
                                        {!! app('voyager')->formField($row, $dataType, $item) !!}
                                    </div>

                                    <div class="form-group col-lg-12 col-md-12"
                                        id="div-contenu-specific-form-position-thumbnail2" @if($item->type==2)
                                        style="display: block;padding-left: 0px;padding-right: 0px;" @else
                                        style="display: none;padding-left: 0px;padding-right: 0px;" @endif;>
                                        <button type="button" class="btn btn-success pull-right" data-toggle="modal"
                                            data-target="#modal-position-thumbnail2">
                                            Editer le contenu
                                        </button>
                                    </div>
                                    <div class="modal fade" id="modal-position-thumbnail2" dir="ltr">
                                        <div class="modal-dialog modal-lg">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Edition du contenu</h4>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <ul class="nav nav-tabs panel-heading"
                                                        style="background-color: #19b5fe;">
                                                        <li class="active panel-title"><a data-toggle="tab" href="#FR"
                                                                aria-expanded="true" style="color: white;"><img
                                                                    src="{{asset('images/fr.jpg')}}">
                                                                Français</a></li>
                                                        <li class="panel-title"><a data-toggle="tab" href="#AR"
                                                                aria-expanded="false" style="color: white;"><img
                                                                    src="{{asset('images/ar.png')}}">
                                                                العربية</a></li>
                                                        <li class="panel-title"><a data-toggle="tab" href="#EN"
                                                                aria-expanded="false" style="color: white;"><img
                                                                    src="{{asset('images/en.jpg')}}">
                                                                English</a>
                                                        </li>
                                                    </ul>
                                                    <div class="tab-content">
                                                        <div id="FR" class="tab-pane fade active in">
                                                            @php
                                                            $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                            'addRows' )};
                                                            $row = $dataTypeRows->where('field',
                                                            'contenu_specifique_fr')->first();
                                                            @endphp
                                                            {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                        </div>
                                                        <div id="AR" class="tab-pane fade" style="direction: rtl;">
                                                            @php
                                                            $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                            'addRows' )};
                                                            $row = $dataTypeRows->where('field',
                                                            'contenu_specifique_ar')->first();
                                                            @endphp
                                                            {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                        </div>
                                                        <div id="EN" class="tab-pane fade">
                                                            @php
                                                            $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                            'addRows' )};
                                                            $row = $dataTypeRows->where('field',
                                                            'contenu_specifique_en')->first();
                                                            @endphp
                                                            {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                        </div>
                                                    </div>
                                                    {{--
                                                                                                                                                                                                                        --}}
                                                </div>
                                                <div class="modal-footer justify-content-between">
                                                    <button type="button" class="btn btn-default"
                                                        data-dismiss="modal">Annuler</button>
                                                    <button type="button" class="btn btn-primary"
                                                        data-dismiss="modal">Enregistrer</button>
                                                </div>
                                            </div>
                                            <!-- /.modal-content -->
                                        </div>
                                        <!-- /.modal-dialog -->
                                    </div>
                                    <!-- /.modal -->
                                    <button type="submit" class="btn btn-primary pull-right">
                                        Enregistrer
                                    </button>
                                </form>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="col-lg-12 col-md-12"
                                style="border-style: double;margin-bottom: 5px;overflow:auto;height: 225px;">
                                @php
                                $item=$dataTypeContent->where('position', '=','position-thumbnail3')->first();
                                @endphp
                                <form class="form-edit-add" role="form"
                                    action="@if(isset($item->id)){{ route('voyager.accueil-composants.update', $item->id) }}@else{{ route('voyager.accueil-composants.store') }}@endif"
                                    method="POST" enctype="multipart/form-data" id="form-position-thumbnail3">
                                    <!-- PUT Method if we are editing -->
                                    @if(isset($item->id))
                                    {{ method_field("PUT") }}
                                    @endif
                                    {{ csrf_field() }}
                                    @if (count($errors) > 0)
                                    <div class="alert alert-danger">
                                        <ul>
                                            @foreach ($errors->all() as $error)
                                            <li>{{ $error }}</li>
                                            @endforeach
                                        </ul>
                                    </div>
                                    @endif
                                    <input type="hidden" value="{{ $item->id }}" id="id" name="id">
                                    <input type="hidden" value="{{ $item->position }}" id="position" name="position">
                                    <input type="hidden" value="{{ $item->status }}" id="status" name="status">
                                    <input type="hidden" value="{{ $item->created_at }}" id="created_at"
                                        name="created_at">
                                    <div class="form-group">
                                        <label for="titre_ar">العنوان</label>
                                        <input type="text" class="form-control" id="titre_ar" name="titre_ar"
                                            placeholder="العنوان بالعربية" value="{{ $item->titre_ar }}"
                                            autocomplete="off">
                                    </div>
                                    <div class="form-group">
                                        <label for="titre_fr">Le titre</label>
                                        <input type="text" class="form-control" id="titre_fr" name="titre_fr"
                                            placeholder="Le titre en français" value="{{ $item->titre_fr }}"
                                            autocomplete="off">
                                    </div>
                                    <div class="form-group">
                                        <label for="titre_en">The title</label>
                                        <input type="text" class="form-control" id="titre_en" name="titre_en"
                                            placeholder="The title in english" value="{{ $item->titre_en }}"
                                            autocomplete="off">
                                    </div>
                                    <div class="form-group">
                                        <label for="slug">Type </label>

                                        <select class="form-control form_control" name="type"
                                            onchange="ChoisirType('form-position-thumbnail3')">
                                            <option value="1" @if($item->type ==1) selected="selected" @endif>Module
                                            </option>
                                            <option value="2" @if($item->type ==2) selected="selected" @endif>Texte
                                                riche
                                            </option>
                                            <option value="3" @if($item->type ==3) selected="selected" @endif>Raccourci
                                                rapide</option>
                                        </select>
                                    </div>
                                    <div class="form-group" id="div-raccourci_rapideId-form-position-thumbnail3"
                                        @if($item->
                                        type==3) style="display:
                                        block;"
                                        @else style="display: none;" @endif;>
                                        <label for="raccourci_rapideId">Choisir un raccourci</label>
                                        <select class="form-control" name="raccourci_rapideId">
                                            @foreach( $listRaccouciRapide as $Raccourci)
                                            <option value="{{ $Raccourci->id }}" @if(isset($item->raccourci_rapideId)
                                                && $item->raccourci_rapideId ==
                                                $Raccourci->id) selected="selected"@endif>{{ $Raccourci->titre_ar }}
                                            </option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group" id="div-lien_view-form-position-thumbnail3" @if($item->
                                        type==1)
                                        style="display: block;" @else
                                        style="display: none;" @endif;>
                                        <label for="slug">Choisir un module</label>

                                        @php
                                        $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' : 'addRows' )};
                                        $row = $dataTypeRows->where('field', 'lien_view')->first();
                                        @endphp
                                        {!! app('voyager')->formField($row, $dataType, $item) !!}
                                    </div>

                                    <div class="form-group col-lg-12 col-md-12"
                                        id="div-contenu-specific-form-position-thumbnail3" @if($item->
                                        type==2)
                                        style="display: block;padding-left: 0px;padding-right: 0px;" @else
                                        style="display: none;padding-left: 0px;padding-right: 0px;" @endif;>
                                        <button type="button" class="btn btn-success pull-right" data-toggle="modal"
                                            data-target="#modal-position-thumbnail3">
                                            Editer le contenu
                                        </button>
                                    </div>
                                    <div class="modal fade" id="modal-position-thumbnail3" dir="ltr">
                                        <div class="modal-dialog modal-lg">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Edition du contenu</h4>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <ul class="nav nav-tabs panel-heading"
                                                        style="background-color: #19b5fe;">
                                                        <li class="active panel-title"><a data-toggle="tab" href="#FR"
                                                                aria-expanded="true" style="color: white;"><img
                                                                    src="{{asset('images/fr.jpg')}}">
                                                                Français</a></li>
                                                        <li class="panel-title"><a data-toggle="tab" href="#AR"
                                                                aria-expanded="false" style="color: white;"><img
                                                                    src="{{asset('images/ar.png')}}">
                                                                العربية</a></li>
                                                        <li class="panel-title"><a data-toggle="tab" href="#EN"
                                                                aria-expanded="false" style="color: white;"><img
                                                                    src="{{asset('images/en.jpg')}}">
                                                                English</a>
                                                        </li>
                                                    </ul>
                                                    <div class="tab-content">
                                                        <div id="FR" class="tab-pane fade active in">
                                                            @php
                                                            $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                            'addRows' )};
                                                            $row = $dataTypeRows->where('field',
                                                            'contenu_specifique_fr')->first();
                                                            @endphp
                                                            {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                        </div>
                                                        <div id="AR" class="tab-pane fade" style="direction: rtl;">
                                                            @php
                                                            $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                            'addRows' )};
                                                            $row = $dataTypeRows->where('field',
                                                            'contenu_specifique_ar')->first();
                                                            @endphp
                                                            {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                        </div>
                                                        <div id="EN" class="tab-pane fade">
                                                            @php
                                                            $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                            'addRows' )};
                                                            $row = $dataTypeRows->where('field',
                                                            'contenu_specifique_en')->first();
                                                            @endphp
                                                            {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                        </div>
                                                    </div>
                                                    {{--
                                                                                                                                                                                                                                                --}}
                                                </div>
                                                <div class="modal-footer justify-content-between">
                                                    <button type="button" class="btn btn-default"
                                                        data-dismiss="modal">Annuler</button>
                                                    <button type="button" class="btn btn-primary"
                                                        data-dismiss="modal">Enregistrer</button>
                                                </div>
                                            </div>
                                            <!-- /.modal-content -->
                                        </div>
                                        <!-- /.modal-dialog -->
                                    </div>
                                    <!-- /.modal -->
                                    <button type="submit" class="btn btn-primary pull-right">
                                        Enregistrer
                                    </button>
                                </form>
                            </div>
                            <div class="col-lg-12 col-md-12"
                                style="border-style: double;margin-bottom: 5px;overflow:auto;height: 220px;">
                                @php
                                $item=$dataTypeContent->where('position', '=','position-thumbnail4')->first();
                                @endphp
                                <form class="form-edit-add" role="form"
                                    action="@if(isset($item->id)){{ route('voyager.accueil-composants.update', $item->id) }}@else{{ route('voyager.accueil-composants.store') }}@endif"
                                    method="POST" enctype="multipart/form-data" id="form-position-thumbnail4">
                                    <!-- PUT Method if we are editing -->
                                    @if(isset($item->id))
                                    {{ method_field("PUT") }}
                                    @endif
                                    {{ csrf_field() }}
                                    @if (count($errors) > 0)
                                    <div class="alert alert-danger">
                                        <ul>
                                            @foreach ($errors->all() as $error)
                                            <li>{{ $error }}</li>
                                            @endforeach
                                        </ul>
                                    </div>
                                    @endif
                                    <input type="hidden" value="{{ $item->id }}" id="id" name="id">
                                    <input type="hidden" value="{{ $item->position }}" id="position" name="position">
                                    <input type="hidden" value="{{ $item->status }}" id="status" name="status">
                                    <input type="hidden" value="{{ $item->created_at }}" id="created_at"
                                        name="created_at">
                                    <div class="form-group">
                                        <label for="titre_ar">العنوان</label>
                                        <input type="text" class="form-control" id="titre_ar" name="titre_ar"
                                            placeholder="العنوان بالعربية" value="{{ $item->titre_ar }}"
                                            autocomplete="off">
                                    </div>
                                    <div class="form-group">
                                        <label for="titre_fr">Le titre</label>
                                        <input type="text" class="form-control" id="titre_fr" name="titre_fr"
                                            placeholder="Le titre en français" value="{{ $item->titre_fr }}"
                                            autocomplete="off">
                                    </div>
                                    <div class="form-group">
                                        <label for="titre_en">The title</label>
                                        <input type="text" class="form-control" id="titre_en" name="titre_en"
                                            placeholder="The title in english" value="{{ $item->titre_en }}"
                                            autocomplete="off">
                                    </div>
                                    <div class="form-group">
                                        <label for="slug">Type </label>

                                        <select class="form-control form_control" name="type"
                                            onchange="ChoisirType('form-position-thumbnail4')">
                                            <option value="1" @if($item->type ==1) selected="selected" @endif>Module
                                            </option>
                                            <option value="2" @if($item->type ==2) selected="selected" @endif>Texte
                                                riche
                                            </option>
                                            <option value="3" @if($item->type ==3) selected="selected" @endif>Raccourci
                                                rapide</option>
                                        </select>
                                    </div>
                                    <div class="form-group" id="div-raccourci_rapideId-form-position-thumbnail4"
                                        @if($item->
                                        type==3) style="display:
                                        block;"
                                        @else style="display: none;" @endif;>
                                        <label for="raccourci_rapideId">Choisir un raccourci</label>
                                        <select class="form-control" name="raccourci_rapideId">
                                            @foreach( $listRaccouciRapide as $Raccourci)
                                            <option value="{{ $Raccourci->id }}" @if(isset($item->raccourci_rapideId)
                                                && $item->raccourci_rapideId ==
                                                $Raccourci->id) selected="selected"@endif>{{ $Raccourci->titre_ar }}
                                            </option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group" id="div-lien_view-form-position-thumbnail4" @if($item->
                                        type==1)
                                        style="display: block;" @else
                                        style="display: none;" @endif;>
                                        <label for="slug">Choisir un module</label>

                                        @php
                                        $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' : 'addRows' )};
                                        $row = $dataTypeRows->where('field', 'lien_view')->first();
                                        @endphp
                                        {!! app('voyager')->formField($row, $dataType, $item) !!}
                                    </div>

                                    <div class="form-group col-lg-12 col-md-12"
                                        id="div-contenu-specific-form-position-thumbnail4" @if($item->
                                        type==2)
                                        style="display: block;padding-left: 0px;padding-right: 0px;" @else
                                        style="display: none;padding-left: 0px;padding-right: 0px;" @endif;>
                                        <button type="button" class="btn btn-success pull-right" data-toggle="modal"
                                            data-target="#modal-position-thumbnail4">
                                            Editer le contenu
                                        </button>
                                    </div>
                                    <div class="modal fade" id="modal-position-thumbnail4" dir="ltr">
                                        <div class="modal-dialog modal-lg">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Edition du contenu</h4>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <ul class="nav nav-tabs panel-heading"
                                                        style="background-color: #19b5fe;">
                                                        <li class="active panel-title"><a data-toggle="tab" href="#FR"
                                                                aria-expanded="true" style="color: white;"><img
                                                                    src="{{asset('images/fr.jpg')}}">
                                                                Français</a></li>
                                                        <li class="panel-title"><a data-toggle="tab" href="#AR"
                                                                aria-expanded="false" style="color: white;"><img
                                                                    src="{{asset('images/ar.png')}}">
                                                                العربية</a></li>
                                                        <li class="panel-title"><a data-toggle="tab" href="#EN"
                                                                aria-expanded="false" style="color: white;"><img
                                                                    src="{{asset('images/en.jpg')}}">
                                                                English</a>
                                                        </li>
                                                    </ul>
                                                    <div class="tab-content">
                                                        <div id="FR" class="tab-pane fade active in">
                                                            @php
                                                            $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                            'addRows' )};
                                                            $row = $dataTypeRows->where('field',
                                                            'contenu_specifique_fr')->first();
                                                            @endphp
                                                            {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                        </div>
                                                        <div id="AR" class="tab-pane fade" style="direction: rtl;">
                                                            @php
                                                            $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                            'addRows' )};
                                                            $row = $dataTypeRows->where('field',
                                                            'contenu_specifique_ar')->first();
                                                            @endphp
                                                            {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                        </div>
                                                        <div id="EN" class="tab-pane fade">
                                                            @php
                                                            $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                            'addRows' )};
                                                            $row = $dataTypeRows->where('field',
                                                            'contenu_specifique_en')->first();
                                                            @endphp
                                                            {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                        </div>
                                                    </div>
                                                    {{--
                                                                                                                                                                                                                                                --}}
                                                </div>
                                                <div class="modal-footer justify-content-between">
                                                    <button type="button" class="btn btn-default"
                                                        data-dismiss="modal">Annuler</button>
                                                    <button type="button" class="btn btn-primary"
                                                        data-dismiss="modal">Enregistrer</button>
                                                </div>
                                            </div>
                                            <!-- /.modal-content -->
                                        </div>
                                        <!-- /.modal-dialog -->
                                    </div>
                                    <!-- /.modal -->
                                    <button type="submit" class="btn btn-primary pull-right">
                                        Enregistrer
                                    </button>
                                </form>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="col-lg-12 col-md-12"
                                style="border-style: double;margin-bottom: 5px;overflow:auto;height: 225px;">
                                @php
                                $item=$dataTypeContent->where('position', '=','position-thumbnail5')->first();
                                @endphp
                                <form class="form-edit-add" role="form"
                                    action="@if(isset($item->id)){{ route('voyager.accueil-composants.update', $item->id) }}@else{{ route('voyager.accueil-composants.store') }}@endif"
                                    method="POST" enctype="multipart/form-data" id="form-position-thumbnail5">
                                    <!-- PUT Method if we are editing -->
                                    @if(isset($item->id))
                                    {{ method_field("PUT") }}
                                    @endif
                                    {{ csrf_field() }}
                                    @if (count($errors) > 0)
                                    <div class="alert alert-danger">
                                        <ul>
                                            @foreach ($errors->all() as $error)
                                            <li>{{ $error }}</li>
                                            @endforeach
                                        </ul>
                                    </div>
                                    @endif
                                    <input type="hidden" value="{{ $item->id }}" id="id" name="id">
                                    <input type="hidden" value="{{ $item->position }}" id="position" name="position">
                                    <input type="hidden" value="{{ $item->status }}" id="status" name="status">
                                    <input type="hidden" value="{{ $item->created_at }}" id="created_at"
                                        name="created_at">
                                    <div class="form-group">
                                        <label for="titre_ar">العنوان</label>
                                        <input type="text" class="form-control" id="titre_ar" name="titre_ar"
                                            placeholder="العنوان بالعربية" value="{{ $item->titre_ar }}"
                                            autocomplete="off">
                                    </div>
                                    <div class="form-group">
                                        <label for="titre_fr">Le titre</label>
                                        <input type="text" class="form-control" id="titre_fr" name="titre_fr"
                                            placeholder="Le titre en français" value="{{ $item->titre_fr }}"
                                            autocomplete="off">
                                    </div>
                                    <div class="form-group">
                                        <label for="titre_en">The title</label>
                                        <input type="text" class="form-control" id="titre_en" name="titre_en"
                                            placeholder="The title in english" value="{{ $item->titre_en }}"
                                            autocomplete="off">
                                    </div>
                                    <div class="form-group">
                                        <label for="slug">Type </label>

                                        <select class="form-control form_control" name="type"
                                            onchange="ChoisirType('form-position-thumbnail5')">
                                            <option value="1" @if($item->type ==1) selected="selected" @endif>Module
                                            </option>
                                            <option value="2" @if($item->type ==2) selected="selected" @endif>Texte
                                                riche
                                            </option>
                                            <option value="3" @if($item->type ==3) selected="selected" @endif>Raccourci
                                                rapide</option>
                                        </select>
                                    </div>
                                    <div class="form-group" id="div-raccourci_rapideId-form-position-thumbnail5"
                                        @if($item->
                                        type==3) style="display:
                                        block;"
                                        @else style="display: none;" @endif;>
                                        <label for="raccourci_rapideId">Choisir un raccourci</label>
                                        <select class="form-control" name="raccourci_rapideId">
                                            @foreach( $listRaccouciRapide as $Raccourci)
                                            <option value="{{ $Raccourci->id }}" @if(isset($item->raccourci_rapideId)
                                                && $item->raccourci_rapideId ==
                                                $Raccourci->id) selected="selected"@endif>{{ $Raccourci->titre_ar }}
                                            </option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group" id="div-lien_view-form-position-thumbnail5" @if($item->
                                        type==1)
                                        style="display: block;" @else
                                        style="display: none;" @endif;>
                                        <label for="slug">Choisir un module</label>

                                        @php
                                        $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' : 'addRows' )};
                                        $row = $dataTypeRows->where('field', 'lien_view')->first();
                                        @endphp
                                        {!! app('voyager')->formField($row, $dataType, $item) !!}
                                    </div>

                                    <div class="form-group col-lg-12 col-md-12"
                                        id="div-contenu-specific-form-position-thumbnail5" @if($item->
                                        type==2)
                                        style="display: block;padding-left: 0px;padding-right: 0px;" @else
                                        style="display: none;padding-left: 0px;padding-right: 0px;" @endif;>
                                        <button type="button" class="btn btn-success pull-right" data-toggle="modal"
                                            data-target="#modal-position-thumbnail5">
                                            Editer le contenu
                                        </button>
                                    </div>
                                    <div class="modal fade" id="modal-position-thumbnail5" dir="ltr">
                                        <div class="modal-dialog modal-lg">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Edition du contenu</h4>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <ul class="nav nav-tabs panel-heading"
                                                        style="background-color: #19b5fe;">
                                                        <li class="active panel-title"><a data-toggle="tab" href="#FR"
                                                                aria-expanded="true" style="color: white;"><img
                                                                    src="{{asset('images/fr.jpg')}}">
                                                                Français</a></li>
                                                        <li class="panel-title"><a data-toggle="tab" href="#AR"
                                                                aria-expanded="false" style="color: white;"><img
                                                                    src="{{asset('images/ar.png')}}">
                                                                العربية</a></li>
                                                        <li class="panel-title"><a data-toggle="tab" href="#EN"
                                                                aria-expanded="false" style="color: white;"><img
                                                                    src="{{asset('images/en.jpg')}}">
                                                                English</a>
                                                        </li>
                                                    </ul>
                                                    <div class="tab-content">
                                                        <div id="FR" class="tab-pane fade active in">
                                                            @php
                                                            $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                            'addRows' )};
                                                            $row = $dataTypeRows->where('field',
                                                            'contenu_specifique_fr')->first();
                                                            @endphp
                                                            {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                        </div>
                                                        <div id="AR" class="tab-pane fade" style="direction: rtl;">
                                                            @php
                                                            $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                            'addRows' )};
                                                            $row = $dataTypeRows->where('field',
                                                            'contenu_specifique_ar')->first();
                                                            @endphp
                                                            {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                        </div>
                                                        <div id="EN" class="tab-pane fade">
                                                            @php
                                                            $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                            'addRows' )};
                                                            $row = $dataTypeRows->where('field',
                                                            'contenu_specifique_en')->first();
                                                            @endphp
                                                            {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                        </div>
                                                    </div>
                                                    {{--
                                                                                                                                                                                                                                                                        --}}
                                                </div>
                                                <div class="modal-footer justify-content-between">
                                                    <button type="button" class="btn btn-default"
                                                        data-dismiss="modal">Annuler</button>
                                                    <button type="button" class="btn btn-primary"
                                                        data-dismiss="modal">Enregistrer</button>
                                                </div>
                                            </div>
                                            <!-- /.modal-content -->
                                        </div>
                                        <!-- /.modal-dialog -->
                                    </div>
                                    <!-- /.modal -->
                                    <button type="submit" class="btn btn-primary pull-right">
                                        Enregistrer
                                    </button>
                                </form>
                            </div>
                            <div class="col-lg-12 col-md-12"
                                style="border-style: double;margin-bottom: 5px;overflow:auto;height: 220px;">
                                @php
                                $item=$dataTypeContent->where('position', '=','position-thumbnail6')->first();
                                @endphp
                                <form class="form-edit-add" role="form"
                                    action="@if(isset($item->id)){{ route('voyager.accueil-composants.update', $item->id) }}@else{{ route('voyager.accueil-composants.store') }}@endif"
                                    method="POST" enctype="multipart/form-data" id="form-position-thumbnail6">
                                    <!-- PUT Method if we are editing -->
                                    @if(isset($item->id))
                                    {{ method_field("PUT") }}
                                    @endif
                                    {{ csrf_field() }}
                                    @if (count($errors) > 0)
                                    <div class="alert alert-danger">
                                        <ul>
                                            @foreach ($errors->all() as $error)
                                            <li>{{ $error }}</li>
                                            @endforeach
                                        </ul>
                                    </div>
                                    @endif
                                    <input type="hidden" value="{{ $item->id }}" id="id" name="id">
                                    <input type="hidden" value="{{ $item->position }}" id="position" name="position">
                                    <input type="hidden" value="{{ $item->status }}" id="status" name="status">
                                    <input type="hidden" value="{{ $item->created_at }}" id="created_at"
                                        name="created_at">
                                    <div class="form-group">
                                        <label for="titre_ar">العنوان</label>
                                        <input type="text" class="form-control" id="titre_ar" name="titre_ar"
                                            placeholder="العنوان بالعربية" value="{{ $item->titre_ar }}"
                                            autocomplete="off">
                                    </div>
                                    <div class="form-group">
                                        <label for="titre_fr">Le titre</label>
                                        <input type="text" class="form-control" id="titre_fr" name="titre_fr"
                                            placeholder="Le titre en français" value="{{ $item->titre_fr }}"
                                            autocomplete="off">
                                    </div>
                                    <div class="form-group">
                                        <label for="titre_en">The title</label>
                                        <input type="text" class="form-control" id="titre_en" name="titre_en"
                                            placeholder="The title in english" value="{{ $item->titre_en }}"
                                            autocomplete="off">
                                    </div>
                                    <div class="form-group">
                                        <label for="slug">Type </label>

                                        <select class="form-control form_control" name="type"
                                            onchange="ChoisirType('form-position-thumbnail6')">
                                            <option value="1" @if($item->type ==1) selected="selected" @endif>Module
                                            </option>
                                            <option value="2" @if($item->type ==2) selected="selected" @endif>Texte
                                                riche
                                            </option>
                                            <option value="3" @if($item->type ==3) selected="selected" @endif>Raccourci
                                                rapide</option>
                                        </select>
                                    </div>
                                    <div class="form-group" id="div-raccourci_rapideId-form-position-thumbnail6"
                                        @if($item->
                                        type==3) style="display:
                                        block;"
                                        @else style="display: none;" @endif;>
                                        <label for="raccourci_rapideId">Choisir un raccourci</label>
                                        <select class="form-control" name="raccourci_rapideId">
                                            @foreach( $listRaccouciRapide as $Raccourci)
                                            <option value="{{ $Raccourci->id }}" @if(isset($item->raccourci_rapideId)
                                                && $item->raccourci_rapideId ==
                                                $Raccourci->id) selected="selected"@endif>{{ $Raccourci->titre_ar }}
                                            </option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group" id="div-lien_view-form-position-thumbnail6" @if($item->
                                        type==1)
                                        style="display: block;" @else
                                        style="display: none;" @endif;>
                                        <label for="slug">Choisir un module</label>

                                        @php
                                        $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' : 'addRows' )};
                                        $row = $dataTypeRows->where('field', 'lien_view')->first();
                                        @endphp
                                        {!! app('voyager')->formField($row, $dataType, $item) !!}
                                    </div>

                                    <div class="form-group col-lg-12 col-md-12"
                                        id="div-contenu-specific-form-position-thumbnail6" @if($item->
                                        type==2)
                                        style="display: block;padding-left: 0px;padding-right: 0px;" @else
                                        style="display: none;padding-left: 0px;padding-right: 0px;" @endif;>
                                        <button type="button" class="btn btn-success pull-right" data-toggle="modal"
                                            data-target="#modal-position-thumbnail6">
                                            Editer le contenu
                                        </button>
                                    </div>
                                    <div class="modal fade" id="modal-position-thumbnail6" dir="ltr">
                                        <div class="modal-dialog modal-lg">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Edition du contenu</h4>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <ul class="nav nav-tabs panel-heading"
                                                        style="background-color: #19b5fe;">
                                                        <li class="active panel-title"><a data-toggle="tab" href="#FR"
                                                                aria-expanded="true" style="color: white;"><img
                                                                    src="{{asset('images/fr.jpg')}}">
                                                                Français</a></li>
                                                        <li class="panel-title"><a data-toggle="tab" href="#AR"
                                                                aria-expanded="false" style="color: white;"><img
                                                                    src="{{asset('images/ar.png')}}">
                                                                العربية</a></li>
                                                        <li class="panel-title"><a data-toggle="tab" href="#EN"
                                                                aria-expanded="false" style="color: white;"><img
                                                                    src="{{asset('images/en.jpg')}}">
                                                                English</a>
                                                        </li>
                                                    </ul>
                                                    <div class="tab-content">
                                                        <div id="FR" class="tab-pane fade active in">
                                                            @php
                                                            $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                            'addRows' )};
                                                            $row = $dataTypeRows->where('field',
                                                            'contenu_specifique_fr')->first();
                                                            @endphp
                                                            {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                        </div>
                                                        <div id="AR" class="tab-pane fade" style="direction: rtl;">
                                                            @php
                                                            $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                            'addRows' )};
                                                            $row = $dataTypeRows->where('field',
                                                            'contenu_specifique_ar')->first();
                                                            @endphp
                                                            {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                        </div>
                                                        <div id="EN" class="tab-pane fade">
                                                            @php
                                                            $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                            'addRows' )};
                                                            $row = $dataTypeRows->where('field',
                                                            'contenu_specifique_en')->first();
                                                            @endphp
                                                            {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                        </div>
                                                    </div>
                                                    {{--
                                                                                                                                                                                                                                                                        --}}
                                                </div>
                                                <div class="modal-footer justify-content-between">
                                                    <button type="button" class="btn btn-default"
                                                        data-dismiss="modal">Annuler</button>
                                                    <button type="button" class="btn btn-primary"
                                                        data-dismiss="modal">Enregistrer</button>
                                                </div>
                                            </div>
                                            <!-- /.modal-content -->
                                        </div>
                                        <!-- /.modal-dialog -->
                                    </div>
                                    <!-- /.modal -->
                                    <button type="submit" class="btn btn-primary pull-right">
                                        Enregistrer
                                    </button>
                                </form>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="col-lg-12 col-md-12"
                                style="border-style: double;margin-bottom: 5px;overflow:auto;height: 225px;">
                                @php
                                $item=$dataTypeContent->where('position', '=','position-thumbnail7')->first();
                                @endphp
                                <form class="form-edit-add" role="form"
                                    action="@if(isset($item->id)){{ route('voyager.accueil-composants.update', $item->id) }}@else{{ route('voyager.accueil-composants.store') }}@endif"
                                    method="POST" enctype="multipart/form-data" id="form-position-thumbnail7">
                                    <!-- PUT Method if we are editing -->
                                    @if(isset($item->id))
                                    {{ method_field("PUT") }}
                                    @endif
                                    {{ csrf_field() }}
                                    @if (count($errors) > 0)
                                    <div class="alert alert-danger">
                                        <ul>
                                            @foreach ($errors->all() as $error)
                                            <li>{{ $error }}</li>
                                            @endforeach
                                        </ul>
                                    </div>
                                    @endif
                                    <input type="hidden" value="{{ $item->id }}" id="id" name="id">
                                    <input type="hidden" value="{{ $item->position }}" id="position" name="position">
                                    <input type="hidden" value="{{ $item->status }}" id="status" name="status">
                                    <input type="hidden" value="{{ $item->created_at }}" id="created_at"
                                        name="created_at">
                                    <div class="form-group">
                                        <label for="titre_ar">العنوان</label>
                                        <input type="text" class="form-control" id="titre_ar" name="titre_ar"
                                            placeholder="العنوان بالعربية" value="{{ $item->titre_ar }}"
                                            autocomplete="off">
                                    </div>
                                    <div class="form-group">
                                        <label for="titre_fr">Le titre</label>
                                        <input type="text" class="form-control" id="titre_fr" name="titre_fr"
                                            placeholder="Le titre en français" value="{{ $item->titre_fr }}"
                                            autocomplete="off">
                                    </div>
                                    <div class="form-group">
                                        <label for="titre_en">The title</label>
                                        <input type="text" class="form-control" id="titre_en" name="titre_en"
                                            placeholder="The title in english" value="{{ $item->titre_en }}"
                                            autocomplete="off">
                                    </div>
                                    <div class="form-group">
                                        <label for="slug">Type </label>

                                        <select class="form-control form_control" name="type"
                                            onchange="ChoisirType('form-position-thumbnail7')">
                                            <option value="1" @if($item->type ==1) selected="selected" @endif>Module
                                            </option>
                                            <option value="2" @if($item->type ==2) selected="selected" @endif>Texte
                                                riche
                                            </option>
                                            <option value="3" @if($item->type ==3) selected="selected" @endif>Raccourci
                                                rapide</option>
                                        </select>
                                    </div>
                                    <div class="form-group" id="div-raccourci_rapideId-form-position-thumbnail7"
                                        @if($item->
                                        type==3) style="display:
                                        block;"
                                        @else style="display: none;" @endif;>
                                        <label for="raccourci_rapideId">Choisir un raccourci</label>
                                        <select class="form-control" name="raccourci_rapideId">
                                            @foreach( $listRaccouciRapide as $Raccourci)
                                            <option value="{{ $Raccourci->id }}" @if(isset($item->raccourci_rapideId)
                                                && $item->raccourci_rapideId ==
                                                $Raccourci->id) selected="selected"@endif>{{ $Raccourci->titre_ar }}
                                            </option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group" id="div-lien_view-form-position-thumbnail7" @if($item->
                                        type==1)
                                        style="display: block;" @else
                                        style="display: none;" @endif;>
                                        <label for="slug">Choisir un module</label>

                                        @php
                                        $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' : 'addRows' )};
                                        $row = $dataTypeRows->where('field', 'lien_view')->first();
                                        @endphp
                                        {!! app('voyager')->formField($row, $dataType, $item) !!}
                                    </div>

                                    <div class="form-group col-lg-12 col-md-12"
                                        id="div-contenu-specific-form-position-thumbnail7" @if($item->
                                        type==2)
                                        style="display: block;padding-left: 0px;padding-right: 0px;" @else
                                        style="display: none;padding-left: 0px;padding-right: 0px;" @endif;>
                                        <button type="button" class="btn btn-success pull-right" data-toggle="modal"
                                            data-target="#modal-position-thumbnail7">
                                            Editer le contenu
                                        </button>
                                    </div>
                                    <div class="modal fade" id="modal-position-thumbnail7" dir="ltr">
                                        <div class="modal-dialog modal-lg">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Edition du contenu</h4>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <ul class="nav nav-tabs panel-heading"
                                                        style="background-color: #19b5fe;">
                                                        <li class="active panel-title"><a data-toggle="tab" href="#FR"
                                                                aria-expanded="true" style="color: white;"><img
                                                                    src="{{asset('images/fr.jpg')}}">
                                                                Français</a></li>
                                                        <li class="panel-title"><a data-toggle="tab" href="#AR"
                                                                aria-expanded="false" style="color: white;"><img
                                                                    src="{{asset('images/ar.png')}}">
                                                                العربية</a></li>
                                                        <li class="panel-title"><a data-toggle="tab" href="#EN"
                                                                aria-expanded="false" style="color: white;"><img
                                                                    src="{{asset('images/en.jpg')}}">
                                                                English</a>
                                                        </li>
                                                    </ul>
                                                    <div class="tab-content">
                                                        <div id="FR" class="tab-pane fade active in">
                                                            @php
                                                            $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                            'addRows' )};
                                                            $row = $dataTypeRows->where('field',
                                                            'contenu_specifique_fr')->first();
                                                            @endphp
                                                            {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                        </div>
                                                        <div id="AR" class="tab-pane fade" style="direction: rtl;">
                                                            @php
                                                            $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                            'addRows' )};
                                                            $row = $dataTypeRows->where('field',
                                                            'contenu_specifique_ar')->first();
                                                            @endphp
                                                            {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                        </div>
                                                        <div id="EN" class="tab-pane fade">
                                                            @php
                                                            $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                            'addRows' )};
                                                            $row = $dataTypeRows->where('field',
                                                            'contenu_specifique_en')->first();
                                                            @endphp
                                                            {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                        </div>
                                                    </div>
                                                    {{--
                                                                                                                                                                                                                                                                                                --}}
                                                </div>
                                                <div class="modal-footer justify-content-between">
                                                    <button type="button" class="btn btn-default"
                                                        data-dismiss="modal">Annuler</button>
                                                    <button type="button" class="btn btn-primary"
                                                        data-dismiss="modal">Enregistrer</button>
                                                </div>
                                            </div>
                                            <!-- /.modal-content -->
                                        </div>
                                        <!-- /.modal-dialog -->
                                    </div>
                                    <!-- /.modal -->
                                    <button type="submit" class="btn btn-primary pull-right">
                                        Enregistrer
                                    </button>
                                </form>
                            </div>
                            <div class="col-lg-12 col-md-12"
                                style="border-style: double;margin-bottom: 5px;overflow:auto;height: 220px;">
                                @php
                                $item=$dataTypeContent->where('position', '=','position-thumbnail8')->first();
                                @endphp
                                <form class="form-edit-add" role="form"
                                    action="@if(isset($item->id)){{ route('voyager.accueil-composants.update', $item->id) }}@else{{ route('voyager.accueil-composants.store') }}@endif"
                                    method="POST" enctype="multipart/form-data" id="form-position-thumbnail8">
                                    <!-- PUT Method if we are editing -->
                                    @if(isset($item->id))
                                    {{ method_field("PUT") }}
                                    @endif
                                    {{ csrf_field() }}
                                    @if (count($errors) > 0)
                                    <div class="alert alert-danger">
                                        <ul>
                                            @foreach ($errors->all() as $error)
                                            <li>{{ $error }}</li>
                                            @endforeach
                                        </ul>
                                    </div>
                                    @endif
                                    <input type="hidden" value="{{ $item->id }}" id="id" name="id">
                                    <input type="hidden" value="{{ $item->position }}" id="position" name="position">
                                    <input type="hidden" value="{{ $item->status }}" id="status" name="status">
                                    <input type="hidden" value="{{ $item->created_at }}" id="created_at"
                                        name="created_at">
                                    <div class="form-group">
                                        <label for="titre_ar">العنوان</label>
                                        <input type="text" class="form-control" id="titre_ar" name="titre_ar"
                                            placeholder="العنوان بالعربية" value="{{ $item->titre_ar }}"
                                            autocomplete="off">
                                    </div>
                                    <div class="form-group">
                                        <label for="titre_fr">Le titre</label>
                                        <input type="text" class="form-control" id="titre_fr" name="titre_fr"
                                            placeholder="Le titre en français" value="{{ $item->titre_fr }}"
                                            autocomplete="off">
                                    </div>
                                    <div class="form-group">
                                        <label for="titre_en">The title</label>
                                        <input type="text" class="form-control" id="titre_en" name="titre_en"
                                            placeholder="The title in english" value="{{ $item->titre_en }}"
                                            autocomplete="off">
                                    </div>
                                    <div class="form-group">
                                        <label for="slug">Type </label>

                                        <select class="form-control form_control" name="type"
                                            onchange="ChoisirType('form-position-thumbnail8')">
                                            <option value="1" @if($item->type ==1) selected="selected" @endif>Module
                                            </option>
                                            <option value="2" @if($item->type ==2) selected="selected" @endif>Texte
                                                riche
                                            </option>
                                            <option value="3" @if($item->type ==3) selected="selected" @endif>Raccourci
                                                rapide</option>
                                        </select>
                                    </div>
                                    <div class="form-group" id="div-raccourci_rapideId-form-position-thumbnail8"
                                        @if($item->
                                        type==3) style="display:
                                        block;"
                                        @else style="display: none;" @endif;>
                                        <label for="raccourci_rapideId">Choisir un raccourci</label>
                                        <select class="form-control" name="raccourci_rapideId">
                                            @foreach( $listRaccouciRapide as $Raccourci)
                                            <option value="{{ $Raccourci->id }}" @if(isset($item->raccourci_rapideId)
                                                && $item->raccourci_rapideId ==
                                                $Raccourci->id) selected="selected"@endif>{{ $Raccourci->titre_ar }}
                                            </option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group" id="div-lien_view-form-position-thumbnail8" @if($item->
                                        type==1)
                                        style="display: block;" @else
                                        style="display: none;" @endif;>
                                        <label for="slug">Choisir un module</label>

                                        @php
                                        $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' : 'addRows' )};
                                        $row = $dataTypeRows->where('field', 'lien_view')->first();
                                        @endphp
                                        {!! app('voyager')->formField($row, $dataType, $item) !!}
                                    </div>

                                    <div class="form-group col-lg-12 col-md-12"
                                        id="div-contenu-specific-form-position-thumbnail8" @if($item->
                                        type==2)
                                        style="display: block;padding-left: 0px;padding-right: 0px;" @else
                                        style="display: none;padding-left: 0px;padding-right: 0px;" @endif;>
                                        <button type="button" class="btn btn-success pull-right" data-toggle="modal"
                                            data-target="#modal-position-thumbnail8">
                                            Editer le contenu
                                        </button>
                                    </div>
                                    <div class="modal fade" id="modal-position-thumbnail8" dir="ltr">
                                        <div class="modal-dialog modal-lg">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Edition du contenu</h4>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <ul class="nav nav-tabs panel-heading"
                                                        style="background-color: #19b5fe;">
                                                        <li class="active panel-title"><a data-toggle="tab" href="#FR"
                                                                aria-expanded="true" style="color: white;"><img
                                                                    src="{{asset('images/fr.jpg')}}">
                                                                Français</a></li>
                                                        <li class="panel-title"><a data-toggle="tab" href="#AR"
                                                                aria-expanded="false" style="color: white;"><img
                                                                    src="{{asset('images/ar.png')}}">
                                                                العربية</a></li>
                                                        <li class="panel-title"><a data-toggle="tab" href="#EN"
                                                                aria-expanded="false" style="color: white;"><img
                                                                    src="{{asset('images/en.jpg')}}">
                                                                English</a>
                                                        </li>
                                                    </ul>
                                                    <div class="tab-content">
                                                        <div id="FR" class="tab-pane fade active in">
                                                            @php
                                                            $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                            'addRows' )};
                                                            $row = $dataTypeRows->where('field',
                                                            'contenu_specifique_fr')->first();
                                                            @endphp
                                                            {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                        </div>
                                                        <div id="AR" class="tab-pane fade" style="direction: rtl;">
                                                            @php
                                                            $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                            'addRows' )};
                                                            $row = $dataTypeRows->where('field',
                                                            'contenu_specifique_ar')->first();
                                                            @endphp
                                                            {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                        </div>
                                                        <div id="EN" class="tab-pane fade">
                                                            @php
                                                            $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                            'addRows' )};
                                                            $row = $dataTypeRows->where('field',
                                                            'contenu_specifique_en')->first();
                                                            @endphp
                                                            {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                        </div>
                                                    </div>
                                                    {{--
                                                                                                                                                                                                                                                                                                --}}
                                                </div>
                                                <div class="modal-footer justify-content-between">
                                                    <button type="button" class="btn btn-default"
                                                        data-dismiss="modal">Annuler</button>
                                                    <button type="button" class="btn btn-primary"
                                                        data-dismiss="modal">Enregistrer</button>
                                                </div>
                                            </div>
                                            <!-- /.modal-content -->
                                        </div>
                                        <!-- /.modal-dialog -->
                                    </div>
                                    <!-- /.modal -->
                                    <button type="submit" class="btn btn-primary pull-right">
                                        Enregistrer
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6" style="border-style: double;margin-bottom: 5px;height: 450px;">
                        @php
                        $item=$dataTypeContent->where('position', '=','position-media')->first();
                        @endphp
                        <form class="form-edit-add" role="form"
                            action="@if(isset($item->id)){{ route('voyager.accueil-composants.update', $item->id) }}@else{{ route('voyager.accueil-composants.store') }}@endif"
                            method="POST" enctype="multipart/form-data" id="form-position-media">
                            <!-- PUT Method if we are editing -->
                            @if(isset($item->id))
                            {{ method_field("PUT") }}
                            @endif
                            {{ csrf_field() }}
                            @if (count($errors) > 0)
                            <div class="alert alert-danger">
                                <ul>
                                    @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                            @endif
                            <input type="hidden" value="{{ $item->id }}" id="id" name="id">
                            <input type="hidden" value="{{ $item->position }}" id="position" name="position">
                            <input type="hidden" value="{{ $item->status }}" id="status" name="status">
                            <input type="hidden" value="{{ $item->created_at }}" id="created_at" name="created_at">
                            <div class="form-group">
                                <label for="titre_ar">العنوان</label>
                                <input type="text" class="form-control" id="titre_ar" name="titre_ar"
                                    placeholder="العنوان بالعربية" value="{{ $item->titre_ar }}" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="titre_fr">Le titre</label>
                                <input type="text" class="form-control" id="titre_fr" name="titre_fr"
                                    placeholder="Le titre en français" value="{{ $item->titre_fr }}" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="titre_en">The title</label>
                                <input type="text" class="form-control" id="titre_en" name="titre_en"
                                    placeholder="The title in english" value="{{ $item->titre_en }}" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="slug">Type </label>

                                <select class="form-control form_control" name="type"
                                    onchange="ChoisirType('form-position-media')">
                                    <option value="1" @if($item->type ==1) selected="selected" @endif>Module</option>
                                    <option value="2" @if($item->type ==2) selected="selected" @endif>Texte riche
                                    </option>
                                    <option value="3" @if($item->type ==3) selected="selected" @endif>Raccourci rapide
                                    </option>
                                </select>
                            </div>
                            <div class="form-group" id="div-raccourci_rapideId-form-position-media" @if($item->
                                type==3) style="display: block;"
                                @else style="display: none;" @endif;>
                                <label for="raccourci_rapideId">Choisir un raccourci</label>
                                <select class="form-control" name="raccourci_rapideId">
                                    @foreach( $listRaccouciRapide as $Raccourci)
                                    <option value="{{ $Raccourci->id }}" @if(isset($item->raccourci_rapideId)
                                        && $item->raccourci_rapideId ==
                                        $Raccourci->id) selected="selected"@endif>{{ $Raccourci->titre_ar }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group" id="div-lien_view-form-position-media" @if($item->type==1)
                                style="display: block;" @else
                                style="display: none;" @endif;>
                                <label for="slug">Choisir un module</label>

                                @php
                                $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' : 'addRows' )};
                                $row = $dataTypeRows->where('field', 'lien_view')->first();
                                @endphp
                                {!! app('voyager')->formField($row, $dataType, $item) !!}
                            </div>

                            <div class="form-group col-lg-12 col-md-12" id="div-contenu-specific-form-position-media"
                                @if($item->
                                type==2)
                                style="display: block;padding-left: 0px;padding-right: 0px;" @else
                                style="display: none;padding-left: 0px;padding-right: 0px;" @endif;>
                                <button type="button" class="btn btn-success pull-right" data-toggle="modal"
                                    data-target="#modal-position-media">
                                    Editer le contenu
                                </button>
                            </div>
                            <div class="modal fade" id="modal-position-media" dir="ltr">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title">Edition du contenu</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <ul class="nav nav-tabs panel-heading" style="background-color: #19b5fe;">
                                                <li class="active panel-title"><a data-toggle="tab" href="#FR"
                                                        aria-expanded="true" style="color: white;"><img
                                                            src="{{asset('images/fr.jpg')}}">
                                                        Français</a></li>
                                                <li class="panel-title"><a data-toggle="tab" href="#AR"
                                                        aria-expanded="false" style="color: white;"><img
                                                            src="{{asset('images/ar.png')}}">
                                                        العربية</a></li>
                                                <li class="panel-title"><a data-toggle="tab" href="#EN"
                                                        aria-expanded="false" style="color: white;"><img
                                                            src="{{asset('images/en.jpg')}}">
                                                        English</a>
                                                </li>
                                            </ul>
                                            <div class="tab-content">
                                                <div id="FR" class="tab-pane fade active in">
                                                    @php
                                                    $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                    'addRows' )};
                                                    $row = $dataTypeRows->where('field',
                                                    'contenu_specifique_fr')->first();
                                                    @endphp
                                                    {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                </div>
                                                <div id="AR" class="tab-pane fade" style="direction: rtl;">
                                                    @php
                                                    $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                    'addRows' )};
                                                    $row = $dataTypeRows->where('field',
                                                    'contenu_specifique_ar')->first();
                                                    @endphp
                                                    {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                </div>
                                                <div id="EN" class="tab-pane fade">
                                                    @php
                                                    $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                    'addRows' )};
                                                    $row = $dataTypeRows->where('field',
                                                    'contenu_specifique_en')->first();
                                                    @endphp
                                                    {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                </div>
                                            </div>
                                            {{--
                                                                                                                                                                                --}}
                                        </div>
                                        <div class="modal-footer justify-content-between">
                                            <button type="button" class="btn btn-default"
                                                data-dismiss="modal">Annuler</button>
                                            <button type="button" class="btn btn-primary"
                                                data-dismiss="modal">Enregistrer</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->
                            <button type="submit" class="btn btn-primary pull-right">
                                Enregistrer
                            </button>
                        </form>
                    </div>
                    <div class="col-lg-6 col-md-6" style="border-style: double;margin-bottom: 5px;height: 450px;">
                        @php
                        $item=$dataTypeContent->where('position', '=','position-gallerie')->first();
                        @endphp
                        <form class="form-edit-add" role="form"
                            action="@if(isset($item->id)){{ route('voyager.accueil-composants.update', $item->id) }}@else{{ route('voyager.accueil-composants.store') }}@endif"
                            method="POST" enctype="multipart/form-data" id="form-position-gallerie">
                            <!-- PUT Method if we are editing -->
                            @if(isset($item->id))
                            {{ method_field("PUT") }}
                            @endif
                            {{ csrf_field() }}
                            @if (count($errors) > 0)
                            <div class="alert alert-danger">
                                <ul>
                                    @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                            @endif
                            <input type="hidden" value="{{ $item->id }}" id="id" name="id">
                            <input type="hidden" value="{{ $item->position }}" id="position" name="position">
                            <input type="hidden" value="{{ $item->status }}" id="status" name="status">
                            <input type="hidden" value="{{ $item->created_at }}" id="created_at" name="created_at">
                            <div class="form-group">
                                <label for="titre_ar">العنوان</label>
                                <input type="text" class="form-control" id="titre_ar" name="titre_ar"
                                    placeholder="العنوان بالعربية" value="{{ $item->titre_ar }}" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="titre_fr">Le titre</label>
                                <input type="text" class="form-control" id="titre_fr" name="titre_fr"
                                    placeholder="Le titre en français" value="{{ $item->titre_fr }}" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="titre_en">The title</label>
                                <input type="text" class="form-control" id="titre_en" name="titre_en"
                                    placeholder="The title in english" value="{{ $item->titre_en }}" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="slug">Type </label>

                                <select class="form-control form_control" name="type"
                                    onchange="ChoisirType('form-position-gallerie')">
                                    <option value="1" @if($item->type ==1) selected="selected" @endif>Module</option>
                                    <option value="2" @if($item->type ==2) selected="selected" @endif>Texte riche
                                    </option>
                                    <option value="3" @if($item->type ==3) selected="selected" @endif>Raccourci rapide
                                    </option>
                                </select>
                            </div>
                            <div class="form-group" id="div-raccourci_rapideId-form-position-gallerie" @if($item->
                                type==3)
                                style="display: block;"
                                @else style="display: none;" @endif;>
                                <label for="raccourci_rapideId">Choisir un raccourci</label>
                                <select class="form-control" name="raccourci_rapideId">
                                    @foreach( $listRaccouciRapide as $Raccourci)
                                    <option value="{{ $Raccourci->id }}" @if(isset($item->raccourci_rapideId)
                                        && $item->raccourci_rapideId ==
                                        $Raccourci->id) selected="selected"@endif>{{ $Raccourci->titre_ar }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group" id="div-lien_view-form-position-gallerie" @if($item->type==1)
                                style="display: block;" @else
                                style="display: none;" @endif;>
                                <label for="slug">Choisir un module</label>

                                @php
                                $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' : 'addRows' )};
                                $row = $dataTypeRows->where('field', 'lien_view')->first();
                                @endphp
                                {!! app('voyager')->formField($row, $dataType, $item) !!}
                            </div>

                            <div class="form-group col-lg-12 col-md-12" id="div-contenu-specific-form-position-gallerie"
                                @if($item->type==2)
                                style="display: block;padding-left: 0px;padding-right: 0px;" @else
                                style="display: none;padding-left: 0px;padding-right: 0px;" @endif;>
                                <button type="button" class="btn btn-success pull-right" data-toggle="modal"
                                    data-target="#modal-position-gallerie">
                                    Editer le contenu
                                </button>
                            </div>
                            <div class="modal fade" id="modal-position-gallerie" dir="ltr">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title">Edition du contenu</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <ul class="nav nav-tabs panel-heading" style="background-color: #19b5fe;">
                                                <li class="active panel-title"><a data-toggle="tab" href="#FR"
                                                        aria-expanded="true" style="color: white;"><img
                                                            src="{{asset('images/fr.jpg')}}">
                                                        Français</a></li>
                                                <li class="panel-title"><a data-toggle="tab" href="#AR"
                                                        aria-expanded="false" style="color: white;"><img
                                                            src="{{asset('images/ar.png')}}">
                                                        العربية</a></li>
                                                <li class="panel-title"><a data-toggle="tab" href="#EN"
                                                        aria-expanded="false" style="color: white;"><img
                                                            src="{{asset('images/en.jpg')}}">
                                                        English</a>
                                                </li>
                                            </ul>
                                            <div class="tab-content">
                                                <div id="FR" class="tab-pane fade active in">
                                                    @php
                                                    $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                    'addRows' )};
                                                    $row = $dataTypeRows->where('field',
                                                    'contenu_specifique_fr')->first();
                                                    @endphp
                                                    {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                </div>
                                                <div id="AR" class="tab-pane fade" style="direction: rtl;">
                                                    @php
                                                    $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                    'addRows' )};
                                                    $row = $dataTypeRows->where('field',
                                                    'contenu_specifique_ar')->first();
                                                    @endphp
                                                    {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                </div>
                                                <div id="EN" class="tab-pane fade">
                                                    @php
                                                    $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                    'addRows' )};
                                                    $row = $dataTypeRows->where('field',
                                                    'contenu_specifique_en')->first();
                                                    @endphp
                                                    {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                </div>
                                            </div>
                                            {{--
                                                                                                                                                                                                            --}}
                                        </div>
                                        <div class="modal-footer justify-content-between">
                                            <button type="button" class="btn btn-default"
                                                data-dismiss="modal">Annuler</button>
                                            <button type="button" class="btn btn-primary"
                                                data-dismiss="modal">Enregistrer</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->
                            <button type="submit" class="btn btn-primary pull-right">
                                Enregistrer
                            </button>
                        </form>
                    </div>
                    <div class="col-lg-6 col-md-6" style="border-style: double;margin-bottom: 5px;height: 450px;">
                        @php
                        $item=$dataTypeContent->where('position', '=','position-reading')->first();
                        @endphp
                        <form class="form-edit-add" role="form"
                            action="@if(isset($item->id)){{ route('voyager.accueil-composants.update', $item->id) }}@else{{ route('voyager.accueil-composants.store') }}@endif"
                            method="POST" enctype="multipart/form-data" id="form-position-reading">
                            <!-- PUT Method if we are editing -->
                            @if(isset($item->id))
                            {{ method_field("PUT") }}
                            @endif
                            {{ csrf_field() }}
                            @if (count($errors) > 0)
                            <div class="alert alert-danger">
                                <ul>
                                    @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                            @endif
                            <input type="hidden" value="{{ $item->id }}" id="id" name="id">
                            <input type="hidden" value="{{ $item->position }}" id="position" name="position">
                            <input type="hidden" value="{{ $item->status }}" id="status" name="status">
                            <input type="hidden" value="{{ $item->created_at }}" id="created_at" name="created_at">
                            <div class="form-group">
                                <label for="titre_ar">العنوان</label>
                                <input type="text" class="form-control" id="titre_ar" name="titre_ar"
                                    placeholder="العنوان بالعربية" value="{{ $item->titre_ar }}" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="titre_fr">Le titre</label>
                                <input type="text" class="form-control" id="titre_fr" name="titre_fr"
                                    placeholder="Le titre en français" value="{{ $item->titre_fr }}" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="titre_en">The title</label>
                                <input type="text" class="form-control" id="titre_en" name="titre_en"
                                    placeholder="The title in english" value="{{ $item->titre_en }}" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="slug">Type </label>

                                <select class="form-control form_control" name="type"
                                    onchange="ChoisirType('form-position-reading')">
                                    <option value="1" @if($item->type ==1) selected="selected" @endif>Module</option>
                                    <option value="2" @if($item->type ==2) selected="selected" @endif>Texte riche
                                    </option>
                                    <option value="3" @if($item->type ==3) selected="selected" @endif>Raccourci rapide
                                    </option>
                                </select>
                            </div>
                            <div class="form-group" id="div-raccourci_rapideId-form-position-reading" @if($item->
                                type==3) style="display: block;"
                                @else style="display: none;" @endif;>
                                <label for="raccourci_rapideId">Choisir un raccourci</label>
                                <select class="form-control" name="raccourci_rapideId">
                                    @foreach( $listRaccouciRapide as $Raccourci)
                                    <option value="{{ $Raccourci->id }}" @if(isset($item->raccourci_rapideId)
                                        && $item->raccourci_rapideId ==
                                        $Raccourci->id) selected="selected"@endif>{{ $Raccourci->titre_ar }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group" id="div-lien_view-form-position-reading" @if($item->type==1)
                                style="display: block;" @else
                                style="display: none;" @endif;>
                                <label for="slug">Choisir un module</label>

                                @php
                                $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' : 'addRows' )};
                                $row = $dataTypeRows->where('field', 'lien_view')->first();
                                @endphp
                                {!! app('voyager')->formField($row, $dataType, $item) !!}
                            </div>

                            <div class="form-group col-lg-12 col-md-12" id="div-contenu-specific-form-position-reading"
                                @if($item->
                                type==2)
                                style="display: block;padding-left: 0px;padding-right: 0px;" @else
                                style="display: none;padding-left: 0px;padding-right: 0px;" @endif;>
                                <button type="button" class="btn btn-success pull-right" data-toggle="modal"
                                    data-target="#modal-position-reading">
                                    Editer le contenu
                                </button>
                            </div>
                            <div class="modal fade" id="modal-position-reading" dir="ltr">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title">Edition du contenu</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <ul class="nav nav-tabs panel-heading" style="background-color: #19b5fe;">
                                                <li class="active panel-title"><a data-toggle="tab" href="#FR"
                                                        aria-expanded="true" style="color: white;"><img
                                                            src="{{asset('images/fr.jpg')}}">
                                                        Français</a></li>
                                                <li class="panel-title"><a data-toggle="tab" href="#AR"
                                                        aria-expanded="false" style="color: white;"><img
                                                            src="{{asset('images/ar.png')}}">
                                                        العربية</a></li>
                                                <li class="panel-title"><a data-toggle="tab" href="#EN"
                                                        aria-expanded="false" style="color: white;"><img
                                                            src="{{asset('images/en.jpg')}}">
                                                        English</a>
                                                </li>
                                            </ul>
                                            <div class="tab-content">
                                                <div id="FR" class="tab-pane fade active in">
                                                    @php
                                                    $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                    'addRows' )};
                                                    $row = $dataTypeRows->where('field',
                                                    'contenu_specifique_fr')->first();
                                                    @endphp
                                                    {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                </div>
                                                <div id="AR" class="tab-pane fade" style="direction: rtl;">
                                                    @php
                                                    $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                    'addRows' )};
                                                    $row = $dataTypeRows->where('field',
                                                    'contenu_specifique_ar')->first();
                                                    @endphp
                                                    {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                </div>
                                                <div id="EN" class="tab-pane fade">
                                                    @php
                                                    $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                    'addRows' )};
                                                    $row = $dataTypeRows->where('field',
                                                    'contenu_specifique_en')->first();
                                                    @endphp
                                                    {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                </div>
                                            </div>
                                            {{--
                                                                                                                                                                                                    --}}
                                        </div>
                                        <div class="modal-footer justify-content-between">
                                            <button type="button" class="btn btn-default"
                                                data-dismiss="modal">Annuler</button>
                                            <button type="button" class="btn btn-primary"
                                                data-dismiss="modal">Enregistrer</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->
                            <button type="submit" class="btn btn-primary pull-right">
                                Enregistrer
                            </button>
                        </form>
                    </div>
                    <div class="col-lg-6 col-md-6" style="border-style: double;margin-bottom: 5px;height: 450px;">
                        @php
                        $item=$dataTypeContent->where('position', '=','position-poll')->first();
                        @endphp
                        <form class="form-edit-add" role="form"
                            action="@if(isset($item->id)){{ route('voyager.accueil-composants.update', $item->id) }}@else{{ route('voyager.accueil-composants.store') }}@endif"
                            method="POST" enctype="multipart/form-data" id="form-position-poll">
                            <!-- PUT Method if we are editing -->
                            @if(isset($item->id))
                            {{ method_field("PUT") }}
                            @endif
                            {{ csrf_field() }}
                            @if (count($errors) > 0)
                            <div class="alert alert-danger">
                                <ul>
                                    @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                            @endif
                            <input type="hidden" value="{{ $item->id }}" id="id" name="id">
                            <input type="hidden" value="{{ $item->position }}" id="position" name="position">
                            <input type="hidden" value="{{ $item->status }}" id="status" name="status">
                            <input type="hidden" value="{{ $item->created_at }}" id="created_at" name="created_at">
                            <div class="form-group">
                                <label for="titre_ar">العنوان</label>
                                <input type="text" class="form-control" id="titre_ar" name="titre_ar"
                                    placeholder="العنوان بالعربية" value="{{ $item->titre_ar }}" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="titre_fr">Le titre</label>
                                <input type="text" class="form-control" id="titre_fr" name="titre_fr"
                                    placeholder="Le titre en français" value="{{ $item->titre_fr }}" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="titre_en">The title</label>
                                <input type="text" class="form-control" id="titre_en" name="titre_en"
                                    placeholder="The title in english" value="{{ $item->titre_en }}" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="slug">Type </label>

                                <select class="form-control form_control" name="type"
                                    onchange="ChoisirType('form-position-poll')">
                                    <option value="1" @if($item->type ==1) selected="selected" @endif>Module</option>
                                    <option value="2" @if($item->type ==2) selected="selected" @endif>Texte riche
                                    </option>
                                    <option value="3" @if($item->type ==3) selected="selected" @endif>Raccourci rapide
                                    </option>
                                </select>
                            </div>
                            <div class="form-group" id="div-raccourci_rapideId-form-position-poll" @if($item->type==3)
                                style="display: block;"
                                @else style="display: none;" @endif;>
                                <label for="raccourci_rapideId">Choisir un raccourci</label>
                                <select class="form-control" name="raccourci_rapideId">
                                    @foreach( $listRaccouciRapide as $Raccourci)
                                    <option value="{{ $Raccourci->id }}" @if(isset($item->raccourci_rapideId)
                                        && $item->raccourci_rapideId ==
                                        $Raccourci->id) selected="selected"@endif>{{ $Raccourci->titre_ar }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group" id="div-lien_view-form-position-poll" @if($item->type==1)
                                style="display: block;" @else
                                style="display: none;" @endif;>
                                <label for="slug">Choisir un module</label>

                                @php
                                $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' : 'addRows' )};
                                $row = $dataTypeRows->where('field', 'lien_view')->first();
                                @endphp
                                {!! app('voyager')->formField($row, $dataType, $item) !!}
                            </div>

                            <div class="form-group col-lg-12 col-md-12" id="div-contenu-specific-form-position-poll"
                                @if($item->type==2)
                                style="display: block;padding-left: 0px;padding-right: 0px;" @else
                                style="display: none;padding-left: 0px;padding-right: 0px;" @endif;>
                                <button type="button" class="btn btn-success pull-right" data-toggle="modal"
                                    data-target="#modal-position-poll">
                                    Editer le contenu
                                </button>
                            </div>
                            <div class="modal fade" id="modal-position-poll" dir="ltr">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title">Edition du contenu</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <ul class="nav nav-tabs panel-heading" style="background-color: #19b5fe;">
                                                <li class="active panel-title"><a data-toggle="tab" href="#FR"
                                                        aria-expanded="true" style="color: white;"><img
                                                            src="{{asset('images/fr.jpg')}}">
                                                        Français</a></li>
                                                <li class="panel-title"><a data-toggle="tab" href="#AR"
                                                        aria-expanded="false" style="color: white;"><img
                                                            src="{{asset('images/ar.png')}}">
                                                        العربية</a></li>
                                                <li class="panel-title"><a data-toggle="tab" href="#EN"
                                                        aria-expanded="false" style="color: white;"><img
                                                            src="{{asset('images/en.jpg')}}">
                                                        English</a>
                                                </li>
                                            </ul>
                                            <div class="tab-content">
                                                <div id="FR" class="tab-pane fade active in">
                                                    @php
                                                    $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                    'addRows' )};
                                                    $row = $dataTypeRows->where('field',
                                                    'contenu_specifique_fr')->first();
                                                    @endphp
                                                    {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                </div>
                                                <div id="AR" class="tab-pane fade" style="direction: rtl;">
                                                    @php
                                                    $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                    'addRows' )};
                                                    $row = $dataTypeRows->where('field',
                                                    'contenu_specifique_ar')->first();
                                                    @endphp
                                                    {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                </div>
                                                <div id="EN" class="tab-pane fade">
                                                    @php
                                                    $dataTypeRows = $dataType->{(isset($item->id) ? 'editRows' :
                                                    'addRows' )};
                                                    $row = $dataTypeRows->where('field',
                                                    'contenu_specifique_en')->first();
                                                    @endphp
                                                    {!! app('voyager')->formField($row, $dataType, $item) !!}
                                                </div>
                                            </div>
                                            {{--
                                                                                                                                                                                                                                --}}
                                        </div>
                                        <div class="modal-footer justify-content-between">
                                            <button type="button" class="btn btn-default"
                                                data-dismiss="modal">Annuler</button>
                                            <button type="button" class="btn btn-primary"
                                                data-dismiss="modal">Enregistrer</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->
                            <button type="submit" class="btn btn-primary pull-right">
                                Enregistrer
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@stop

@section('css')
@if(!$dataType->server_side && config('dashboard.data_tables.responsive'))
<link rel="stylesheet" href="{{ voyager_asset('lib/css/responsive.dataTables.min.css') }}">
@endif
@stop

@section('javascript')
<!-- DataTables -->
@if(!$dataType->server_side && config('dashboard.data_tables.responsive'))
<script src="{{ voyager_asset('lib/js/dataTables.responsive.min.js') }}"></script>
@endif
<script>
    function ChoisirType(idform){
var type = $('#'+idform+'').find('select[name=type]').val();
if(type=="1"){
document.getElementById("div-lien_view-"+idform+"").style.display="block";
document.getElementById("div-raccourci_rapideId-"+idform+"").style.display="none";
document.getElementById("div-contenu-specific-"+idform+"").style.display="none";
}
else if(type=="2"){
document.getElementById("div-lien_view-"+idform+"").style.display="none";
document.getElementById("div-raccourci_rapideId-"+idform+"").style.display="none";
document.getElementById("div-contenu-specific-"+idform+"").style.display="block";
}
else{
document.getElementById("div-lien_view-"+idform+"").style.display="none";
document.getElementById("div-raccourci_rapideId-"+idform+"").style.display="block";
document.getElementById("div-contenu-specific-"+idform+"").style.display="none";
}
    }
    function ShowModal()
    {
         $('#archive_modal').modal('show');
         document.getElementById('date_deb').value=document.getElementById('date_deb1').value;
         document.getElementById('date_fin').value=document.getElementById('date_fin1').value;
    }
        $(document).ready(function () {

            @if (!$dataType->server_side)
                var table = $('#dataTable').DataTable({!! json_encode(
                    array_merge([
                        "order" => $orderColumn,
                        "language" => __('voyager::datatable'),
                        "columnDefs" => [['targets' => -1, 'searchable' =>  false, 'orderable' => false]],
                    ],
                    config('voyager.dashboard.data_tables', []))
                , true) !!});
            @else
                $('#search-input select').select2({
                    minimumResultsForSearch: Infinity
                });
            @endif

            @if ($isModelTranslatable)
                $('.side-body').multilingual();
                //Reinitialise the multilingual features when they change tab
                $('#dataTable').on('draw.dt', function(){
                    $('.side-body').data('multilingual').init();
                })
            @endif
            $('.select_all').on('click', function(e) {
                $('input[name="row_id"]').prop('checked', $(this).prop('checked'));
            });
        });

        var deleteFormAction;
        $('td').on('click', '.delete', function (e) {
            $('#delete_form')[0].action = '{{ route('voyager.'.$dataType->slug.'.destroy', ['id' => '__id']) }}'.replace('__id', $(this).data('id'));
            $('#delete_modal').modal('show');
        });

        @if($usesSoftDeletes)
            @php
                $params = [
                    's' => $search->value,
                    'filter' => $search->filter,
                    'key' => $search->key,
                    'order_by' => $orderBy,
                    'sort_order' => $sortOrder,
                ];
            @endphp
            $(function() {
                $('#show_soft_deletes').change(function() {
                    if ($(this).prop('checked')) {
                        $('#dataTable').before('<a id="redir" href="{{ (route('voyager.'.$dataType->slug.'.index', array_merge($params, ['showSoftDeleted' => 1]), true)) }}"></a>');
                    }else{
                        $('#dataTable').before('<a id="redir" href="{{ (route('voyager.'.$dataType->slug.'.index', array_merge($params, ['showSoftDeleted' => 0]), true)) }}"></a>');
                    }

                    $('#redir')[0].click();
                })
            })
        @endif
        $('input[name="row_id"]').on('change', function () {
            var ids = [];
            $('input[name="row_id"]').each(function() {
                if ($(this).is(':checked')) {
                    ids.push($(this).val());
                }
            });
            $('.selected_ids').val(ids);
        });
</script>
@stop
