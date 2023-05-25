@extends('layout.layout')
@section('SEO')
@component('components.seo')
@slot('mode')
1
@endslot
@endcomponent
@endsection
@section('title')
{{ __('routes.Monuments') }}
@endsection
@section('head-scripts')
@php
if ($locale =='ar') $styleMenu = 'StyleMenuAR.css'; else $styleMenu = 'StyleMenu.css';
@endphp
<link rel="stylesheet" type="text/css" href={{ asset("css/{$styleMenu }") }}>
@endsection
@php
$urlName[0] = __('routes.Monuments');
$IsActive[0] ='active';
$urlBread[0] ='/monuments';
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
                        <h3 class="line-bottom-theme-colored-3"> {{ __('routes.Monuments') }}</h3>
                    </div>
                    <div class="pull-left">
                        <div class="form-group">
                            <ul class="news-sm ">
                                <form class="booking_form_area text-center" action="{{ url('/monuments/search') }}"
                                    method="GET" role="search">
                                    @csrf
                                    <li><input type="text" class="form-control"
                                            placeholder="{{ __('libelle.SearchPlaceHolder') }}" id="qpartial"
                                            name="qpartial" autocomplete="off"></li>
                                    <li><button type="submit" class="btn sm-green-btn"><i
                                                class="fa fa-search"></i></button>
                                    </li>
                                    <input type="text" name="model" id="model" value="Actualite" hidden="">
                                </form>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- /.NEWS SEARCH AREA -->
                <!-- ADMIN CONTENT AREA -->
                <div class="monument-content-area ">
                    <div class="row">
                        <!-- ADMIN CARD -->
                        @forelse ($listMonuments as $monuments)
                        <div class="col-sm-12 col-xs-12">
                            <div class="monument-content">
                                <div class="media-left media-middle">
                                    <a href="#">
                                        <img class="media-object lazyload"
                                            data-src="{{ voyager::image($monuments->image_couverture) }}"
                                            alt="{{ $monuments->$libelle }}" width="250" height="250">
                                    </a>
                                </div>
                                <div class="media-body">
                                    <h3>{{ $monuments->$libelle }}</h3>
                                    <ul class="mt10">
                                        @if($monuments->$adresse) <li class="mt10"><i class="fa fa-home"></i>
                                            {{ $monuments->$adresse }}</li>@endif
                                        @if($monuments->tel) <li class="mt10"><i class="fa fa-phone"></i>
                                            {{ $monuments->tel }}</li>@endif
                                        @if($monuments->fax) <li class="mt10"><i class="fa fa-fax"></i>
                                            {{ $monuments->fax }}</li>@endif
                                        @if($monuments->E_mail) <li class="mt10"><i class="fa fa-envelope"></i>
                                            {{ $monuments->E_mail }}</li>@endif
                                        @if($monuments->site_web) <li class="mt10"><i class="fa fa-globe"></i>
                                            {{ $monuments->site_web }}</li> @endif
                                    </ul>
                                    <div class="card-footer mt10 clearfix">
                                        <div class="pull-left">
                                            <a href="{{ url("/monuments/{$monuments->slug}") }}"
                                                class="yellow-btn">{{ __('button.VoirPlus') }}</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        @empty
                        {{ __('libelle.emptyAnnuaire') }}
                        @endforelse

                    </div>

                    <nav aria-label="..." class="text-center">
                        {!! $listMonuments->links("pagination::bootstrap-4") !!}
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
