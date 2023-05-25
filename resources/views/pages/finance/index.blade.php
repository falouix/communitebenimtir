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
$urlName[0] = __('routes.Finance');
$IsActive[0] ='active';
$urlBread[0] ='/finance';
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
                            <h3 class="line-bottom-theme-colored-3"> {{ __('routes.Finance') }}</h3>
                        </div>
                        <div class="pull-search">
                            <form class="booking_form_area text-center" action="{{ url('/finance/search') }}"
                                method="GET" role="search">
                                @csrf
                                <div class="col-md-5 custom-col3">
                                    <label>{{ __('libelle.TypeFinance') }}</label>
                                    <select name="type" class="input-name form-control">
                                        <option value="TOUS"
                                            {{ ( request()->input('type') == "TOUS") ? 'selected' : '' }}>
                                            {{ __('libelle.TOUS') }}</option>
                                        <option value="BUDGET"
                                            {{ ( request()->input('type') == "BUDGET") ? 'selected' : '' }}>
                                            {{ __('libelle.BUDGET') }}</option>
                                        <option value="COMPTEFINANCIER"
                                            {{ ( request()->input('type') == "COMPTEFINANCIER") ? 'selected' : '' }}>
                                            {{ __('libelle.COMPTEFINANCIER') }}</option>
                                        <option value="DETTES"
                                            {{ ( request()->input('type') == "DETTES") ? 'selected' : '' }}>
                                            {{ __('libelle.DETTES') }}</option>
                                        <option value="RECOUVREMENT"
                                            {{ ( request()->input('type') == "RECOUVREMENT") ? 'selected' : '' }}>
                                            {{ __('libelle.RECOUVREMENT') }}</option>
                                        <option value="RESULTATPERFO"
                                            {{ ( request()->input('type') == "RESULTATPERFO") ? 'selected' : '' }}>
                                            {{ __('libelle.RESULTATPERFO') }}</option>
                                        <option value="PLANAPPELOFFRES"
                                            {{ ( request()->input('type') == "PLANAPPELOFFRES") ? 'selected' : '' }}>
                                            {{ __('libelle.PLANAPPELOFFRES') }}</option>

                                    </select>
                                </div>
                                <div class="col-md-3 custom-col3">
                                    <label>{{ __('libelle.AnneeDebut') }}</label>
                                    <input type="number" name="AnneeDebut" class="date input-name form-control"
                                        min="1956" max="2100" onkeypress="return isNumeric(event)"
                                        oninput="maxLengthCheck(this)" value="{{ (request()->input('AnneeDebut')) ?? date('Y', strtotime(today())) }}"
                                        placeholder={{ __('libelle.PlaceHolderAnneeSearch') }} required>
                                </div>
                                <div class="col-md-3 custom-col3">
                                    <label>{{ __('libelle.AnneeFin') }}</label>
                                    <div class="input-group">
                                        <input type="number" name="AnneeFin" class="date input-name form-control"
                                            min="1956" max="2100" onkeypress="return isNumeric(event)"
                                            oninput="maxLengthCheck(this)" value="{{ (request()->input('AnneeFin')) ?? date('Y', strtotime(today())) }}"
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
                    <!-- Tab -->
                    @if (!$data->isEmpty())
                        @foreach ($data as $Annee => $pvByAnnee)
                            <div class="tab mt30">
                                <!-- Nav tabs -->
                                <ul class="nav nav-tabs" role="tablist">

                                    <li role="presentation" class="active"><a href="{{ $Annee }}"
                                            aria-controls="{{ $Annee }}" role="tab" data-toggle="tab"
                                            aria-expanded="true"><h4>{{ $Annee }}</h4></a></li>
                                </ul>
                                <!-- Tab panes -->
                                <div class="tab-content">
                                    <div role="tabpanel" class="tab-pane fade active in" id="{{ $year }}">


                                        @foreach ($pvByAnnee as $TypeFinance => $pvByType)
                                            <ul class="nav nav-tabs" role="tablist" style="margin-top: 5px;">
                                                <li role="TypeFinance" class="active"><a href="{{ $TypeFinance }}"
                                                        aria-controls="{{ $TypeFinance }}" role="tab"
                                                        data-toggle="tab" aria-expanded="true">
                                                        <h5>
                                                        @switch($TypeFinance)
                                                            @case('BUDGET')
                                                            {{ __('libelle.BUDGET') }}
                                                            @break

                                                            @case('COMPTEFINANCIER')
                                                            {{ __('libelle.COMPTEFINANCIER') }}
                                                            @break

                                                            @case('DETTES')
                                                            {{ __('libelle.DETTES') }}
                                                            @break

                                                            @case('RECOUVREMENT')
                                                            {{ __('libelle.RECOUVREMENT') }}
                                                            @break

                                                            @case('RESULTATPERFO')
                                                            {{ __('libelle.RESULTATPERFO') }}
                                                            @break

                                                            @case('PLANAPPELOFFRES')
                                                            {{ __('libelle.PLANAPPELOFFRES') }}
                                                            @break
                                                        @endswitch
                                                        </h5>
                                                    </a>
                                                </li>
                                            </ul>
                                            <div class="tab-content">
                                                <div role="tabpanel" class="tab-pane fade active in"
                                                    id="{{ $TypeConseil }}">
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
                                                            @foreach ($pvByType as $pv)
                                                                <tr>
                                                                    <th scope="row">{{ $i }}</th>
                                                                    <td> <p>{{ $pv->$titre }}</p></td>
                                                                    <td><p>{{ $pv->date_publication }}</p></td>

                                                                    <td>
                                                                        <a class="btn sm-green-btn"
                                                                            href="{{ voyager::image($pv->FichierFinance) }}"
                                                                            target="_blank"><i
                                                                                class="uni-file-download">
                                                                                {{ __('libelle.Télécharger') }}</i></a>
                                                                    </td>
                                                                </tr>
                                                                @php $i++ @endphp
                                                            @endforeach
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div><!-- Tab Content -->
                                        @endforeach
                                    </div><!-- Tab -->
                                </div>
                            </div>
                        @endforeach

                    @else
                        <div class="tab mt30"><h6>{{ __('libelle.SearchEmpty') }}</h6></div>
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
