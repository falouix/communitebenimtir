@extends('layout.layout')
@section('SEO')
@component('components.seo')
@slot('mode')
1
@endslot
@slot('seo_description')
{{ $actualite->meta_description }}
@endslot
@slot('seo_keys')
{{ $actualite->meta_keywords }}
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
<link rel="stylesheet" type="text/css" href="{{ asset('owl-carousel/dist/assets/owl.carousel.css') }}">
<link rel="stylesheet" type="{{ asset('text/css" href="owl-carousel/dist/assets/owl.theme.default.min.css') }}">
@endsection
@php
$urlName[0] = __('routes.Actualitie');
$urlName[1] = str_limit( $actualite->$titre , $limit=55, $end='...');
$IsActive[0] ='';
$IsActive[1] ='active';
$urlBread[0] ='/actualites';
$urlBread[1] = $actualite->slug ? $actualite->slug : '';
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
                    <h3 class="media-heading line-bottom-theme-colored-2">{{ $actualite->$titre }}</h3>
                    <div class=" media-area">
                        <div class="single-news">
                            <a href="#">
                                <img class="img-responsive lazyload"
                                    data-src="{{ voyager::image($actualite->vignette) }}"
                                    alt="{{ $actualite->$titre }}">
                                <span class="cat"><i class="fa fa-calendar"></i>
                                    {{ $actualite->date_publication }}</span>
                            </a>
                        </div>
                        <div class="media-body">
                            <p>
                                {!! $actualite->$description !!}
                            </p>
                        </div>
                        <div class="owl-carousel-news">
                            <!-- SINGLE NEWS SLIDER -->
                            <!-- Title -->
                            <div class="owl-carousel owl-theme">
                                @foreach(json_decode($actualite->carousel, true) as $image)
                                <div class="item">
                                    <img data-src="{{ voyager::image($image) }}" alt="image"
                                        class="img-responsive lazyload" style="width: 100%;">
                                </div>
                                @endforeach
                            </div>
                            <!-- /. SINGLE NEWS SLIDER -->
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

@section('scripts-contents')
<script src="/owl-carousel/dist/owl.carousel.js" type="text/javascript"></script>
<script>
    $('.owl-carousel').owlCarousel({
        rtl: true,
        loop: true,
        margin: 10,
        nav: true,
        dots: false,
        responsive: {
            0: {
                items: 1
            },
            600: {
                items: 3
            },
            1000: {
                items: 2
            }
        }
    })
</script>
@endsection
