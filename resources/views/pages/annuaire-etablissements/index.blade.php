@extends('layout.layout')
@section('SEO')
@component('components.seo')
@slot('mode')
1
@endslot
@endcomponent
@endsection
@section('title')
{{ __('routes.Administration') }}
@endsection
@section('head-scripts')
@php
if ($locale =='ar') $styleMenu = 'StyleMenuAR.css'; else $styleMenu = 'StyleMenu.css';
@endphp
<link rel="stylesheet" type="text/css" href={{ asset("css/{$styleMenu }") }}>
@endsection
@php
$urlName[0] = __('routes.Administration');
$IsActive[0] ='active';
$urlBread[0] ='/annuaire-etablissements';
@endphp
@section('content')
@include('layout.partials.breadcrumb',['count' => 1,
'urlbread' => $urlBread,
'urlName' => $urlName,
'IsActive' => $IsActive
])

<div class="news-body ">
    <div class="container">
        <!-- RIGHT SIDEBAR -->
        @include('components.sidebar')
        <!-- /. RIGHT SIDEBAR -->
        <!-- MAIN CONTENT -->
        <div class="col-md-9 col-xs-12">
            <div class="main-content">
                <!-- HEADER AREA -->
                <!-- NEWS SEARCH AREA -->
                <div class="main-content-header clearfix">
                    <div class="pull-right">
                        <h3 class="line-bottom-theme-colored-3"> {{ __('routes.Administration') }}</h3>
                    </div>
                    <div class="pull-left">
                        <form class="booking_form_area text-center"
                            action="{{ url('/annuaire-etablissements/search') }}" method="GET" role="search">
                            @csrf
                            <div class="col-md-5 col-lg-10">
                                <div class="form-group">
                                    <input type="text" class="form-control"
                                        placeholder="{{ __('libelle.SearchPlaceHolder') }}" id="libelle"
                                        name="libelle" autocomplete="off">
                                </div>
                            </div>
                            <div class="col-md-1 col-lg-1">
                                <button type="submit" class="btn sm-green-btn"><i class="fa fa-search"></i></button>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- /.NEWS SEARCH AREA -->
                <!-- ADMIN CONTENT AREA -->
                <div class="admin-content-area ">
                    <div class="row">
                        <!-- ADMIN CARD -->
                        @forelse ($listAnnuaireEtablissement as $etablissement)
                        <div class="col-sm-6 col-xs-12">
                            <div class="thumbnail">
                                <div class="caption">
                                    <h5>{{ str_limit($etablissement->$libelle, $limit=57,
                                        $end='...') }}</h5>
                                    <p class="mt10">{{ __("libelle.type{$etablissement->featured}") }}</p>
                                    <ul class="mt10">
                                        @if($etablissement->$adresse) <li class="mt10"><i class="fa fa-home"></i>
                                            {{ $etablissement->$adresse }}</li> @endif
                                        @if($etablissement->tel) <li class="mt10"><i class="fa fa-phone"></i>
                                            {{ $etablissement->tel }}</li>@endif
                                        @if($etablissement->fax) <li class="mt10"><i class="fa fa-fax"></i>
                                            {{ $etablissement->fax }} </li>@endif
                                        @if($etablissement->E_mail) <li class="mt10"><i class="fa fa-envelope"></i>
                                            <a
                                            href="{{ url("/contact/contactAnnuaire?slug=".$etablissement->slug) }}"
                                            class="">{{ $etablissement->E_mailContact }} </a> </li>@endif
                                    </ul>
                                </div>
                                <!-- /. CAPTION -->
                                <div class="card-footer mt20 clearfix">

                                    <div class="{{ $pull_right }}">

                                        <a href="{{ url("/annuaire-etablissements/{$etablissement->slug}") }}"
                                            class="yellow-btn">{{ __('button.VoirPlus') }}</a>

                                        </div>
                                        @if($etablissement->E_mail)
                                         <a href="{{ url("/contact/DemandeAcces?slug={$etablissement->slug}") }}"
                                            class="yellow-btn">{{ __('button.DemandeAccesDocs') }}</a>
                                        @endif
                                </div>
                            </div>
                            <!-- /. THIMBNAIL -->
                        </div>
                        @empty
                        {{ __('libelle.emptyAnnuaire') }}
                        @endforelse

                        <!-- /. ADMIN CARD -->
                    </div>
                    <nav aria-label="..." class="text-center">
                        {!! $listAnnuaireEtablissement->links("pagination::bootstrap-4") !!}
                    </nav>
                </div>
            </div>
            <!-- /. MAIN CONTENT -->
        </div>
    </div>
    <!-- /.ADMIN PAGE -->

    <!-- FOOTER -->
    @include('layout.partials.footer')


    <!-- /. FOOTER -->
</div>


@endsection

@section('scripts-contents')

@endsection
