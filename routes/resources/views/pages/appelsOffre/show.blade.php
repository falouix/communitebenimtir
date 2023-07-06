@extends('layout.layout')
@section('SEO')
@component('components.seo')
@slot('mode')
1
@endslot
@slot('seo_description')
{{ $appeloffre->meta_description }}
@endslot
@slot('seo_keys')
{{ $appeloffre->meta_keywords }}
@endslot
@endcomponent
@endsection
@section('title')
{{ __('routes.Actualitie') }}
@endsection
@section('head-scripts')
@php
if ($locale =='ar') $styleMenu = 'StyleMenuAR.css'; else $styleMenu = 'StyleMenu.css';
@endphp
<link rel="stylesheet" type="text/css" href={{ asset("css/{$styleMenu }") }}>
@endsection
@php
$urlName[0] = __('routes.Actualitie');
$urlName[1] = str_limit( $appeloffre->$titre , $limit=55, $end='...');
$IsActive[0] ='';
$IsActive[1] ='active';
$urlBread[0] ='/appeloffres';
$urlBread[1] = $appeloffre->slug ? $appeloffre->slug : '';
@endphp
@section('content')
@include('layout.partials.breadcrumb',['count' => 2,
'urlbread' => $urlBread,
'urlName' => $urlName,
'IsActive' => $IsActive
])

<div class="news-body  mt30">
    <div class="container">
        <!-- RIGHT SIDEBAR -->
        @include('components.sidebar')
        <!-- /. RIGHT SIDEBAR -->
        <!-- MAIN CONTENT -->
        <div class="col-md-9 col-xs-12">
            <div class="main-content">
                <!-- NEWS CONTENT AREA -->
                <div class="news-content-area">
                    <!-- SINGLE NEWS  -->
                    <h3 class="media-heading line-bottom-theme-colored-2">{{ $appeloffre->$titre }}</h3>
                    <div class=" media-area">
                        <div class="single-event">
                            <a href="#">
                                <img class="img-responsive lazyload"
                                    data-src="{{ voyager::image($appeloffre->vignette) }}"
                                    alt="{{ $appeloffre->$titre }}">
                            </a>
                            <div class="event-time">
                                <span><i class="fa fa-calendar"></i>{{ $appeloffre->date_debut }}</span>
                                <span><i class="fa fa-calendar-o"></i>{{ $appeloffre->date_fin }}</span>
                            </div>
                        </div>
                        <div class="media-body">
                            <p>
                                {!! $appeloffre->$description !!}
                            </p>
                        </div>

                    </div>
                    <!-- /. END SINGLE NEWS -->
                </div>
                <!-- Row -->
            </div>
            <!-- /. MAIN CONTENT -->
        </div>
    </div>
    <!-- /.NEWS PAGE -->
    <!-- FOOTER -->
    @include('layout.partials.footer')
</div>

@endsection
