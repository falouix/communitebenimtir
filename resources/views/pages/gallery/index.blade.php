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
$IsActive[0] ='active';
$urlBread[0] ='/galleries';
@endphp
@section('content')
@include('layout.partials.breadcrumb',['count' => 1,
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
                                <a href="#photo" class="" data-filter=".photos">{{ __('libelle.Photo') }}</a>
                                <a href="#video" class="" data-filter=".webtv">{{ __('libelle.video') }}</a>
                                <a href="#audio" class="" data-filter=".audio">{{ __('libelle.Audio') }}</a>
                            </div>
                            <!-- End Portfolio Filter -->

                            <!-- Portfolio Gallery Grid -->
                            <div id="grid" class="gallery-isotope default-animation-effect grid-3 gutter clearfix"
                                style="position: relative; height: 892px;">
                                @foreach ($listGallery as $item)
                                @if ($item->type =="audio")
                                <div class="gallery-item audio" style="position: absolute; left: 0px; top: 0px;">
                                    <div class="thumb">
                                        <audio src="{{ voyager::image($item->cover) }}" controls="" style="
                                                                                width: 250px;"></audio>
                                    </div>
                                    <div class="thumb-title">
                                        <h4><a href="#">{{ $item->$titre }}</a>
                                        </h4>
                                    </div>
                                </div>
                                @endif
                                <!-- Portfolio Item End -->
                                @if ($item->type =="photos" || $item->type =="webtv")
                                <!-- Portfolio Item Start -->
                                <div class="gallery-item {{ $item->type }}"
                                    style="position: absolute; left: 261px; top: 0px;">
                                    <div class="thumb">
                                        <img class="img-fullwidth lazyload"
                                            data-src="{{ voyager::image($item->cover) }}" alt="project">
                                        <div class="overlay-shade"></div>
                                        <div class="icons-holder">
                                            <div class="icons-holder-inner">
                                                <div
                                                    class="styled-icons icon-sm icon-dark icon-circled icon-theme-colored">
                                                    <a data-lightbox="image" href="{{ voyager::image($item->cover) }}">
                                                        <i class="fa fa-plus"></i></a>
                                                    <a href="{{ url("/galleries/{$item->slug}") }}"><i
                                                            class="fa fa-link"></i></a>

                                                </div>
                                            </div>
                                        </div>
                                        <a class="hover-link" data-lightbox="image" href="{{ $item->cover }}">View
                                            more</a>
                                    </div>
                                    <div class="thumb-title">
                                        <h4>{{ $item->$titre }}
                                        </h4>
                                    </div>
                                </div>
                                <!-- Portfolio Item End -->
                                @endif
                                @endforeach
                                <!-- Portfolio Item Start -->

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
<script src="{{ asset('js/lazysizes.min.js') }}" type="text/javascript"></script>
<script src="{{ asset('js/jquery-plugin-collection.js') }}" type="text/javascript"></script>
@endsection
