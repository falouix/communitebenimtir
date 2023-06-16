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
        <div class="col-md-12">
            <div class="panel panel-bordered" style="padding-bottom:5px;">
                <!-- form start -->
                <div class="panel-body">
                    <div class="card card-rec card-outline">
                        <!-- /.card-header -->
                        <div class="card-body p-0 pad-top-0">
                            <div class="mailbox-read-info">
                                <h5>Sujet : {{ $reclamation->Sujet }}</h5>
                                <h6>De <b class="fw-600">{{$citoyen->NomPrenom}}</b> N° carte d'identité
                                    <b class="fw-600">{{ $citoyen->CIN }}</b>
                                    <span class="mailbox-read-time float-right">{{$reclamation->DateReclamation}}</span>
                                </h6>
                            </div>
                            <!-- /.mailbox-read-info -->
                            <div class="space"></div>
                            <!-- /.mailbox-controls -->
                            <div class="mailbox-read-message">
                                <p>{!! $reclamation->Textmessage !!} </p>
                            </div>
                            <!-- /.mailbox-read-message -->
                        </div>
                        <!-- /.card-body -->
                        @if(!empty($reclamation->PiecesJointes))
                        <div class="card-footer bg-white">
                            @foreach(json_decode($reclamation->PiecesJointes, true) as $fichier)
                            @php
                            $split = explode("/", $fichier);
                            @endphp
                            <div class="card-body pad-top-0 bg-white">
                                <a class="attachment" href="{{ route('voyager.'.$dataType->slug.'.file.download') }}?file={{ $fichier }}" target="_blank">
                                <span class="mailbox-attachment-icon"><i class="voyager-download"></i></span>
                                <span> {{ $split[count($split)-1] }} </span>
                                </a>
                            </div>
                            @endforeach
                        </div>
                        @endif
                    </div>
                    @foreach ( $ListReponseReclamation as $reponseReclamation )
                    <div class="card card-primary card-outline">
                        <!-- /.card-header -->
                        <div class="card-body p-0 pad-top-0">
                            <div class="mailbox-read-info">
                                <h6>De {{$reponseReclamation->Expediteur}}
                                    <span
                                        class="mailbox-read-time float-right">{{$reponseReclamation->DateReponse}}</span>
                                </h6>
                            </div>
                            <!-- /.mailbox-read-info -->
                            <div class="space"></div>
                            <!-- /.mailbox-controls -->
                            <div class="mailbox-read-message">
                                <p>{!! $reponseReclamation->TextReponse !!} </p>
                            </div>
                            <!-- /.mailbox-read-message -->
                        </div>
                        <!-- /.card-body -->
                        @if(!empty($reponseReclamation->PiecesJointes))
                        <div class="card-footer bg-white">
                            @foreach(json_decode($reponseReclamation->PiecesJointes, true) as $fichier)
                            @php
                            $split = explode("/", $fichier);
                            @endphp
                            <div class="card-body pad-top-0 bg-white">
                                <a class="attachment" href="{{ route('voyager.'.$dataType->slug.'.file.download') }}?file={{ $fichier }}"
                                    target="_blank">
                                    <span class="mailbox-attachment-icon"><i class="voyager-download"></i></span>
                                    <span> {{ $split[count($split)-1] }} </span>
                                </a>
                            </div>
                            @endforeach
                        </div>
                        @endif
                    </div>
                    @endforeach
                </div>

            </div>
            @if($reclamation->Etat=="0")
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
                    <form action="{{ route('voyager.'.$dataType->slug.'.RepondreReclamation') }}" method="POST"
                        enctype="multipart/form-data" role="form">
                        {{ csrf_field() }}
                        <button type="submit" class="btn btn-primary" name="valider">Envoyer</button>
                        <br><br>
                        <div class="form-group">
                            <label for="slug">Pièce jointe :</label>
                            <input type="file" id="PiecesJointes" name="PiecesJointes[]" multiple>
                        </div>
                        <div class="form-group">
                            <label for="slug">Editeur de texte :</label>
                            @php
                            $dataTypeRows = $dataType->{(isset($dataTypeContent->id) ? 'addRows' :
                            'addRows'
                            )};
                            $row = $dataTypeRows->where('field', 'Textmessage')->first();
                            @endphp
                            {!! app('voyager')->formField($row,$dataType, $dataTypeContent) !!}
                        </div>
                        <input type="hidden" name="rec" id="rec" value="{{$reclamation->id}}">
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
