@extends('layout.layout')
@section('SEO')
@component('components.seo')
@slot('mode')
1
@endslot
@endcomponent
@endsection
@section('title')
{{ __('routes.PortFolio') }}
@endsection
@section('head-scripts')
@php
if ($locale =='ar') $styleMenu = 'StyleMenuAR.css'; else $styleMenu = 'StyleMenu.css';
@endphp
<link rel="stylesheet" type="text/css" href={{ asset("css/{$styleMenu }") }}>
@endsection
@php
$urlName[0] = __('routes.PortFolio');
$urlName[1] = $gallerie->$titre;
$IsActive[0] ='';
$IsActive[1] ='active';
$urlBread[0] =url("/galleries");
$urlBread[1] ='';
@endphp
@section('content')
@include('layout.partials.breadcrumb',['count' => 2,
'urlbread' => $urlBread,
'urlName' => $urlName,
'IsActive' => $IsActive
])
<div class="contact-body ">
    <div class="container">
        <!-- MAIN CONTENT -->
        <!-- RIGHT SIDEBAR -->
        @include('components.sidebar')
        <!-- /. RIGHT SIDEBAR -->
        <div class="col-md-9">
            <!-- MAIN CONTENT -->
            <div class="main-content">
                <!-- contact CONTENT AREA -->
                <div class="gallery-content-area mt50">
                    <div class="row">
                        <div class="col-md-12">
                            <!-- Portfolio Filter -->
                            <div class="portfolio-filter">
                                <a href="#" class="active" data-filter="*">{{ __('libelle.PortFolioAll') }}</a>
                                <a href="#photo" class="" data-filter=".photo">{{ __('libelle.Photo') }}</a>
                                <a href="#video" class="" data-filter=".video">{{ __('libelle.video') }}</a>
                            </div>
                            <!-- End Portfolio Filter -->

                            <!-- Portfolio Gallery Grid -->
                            <h4>{{ $gallerie->$titre }}
                            </h4>
                            <div id="grid" class="gallery-isotope default-animation-effect grid-3 gutter clearfix"
                                style="position: relative; height: 892px;">
                                @foreach (json_decode($gallerie->Images, true) as $image)
                                <!-- Portfolio Item Start -->
                                <div class="gallery-item photo" style="position: absolute; left: 261px; top: 0px;">
                                    <div class="thumb">
                                        <img class="img-fullwidth lazyload" data-src="{{ Voyager::image($image) }}"
                                            alt="project">
                                        <div class="overlay-shade"></div>
                                        <div class="icons-holder">
                                            <div class="icons-holder-inner">
                                                <div
                                                    class="styled-icons icon-sm icon-dark icon-circled icon-theme-colored">
                                                    <a data-lightbox="image" href="{{ Voyager::image($image) }}"><i
                                                            class=" fa
                                                        fa-plus"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Portfolio Item End -->
                                @endforeach
                                <!-- Portfolio Item Start -->
                                @foreach (json_decode($gallerie->videos, true) as $item)
                                <!-- Portfolio Item Start -->
                                <div class="gallery-item photo" style="position: absolute; left: 261px; top: 0px;">
                                    <div class="thumb">
                                        <video controls="" width="250" height="250">
                                            <source src="img/video/SampleVideo_360x240_30mb.mp4" type="video/webm">
                                        </video>
                                        <div class="overlay-shade"></div>
                                        <div class="icons-holder">
                                            <div class="icons-holder-inner">
                                                <div
                                                    class="styled-icons icon-sm icon-dark icon-circled icon-theme-colored">
                                                    <a class="popup-vimeo"
                                                        href="img/video/SampleVideo_360x240_30mb.mp4"><i
                                                            class="fa fa-play"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Portfolio Item End -->
                                @endforeach
                            </div>
                            <!-- End Portfolio Gallery Grid -->
                        </div>
                    </div>
                    <!-- Row -->
                </div>
                <!-- Row -->
            </div>
            <!-- /. MAIN CONTENT -->
        </div>

        <!-- /. MAIN CONTENT -->
    </div>
    <!-- /.ADMIN PAGE -->

    <!-- FOOTER -->
    @include('layout.partials.footer')


    <!-- /. FOOTER -->
</div>


@endsection

@section('scripts-contents')
<script src="{{ asset('js/custom.js') }}" type="text/javascript"></script>
<script src="{{ asset('js/jquery-plugin-collection.js') }}" type="text/javascript"></script>
@endsection
