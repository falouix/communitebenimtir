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

<div class="monument-body ">
    <div class="container">
        <!-- RIGHT SIDEBAR -->
        @include('components.sidebar')
        <!-- /. RIGHT SIDEBAR -->
        <!-- MAIN CONTENT -->
        <div class="col-md-9 col-xs-12">
            <div class="main-content">
                <!-- NEWS CONTENT AREA -->
                <div class="admin-content-area ">
                    <!-- SINGLE NEWS  -->
                    <h3 class="media-heading line-bottom-theme-colored-2">
                        {{ str_limit($monuments->$libelle, $limit=50, $end="...") }}
                    </h3>
                    <div class=" media-area">

                        <div class="row">
                            @if ($monuments->googlemaps_marker)
                            <div class="col-md-5">
                                <iframe width="320" height="230" frameborder="0" style="border:0"
                                    src="https://www.google.com/maps/embed/v1/place?q=place_id:{{ $monuments->googlemaps_marker }}&key=AIzaSyBSsjYTejgRGM06pQyC12bv7wem70qzRlg"
                                    allowfullscreen="">
                                </iframe>
                            </div>
                            @endif
                            <div class="col-md-7">
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
                            </div>
                        </div>
                        <div class="row mrg10-15">
                            <div class="col-md-12">
                                <p>
                                    {!! $monuments->$description !!}
                                </p>
                            </div>
                        </div>
                        <div class="owl-carousel-news">
                            <!-- SINGLE NEWS SLIDER -->
                            <!-- Title -->
                            <div class="owl-carousel owl-theme">
                                @foreach(json_decode($monuments->images, true) as $image)
                                <div class="item">
                                    <img data-src="{{ Voyager::image($image) }}" alt="image"
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
    <!-- /.ADMIN PAGE -->

    <!-- FOOTER -->
    @include('layout.partials.footer')


    <!-- /. FOOTER -->
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
