@extends('voyager::master')

@section('page_title', __('voyager::generic.view').' '.$dataType->display_name_singular)

@section('page_header')
<h1 class="page-title">
    <i class="{{ $dataType->icon }}"></i> {{ __('voyager::generic.viewing') }}
    {{ ucfirst($dataType->display_name_singular) }} &nbsp;

    <a href="{{ route('voyager.'.$dataType->slug.'.index') }}" class="btn btn-warning">
        <span class="glyphicon glyphicon-list"></span>&nbsp;
        {{ __('voyager::generic.return_to_list') }}
    </a>
</h1>
@include('voyager::multilingual.language-selector')
@stop
@php
$sexe="";
$identitfie="";
$trancheAge="";
$titre_denonciation="";
if ($Denonciation->Sexe==2)
{
$sexe="Femme";
}
elseif($Denonciation->Sexe==1)
{
$sexe="Homme";
}
if ($Denonciation->identifie==0) {
# code...
$identitfie="Non";
}
else {
# code...
$identitfie="Oui";
}
if($Denonciation->type_personne=='1')
{
$titre_denonciation="Dénonciation Physique";
}
else {
$titre_denonciation="Dénonciation Morale";
}
@endphp

@section('content')
<div class="page-content read container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-bordered" style="padding-bottom:5px;">
                <!-- form start -->
                <div class="panel-body">
                    <h3 class="card-title">{{$titre_denonciation}}</h3>
                    <div class="card card-rec card-outline">
                        <!-- /.card-header -->
                        @if ($Denonciation->type_personne=='1')
                        {{--Personne physique--}}
                        <div class="row" style="padding: 15px;">
                            <div class="col-lg-7 bckg1">
                                <div class="info">
                                    <div class=" align col-lg-3 col-md-4">
                                        <label for="Nom">{{ __('libelle.Nom') }} * :</label>
                                        <p>{{ $Denonciation->Nom }}</p>
                                    </div>
                                    <div class="align col-lg-3 col-md-4">
                                        <label for="Prenom">{{ __('libelle.prenom') }} * :</label>
                                        <p>{{ $Denonciation->Prenom }}</p>
                                    </div>
                                    <div class=" align col-lg-3 col-md-4">
                                        <label for="CIN">{{ __('libelle.cin') }} * :</label>
                                        <p>{{ $Denonciation->CIN }}</p>
                                    </div>
                                    <div class="  align col-lg-3 col-md-3">
                                        <label for="CIN"> {{ __('libelle.sexe') }} :</label>
                                        <p>{{$sexe}}</p>
                                    </div>
                                </div>
                                <div class="align col-lg-4 col-md-3">
                                    <label for="tel">{{ __('libelle.Telephone') }}* :</label>
                                    <p>{{  $Denonciation->tel  }}</p>
                                </div>
                                <div class="align col-lg-4 col-md-3">
                                    <label for="tel">{{ __('libelle.Email') }}</label>
                                    <p>{{  $Denonciation->email }} </p>
                                </div>
                                <div class=" align col-lg-4 col-md-3">
                                    <label for="Profession"> {{ __('libelle.adresse') }} * :</label>
                                    <p>{{  $Denonciation->adresse }} </p>
                                </div>
                                <div class=" align col-lg-4 col-md-4">
                                    <label for="CIN">{{ __('libelle.tranche-age') }} :</label>
                                    <p style="direction: rtl;">{{ $Denonciation->TrancheAge }}</p>
                                </div>

                                <div class="align col-lg-4 col-md-3">
                                    <label for="Profession">{{ __('libelle.Fonction') }} :</label>
                                    <p>{{ $Denonciation->Profession }}</p>
                                </div>

                                <div class="align col-lg-4 col-md-3">
                                    <label for="Gouvernorat">{{ __('libelle.gov') }} :</label>
                                    <p>{{  $Denonciation->Gouvernorat }} </p>
                                </div>
                                <div class="align col-lg-12 col-md-3">
                                    <label for="CIN"> {{ __('libelle.Verification-Identite') }} * :
                                    </label>
                                    <p>{{$identitfie }} </p>
                                </div>
                            </div>
                            <div class="col-md-offset-1 col-lg-4 bckg1">
                                <div class="align col-lg-12 col-md-3">
                                    <label for="personne_signale">{{ __('libelle.Personne-signalee') }} : </label>
                                    <p>{{  $Denonciation->personne_signale }} </p>
                                </div>
                                <div class="align col-lg-12 col-md-3">
                                    <label for="structure_signale">{{ __('libelle.Structure-rapporte') }} : </label>
                                    <p>{{  $Denonciation->structure_signale }} </p>
                                </div>
                                <div class="align col-lg-12 col-md-3">
                                    <label for="secteur"> {{ __('libelle.secteur') }} : </label>
                                    <p>{{  $Denonciation->secteur }} </p>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 description">
                                <label for="description">Le {{ __('libelle.sujet') }} * :</label>
                                <p>{{$Denonciation->description}}</p>
                            </div>
                            <div class="col-lg-12">
                                <label for="description">Pièces Jointes :</label>
                                @if(!empty($Denonciation->PiecesJointes))
                                <div class="bg-piece">
                                    @foreach(json_decode($Denonciation->PiecesJointes, true) as $fichier)
                                    @php
                                    $split = explode("/", $fichier);
                                    @endphp
                                    <a class="attachment"
                                        href="{{ route('voyager.'.$dataType->slug.'.file.download') }}?file={{ $fichier }}"
                                        target="_blank">
                                        <span class="mailbox-attachment-icon"><i class="voyager-download"></i></span>
                                        <span> {{ $split[count($split)-1] }} </span>
                                    </a>
                                    @endforeach
                                </div>
                                @else

                                <p>Pas de pièces jointes à afficher.</p>

                                @endif
                            </div>
                        </div>
                        @elseif($Denonciation->type_personne=='2')
                        {{--Personne morale--}}
                        <div class="row" style="padding: 15px;">
                            <div class="col-md-offset-1 col-lg-9 col-md-offset-1 bckg1">
                                <div class="align col-lg-4 col-md-3">
                                    <label for="tel">{{ __('libelle.raison-sociale') }}* :</label>
                                    <p>{{  $Denonciation->tel  }}</p>
                                </div>
                                <div class="align col-lg-4 col-md-3">
                                    <label for="tel">{{ __('libelle.Telephone') }}* :</label>
                                    <p>{{  $Denonciation->tel  }}</p>
                                </div>
                                <div class="align col-lg-4 col-md-3">
                                    <label for="tel">{{ __('libelle.Email') }} :</label>
                                    <p>{{  $Denonciation->email }} </p>
                                </div>
                                <div class=" align col-lg-4 col-md-3">
                                    <label for="Profession"> {{ __('libelle.adresse') }} * :</label>
                                    <p>{{  $Denonciation->adresse }} </p>
                                </div>
                                <div class="align col-lg-4 col-md-3">
                                    <label for="structure_signale">{{ __('libelle.Structure-rapporte') }} : </label>
                                    <p>{{  $Denonciation->structure_signale }} </p>
                                </div>
                                <div class="align col-lg-4 col-md-3">
                                    <label for="secteur"> {{ __('libelle.secteur') }} : </label>
                                    <p>{{  $Denonciation->secteur }} </p>
                                </div>
                                <div class="align col-lg-12 col-md-3">
                                    <label for="CIN"> {{ __('libelle.Verification-Identite') }} * :
                                    </label>
                                    <p>{{$identitfie }} </p>
                                </div>

                            </div>

                            <div class="col-lg-12 col-md-12 description">
                                <label for="description">Le {{ __('libelle.sujet') }} * :</label>
                                <p>{{$Denonciation->description}}</p>
                            </div>
                            <div class="col-lg-12">
                                <label for="description">Pièces Jointes :</label>
                                @if(!empty($Denonciation->PiecesJointes))
                                <div class="bg-piece">
                                    @foreach(json_decode($Denonciation->PiecesJointes, true) as $fichier)
                                    @php
                                    $split = explode("/", $fichier);
                                    @endphp
                                    <a class="attachment"
                                        href="{{ route('voyager.'.$dataType->slug.'.file.download') }}?file={{ $fichier }}"
                                        target="_blank">
                                        <span class="mailbox-attachment-icon"><i class="voyager-download"></i></span>
                                        <span> {{ $split[count($split)-1] }} </span>
                                    </a>
                                    @endforeach
                                </div>
                                @else
                                {
                                <p>Pas de pièces jointes à afficher</p>
                                }
                                @endif
                            </div>
                        </div>
                        @endif
                        <!-- /.card-body -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

