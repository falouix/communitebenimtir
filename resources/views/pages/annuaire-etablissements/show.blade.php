@extends('layout.layout')
@section('SEO')
@component('components.seo')
@slot('mode')
1
@endslot
@slot('seo_description')
{{ $AnnuaireEtablissement->meta_description }}
@endslot
@slot('seo_keys')
{{ $AnnuaireEtablissement->meta_keywords }}
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
<link rel="stylesheet" type="text/css" href="{{ asset('owl-carousel/dist/assets/owl.carousel.css') }}">
<link rel="stylesheet" type="{{ asset('text/css" href="owl-carousel/dist/assets/owl.theme.default.min.css') }}">
@endsection
@php
$urlName[0] = __('routes.Administration');
$urlName[1] = str_limit( $AnnuaireEtablissement->$titre , $limit=55, $end='...');
$IsActive[0] ='';
$IsActive[1] ='active';
$urlBread[0] ='/annuaire-etablissements';
$urlBread[1] = $AnnuaireEtablissement->slug ? $AnnuaireEtablissement->slug : '';
@endphp
@section('content')
@include('layout.partials.breadcrumb',['count' => 2,
'urlbread' => $urlBread,
'urlName' => $urlName,
'IsActive' => $IsActive
])

<div class="admin-body  mt30">
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
                        {{ $AnnuaireEtablissement->$libelle }}
                    </h3>
                    <div class=" media-area">
                        <div class="row">
                            @if ($AnnuaireEtablissement->googlemaps_marker)
                            <div class="col-md-5">
                                <iframe width="320" height="230" frameborder="0" style="border:0"
                                    src="https://www.google.com/maps/embed/v1/place?q=place_id:{{ $AnnuaireEtablissement->googlemaps_marker }}&key=AIzaSyBSsjYTejgRGM06pQyC12bv7wem70qzRlg"
                                    allowfullscreen="">
                                </iframe>
                            </div>
                            @endif
                            <div class="col-md-7">
                                <ul class="mt10">
                                    @if($AnnuaireEtablissement->$adresse) <li class="mt10"><i class="fa fa-home"></i>
                                        {{ $AnnuaireEtablissement->$adresse }}</li>@endif
                                    @if($AnnuaireEtablissement->tel) <li class="mt10"><i class="fa fa-phone"></i>
                                        {{ $AnnuaireEtablissement->tel }}</li>@endif
                                    @if($AnnuaireEtablissement->fax) <li class="mt10"><i class="fa fa-fax"></i>
                                        {{ $AnnuaireEtablissement->fax }}</li>@endif
                                    @if($AnnuaireEtablissement->E_mail) <li class="mt10"><i class="fa fa-envelope"></i>
                                        {{ $AnnuaireEtablissement->E_mail }}</li>@endif
                                    @if($AnnuaireEtablissement->site_web) <li class="mt10"><i class="fa fa-globe"></i>
                                        {{ $AnnuaireEtablissement->site_web }}</li> @endif
                                </ul>
                            </div>
                        </div>
                        <div class="row mrg10-15">
                            <div class="col-md-12">
                                <p>
                                    {!! $AnnuaireEtablissement->$description !!}
                                </p>
                            </div>
                        </div>

                    </div>


                    <!-- /. END SINGLE NEWS -->
                </div>
                <!-- Row -->
            </div>
        </div>

    </div>
</div>
<!-- /.NEWS PAGE -->

<!-- FOOTER -->
@include('layout.partials.footer')
</div>

@endsection

@section('scripts-contents')
<script src="{{ asset('owl-carousel/dist/owl.carousel.js')}}"></script>
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
                items: 4
            }
        }
    })
</script>
@endsection
