@extends('layout.layout')
@section('SEO')
@component('components.seo')
@slot('mode')
1
@endslot
@endcomponent
@endsection
@section('title')
{{ __('routes.Home') }}
@endsection
@section('head-scripts')
@php
if ($locale =='ar') $styleMenu = 'StyleMenuAR.css'; else $styleMenu = 'StyleMenu.css';
@endphp
<link rel="stylesheet" type="text/css" href={{ asset("css/{$styleMenu }") }}>
@endsection
@php
$urlName[0] = __('routes.BudgetParticipatif');
$IsActive[0] ='active';
$urlBread[0] ='/budget-participatif';
@endphp
@section('content')
@include('layout.partials.breadcrumb',['count' => 1,
'urlbread' => $urlBread,
'urlName' => $urlName,
'IsActive' => $IsActive
])

<section class="element-animation-section bg-grey">
    <div class="container">
        <div class="row">
            <!-- RIGHT SIDEBAR -->
            @include('components.sidebar')
            <!-- /. RIGHT SIDEBAR -->
            <div class="col-md-9">
                <div class="main-content">
                    <!-- Div Search -->
                    <!-- NEWS SEARCH AREA -->
                    <div class="main-content-header clearfix">
                        <div class="pull-right">
                            <h3 class="line-bottom-theme-colored-3"> {{ __('routes.BudgetParticipatif') }}</h3>
                        </div>
                        <div class="pull-search">
                            <form class="booking_form_area text-center"
                                action="{{ url('/budget-participatif/search') }}" method="GET" role="search">
                                @csrf
                                <div class="col-md-5 custom-col3">
                                    <label>{{ __('libelle.TypeFinance') }}</label>
                                    <select name="type" class="input-name form-control">
                                        <option value="TOUS"
                                            {{ ( request()->input('type') == "TOUS") ? 'selected' : '' }}>
                                            {{ __('libelle.TOUS') }}</option>
                                        <option value="DIAGNOSTIQUE_TECH_FINANCIER"
                                            {{ ( request()->input('type') == "DIAGNOSTIQUE_TECH_FINANCIER") ? 'selected' : '' }}>
                                            {{ __('libelle.DIAGNOSTIQUE_TECH_FINANCIER') }}</option>
                                        <option value="ELABORATION_PROGRAMME"
                                            {{ ( request()->input('type') == "ELABORATION_PROGRAMME") ? 'selected' : '' }}>
                                            {{ __('libelle.ELABORATION_PROGRAMME') }}</option>
                                        <option value="BUDGET_PARTICIPATIF"
                                            {{ ( request()->input('type') == "BUDGET_PARTICIPATIF") ? 'selected' : '' }}>
                                            {{ __('libelle.BUDGET_PARTICIPATIF') }}</option>
                                        <option value="COMMISSION_PAR_ARRONDISSEMENT"
                                            {{ ( request()->input('type') == "COMMISSION_PAR_ARRONDISSEMENT") ? 'selected' : '' }}>
                                            {{ __('libelle.COMMISSION_PAR_ARRONDISSEMENT') }}</option>
                                        <option value="COMMISIONS_PARTICIPATIFS"
                                            {{ ( request()->input('type') == "COMMISIONS_PARTICIPATIFS") ? 'selected' : '' }}>
                                            {{ __('libelle.COMMISIONS_PARTICIPATIFS') }}</option>
                                    </select>
                                </div>
                                <div class="col-md-3 custom-col3">
                                    <label>{{ __('libelle.AnneeDebut') }}</label>
                                    <input type="number" name="AnneeDebut" class="date input-name form-control"
                                        min="1956" max="2100" onkeypress="return isNumeric(event)"
                                        oninput="maxLengthCheck(this)" value="{{ request()->input('AnneeDebut') }}"
                                        placeholder={{ __('libelle.PlaceHolderAnneeSearch') }} required>
                                </div>
                                <div class="col-md-3 custom-col3">
                                    <label>{{ __('libelle.AnneeFin') }}</label>
                                    <div class="input-group">
                                        <input type="number" name="AnneeFin" class="date input-name form-control"
                                            min="1956" max="2100" onkeypress="return isNumeric(event)"
                                            oninput="maxLengthCheck(this)" value="{{ request()->input('AnneeFin') }}"
                                            placeholder={{ __('libelle.PlaceHolderAnneeSearch') }} required>
                                    </div>
                                </div>
                                <div class="col-md-1">
                                    <div style="margin-bottom: 20px"></div>
                                    <button class="btn sm-green-btn" type="submit"><i class="fa fa-search"></i></button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- Div Search -->
                    <!-- Tab -->
                    @if (!$data->isEmpty())
                    @foreach ($data as $Annee=> $pvByAnnee)
                    <div class="tab mt30">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation" class="active"><a href="{{ $Annee }}" aria-controls="{{ $Annee }}"
                                    role="tab" data-toggle="tab" aria-expanded="true">{{ $Annee }}</a></li>
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane fade active in" id="{{ $year }}">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>{{ __('libelle.col_TitreR') }}</th>
                                            <th>{{ __('libelle.col_DateR') }}</th>
                                            <th>{{ __('libelle.col_TypeR') }}</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @php $i=1 @endphp
                                        @foreach ($pvByAnnee as $pv)
                                        <tr>
                                            <th scope="row">{{ $i }}</th>
                                            <td> {{ $pv->$titre }}</td>
                                            <td>{{ $pv->created_at }}</td>
                                            <td>{{ __('libelle.'.$pv->TypeBudget) }}</td>
                                            <td><a class="btn sm-green-btn" @if ($pv->Document == null || $pv->Document
                                                    ==
                                                    '')) href="#" @else href="{{  voyager::image($pv->Document) }}"
                                                    @endif target="_blank"><i class="uni-file-download">
                                                        {{ __('libelle.Télécharger') }}</i></a></td>
                                        </tr>
                                        @php $i++ @endphp
                                        @endforeach


                                    </tbody>
                                </table>
                            </div>
                        </div><!-- Tab Content -->

                    </div><!-- Tab -->
                    @endforeach
                    @else
                    <div class="tab mt30">{{ __('libelle.SearchEmpty') }}</div>
                    @endif
                </div>

            </div>
        </div>
</section>
@include('layout.partials.footer')
@endsection

<script>
    function maxLengthCheck(object) {
          if (object.value.length > object.max.length)
            object.value = object.value.slice(0, object.max.length)
        }

        function isNumeric (evt) {
          var theEvent = evt || window.event;
          var key = theEvent.keyCode || theEvent.which;
          key = String.fromCharCode (key);
          var regex = /[0-9]|\./;
          if ( !regex.test(key) ) {
            theEvent.returnValue = false;
            if(theEvent.preventDefault) theEvent.preventDefault();
          }
        }
</script>