{{-- Single delete modal --}}
<div class="modal modal-danger fade" tabindex="-1" id="delete_modal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                    aria-label="{{ __('voyager::generic.close') }}"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title"><i class="voyager-trash"></i> {{ __('voyager::generic.delete_question') }}
                    {{ strtolower($dataType->display_name_singular) }}?</h4>
            </div>
            <div class="modal-footer">
                <form action="{{ route('voyager.'.$dataType->slug.'.index') }}" id="delete_form" method="POST">
                    {{ method_field('DELETE') }}
                    {{ csrf_field() }}
                    <input type="submit" class="btn btn-danger pull-right delete-confirm"
                        value="{{ __('voyager::generic.delete_confirm') }} {{ strtolower($dataType->display_name_singular) }}">
                </form>
                <button type="button" class="btn btn-default pull-right"
                    data-dismiss="modal">{{ __('voyager::generic.cancel') }}</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
@stop

@section('javascript')
@if ($isModelTranslatable)
<script>
    $(document).ready(function () {
                $('.side-body').multilingual();
            });
</script>
<script src="{{ voyager_asset('js/multilingual.js') }}"></script>
@endif
<script>
    var deleteFormAction;
        $('.delete').on('click', function (e) {
            var form = $('#delete_form')[0];

            if (!deleteFormAction) {
                // Save form action initial value
                deleteFormAction = form.action;
            }

            form.action = deleteFormAction.match(/\/[0-9]+$/)
                ? deleteFormAction.replace(/([0-9]+$)/, $(this).data('id'))
                : deleteFormAction + '/' + $(this).data('id');

            $('#delete_modal').modal('show');
        });
$( document ).ready(function() {
    tinyMCE.activeEditor.setContent("");
});
</script>
@stop
