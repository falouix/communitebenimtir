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
                <!-- NEWS SEARCH AREA -->
                <div class="main-content-header clearfix">
                    <div class="pull-right">
                        <h3 class="line-bottom-theme-colored-3"> {{ __('routes.Denonciation') }}</h3>
                    </div>
                </div>
                <!-- NEWS CONTENT AREA -->
                <div class="events-content-area">

                    <div class="row" id="">
                        <form method="POST" action="" enctype="multipart/form-data">
                            @csrf
                            <div class="form-group col-lg-6 col-md-6">
                                <label for="raison_sociale">التسمية الاجتماعية*</label>
                                <input type="text" class="form-control" name="raison_sociale" id="raison_sociale"
                                    required="" autocomplete="false">
                            </div>
                            <div class="form-group col-lg-6 col-md-6">
                                <label for="adresse">المقر الاجتماعي*</label>
                                <input type="text" class="form-control" name="adresse" id="adresse" required=""
                                    autocomplete="false">
                            </div>
                            <div class="form-group col-lg-6 col-md-6">
                                <label for="tel">رقم الهاتف</label>
                                <input type="text" class="form-control" name="tel" id="tel" autocomplete="false">
                            </div>
                            <div class="form-group col-lg-6 col-md-6">
                                <label for="tel">عنوان البريد الالكتروني</label>
                                <input type="text" class="form-control" name="email" id="email" autocomplete="false">
                            </div>
                            <div class="form-group col-lg-12 col-md-12">
                                <label for="CIN"> هل ترغب في كشف هويتك لدى السلطات الإدارية و القضائية أو أي هيكل آخر؟ *
                                </label>
                                <div class="radio ">
                                    <label>
                                        <input class="powermail_radio" type="radio" name="identifie" value="1" checked>
                                        نعم
                                    </label>
                                </div>

                                <div class="radio ">
                                    <label>
                                        <input class="powermail_radio" type="radio" name="identifie" value="0">
                                        لا
                                    </label>
                                </div>
                            </div>
                            <div class="form-group col-lg-6 col-md-6">
                                <label for="structure_signale">الهيكل المبلغ عنه</label>
                                <input type="text" class="form-control" name="structure_signale" id="structure_signale"
                                    autocomplete="false">
                            </div>
                            <div class="form-group col-lg-6 col-md-6">
                                <label for="secteur"> قطاع</label>
                                <div class="radio ">
                                    <label>
                                        <input class="powermail_radio" type="radio" name="secteur" value="عام" checked>
                                        عام
                                    </label>
                                </div>

                                <div class="radio ">
                                    <label>
                                        <input class="powermail_radio" type="radio" name="secteur" value="خاص">
                                        خاص
                                    </label>
                                </div>
                            </div>
                            <div class="form-group col-lg-12 col-md-12">
                                <label for="description">الموضوع *</label>
                                <textarea required rows="5" cols="20" class="powermail_textarea form-control "
                                    id="description" name="description"></textarea>
                            </div>
                            <div class="form-group col-lg-12 col-md-12">
                                <label for="description">المرفقات </label>
                                <input type="file" class="custom-file-input" id="PiecesJointes" name="PiecesJointes[]"
                                    multiple>
                            </div>
                            <button class="sm-green-btn disp-block mt10" type="submit"> تسجيل البلاغ</button>
                        </form>
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