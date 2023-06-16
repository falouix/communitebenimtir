@extends('layout.layout')
@section('SEO')
@component('components.seo')
@slot('mode')
1
@endslot
@slot('seo_description')
@endslot
@slot('seo_keys')
@endslot
@endcomponent
@endsection
@section('title')
{{ __('routes.Denonciation') }}
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
$urlName[0] = __('routes.Denonciation');
$urlName[1] = '';
$IsActive[0] ='';
$IsActive[1] ='active';
$urlBread[0] ='/denonciation';
$urlBread[1] ='';
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
                <div class="main-content-header clearfix">
                    <div class="pull-right">
                        <h3 class="line-bottom-theme-colored-3"> {{ __('routes.Denonciation') }}</h3>
                    </div>
                </div>
                <!-- NEWS CONTENT AREA -->
                <div class="events-content-area">

                    <div class="row">
                        <h4><a href="http://www.inlucc.tn/www.inlucc.tn/fileadmin/pdf/hm_1.pdf" target="_blank">قانون
                                الإبلاغ عن الفساد
                                وحماية المبلغين * </a></h4>
                        <h4><a href="http://197.5.145.96/www.inlucc.tn/fileadmin/pdf/balagat/A5a_copie.pdf"
                                target="_blank">قمعطيات حول
                                الإبلاغ عن الفساد وحماية المبلغين * </a></h4>
                        <h4><a href="https://drive.google.com/file/d/1t8nuEhrqZ3xszORdDeLN5yvKIsQ8atCE/view"
                                target="_blank">دليل
                                إجراءات التمتّع بالحماية * </a></h4>
                        <div class="col-lg-6 col-md-6">
                            <a class="sm-green-btn disp-block mt10" href="/denonciation-PersoPhysique"><i
                                    class="fa fa-users"></i> شخص طبيعي</a>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <a class="sm-green-btn disp-block mt10" href="/denonciation-PersoMorale"><i
                                    class="fa fa-bank"></i> شخص معنوي</a>
                        </div>
                    </div>
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
<script type="text/javascript" src="{{ asset('owl-carousel/dist/owl.carousel.js') }}">
</script>
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