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

@section('content')
<div class="page-content read container-fluid">
    <div class="row">
        <div class="col-md-4">
            <div class="info-box mb-3 bg-warning">
                <span class="info-box-icon"><i class="voyager-key"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Code demande</span>
                    <span class="info-box-number">{{$DemandeAcces->codeDemande}}</span>
                </div>
                <!-- /.info-box-content -->
            </div>
        </div>
        <div class="col-md-4">
            <div class="info-box mb-3 bg-warning">
                <span class="info-box-icon "><i class="voyager-medal-rank-star"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Service concerné</span>
                    <span class="info-box-number">{{$DemandeAcces->ServiceConcerne}}</span>
                </div>
                <!-- /.info-box-content -->
            </div>
        </div>
        <div class="col-md-4">
            <div class="info-box mb-3 bg-warning">
                <span class="info-box-icon"><i class="voyager-documentation"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Référence document</span>
                    <span class="info-box-number">{{$DemandeAcces->ReferenceDocs}}</span>
                </div>
                <!-- /.info-box-content -->
            </div>
        </div>
        <div class="col-md-12">

            <div class="panel panel-bordered" style="padding-bottom:5px;">
                <!-- form start -->
                <div class="panel-body">
                    <div class="card card-rec card-outline">
                        <!-- /.card-header -->
                        <div class="card-body p-0 pad-top-0">
                            <div class="mailbox-read-info">
                                <h5>De <b class="fw-600">{{$citoyen->NomPrenom}}</b> N° carte d'identité
                                    <b class="fw-600">{{ $citoyen->CIN }}</b>
                                    <span class="mailbox-read-time float-right">{{$DemandeAcces->DateDemande}}</span>
                                </h5>
                            </div>
                            <!-- /.mailbox-read-info -->
                            <div class="space"></div>
                            <!-- /.mailbox-controls -->
                            <div class="mailbox-read-message">
                                <p>{!! $DemandeAcces->Info !!} </p>
                            </div>
                            <div class="mailbox-read-message">
                                <h5>Remarques</h5>
                                <p>{!! $DemandeAcces->Remarques !!} </p>
                            </div>
                            <!-- /.mailbox-read-message -->
                        </div>
                        <!-- /.card-body -->
                        @if(!empty($DemandeAcces->PiecesJointes))
                        <div class="card-footer bg-white">
                            <div class="card-body pad-top-0 bg-white">
                                <span class="mailbox-attachment-icon"><i class="voyager-download"></i></span>
                                <span> <a class="attachment" href="{{ voyager::image($DemandeAcces->PiecesJointes) }}">
                                        Fichier a
                                        télécharger </a></span>
                            </div>
                        </div>
                        @endif
                    </div>
                    @foreach ( $ListReponseDemandeAcces as $ReponseDemandeAcces )
                    <div class="card card-primary card-outline">
                        <!-- /.card-header -->
                        <div class="card-body p-0 pad-top-0">
                            <div class="mailbox-read-info">
                                <h5>De {{$ReponseDemandeAcces->Expediteur}}
                                    <span
                                        class="mailbox-read-time float-right">{{$ReponseDemandeAcces->DateReponse}}</span>
                                </h5>
                            </div>
                            <!-- /.mailbox-read-info -->
                            <div class="space"></div>
                            <!-- /.mailbox-controls -->
                            <div class="mailbox-read-message">
                                <p>{!! $ReponseDemandeAcces->TextReponse !!} </p>
                            </div>
                            <!-- /.mailbox-read-message -->
                        </div>
                        <!-- /.card-body -->
                        @if(!empty($ReponseDemandeAcces->PiecesJointes))
                        <div class="card-body pad-top-0 bg-white">
                            <span class="mailbox-attachment-icon"><i class="voyager-download"></i></span>
                            <span> <a class="attachment"
                                    href="{{ voyager::image($ReponseDemandeAcces->PiecesJointes) }}">
                                    Fichier a
                                    télécharger </a></span>
                        </div>
                        @endif
                    </div>
                    @endforeach
                </div>

            </div>
            @if($DemandeAcces->EtatDemande=="0")
            <!-- ### Informations générale ### -->
            <div class="panel panel-bordered panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="icon wb-search"></i> Rédiger votre réponse
                    </h3>
                    <div class="panel-actions">
                        <a class="panel-action voyager-angle-up" data-toggle="panel-collapse" aria-hidden="true"></a>
                    </div>
                </div>
                <div class="panel-body" style="">
                    <form action="{{ route('voyager.'.$dataType->slug.'.RepondreDemandeAcces') }}" method="GET"
                        enctype="multipart/form-data">
                        {{ csrf_field() }}
                        {{ method_field('POST') }}
                        <button type="submit" class="btn btn-primary" name="valider">Envoyer</button>
                        <br><br>
                        <div class="form-group">
                            <label for="slug">Pièce jointe :</label>
                            <input type="file" name="PiecesJointes">
                        </div>
                        <div class="form-group">
                            <label for="slug">Editeur de texte :</label>
                            @php
                            $dataTypeRows = $dataType->{(isset($dataTypeContent->id) ? 'addRows' :
                            'addRows'
                            )};
                            $row = $dataTypeRows->where('field', 'Info')->first();
                            @endphp
                            {!! app('voyager')->formField($row,$dataType, $dataTypeContent) !!}
                        </div>
                        <input type="hidden" name="DemandeAcc" id="DemandeAcc" value="{{$DemandeAcces->id}}">
                    </form>
                </div>
            </div>
            @endif
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