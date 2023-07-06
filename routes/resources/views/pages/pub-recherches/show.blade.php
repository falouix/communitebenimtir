@extends('layout.layout')
@section('SEO')
@component('components.seo')
@slot('mode')
1
@endslot
@endcomponent
@endsection
@section('title')
{{ __('routes.Publications') }}
@endsection
@section('head-scripts')
@php
if ($locale =='ar') $styleMenu = 'StyleMenuAR.css'; else $styleMenu = 'StyleMenu.css';
@endphp
<link rel="stylesheet" type="text/css" href={{ asset("css/{$styleMenu }") }}>
@endsection
@php
$urlName[0] = __('routes.Publications');
$IsActive[0] ='active';
$urlBread[0] ='/PubRecherches';
@endphp
@section('content')
@include('layout.partials.breadcrumb',['count' => 1,
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
                <div class="events-content-area">
                    <!-- SINGLE NEWS  -->
                    <h3 class="media-heading line-bottom-theme-colored-2">{{ $pub->$titre }}</h3>
                    <div class=" media-area">
                        <div class="single-event">
                            <a href="#">
                                <img class="img-responsive lazyload" data-src="{{ voyager::image($pub->vignette) }}"
                                    alt="{{ $pub->$titre }}"
                                    onclick="openModal();currentSlide(1);" >
                            </a>
                            <div class="event-time">
                                <span><i class="fa fa-calendar"></i>{{ $pub->DatePublication }}</span>
                            </div>

                        </div>
                        <div class="media-body">
                            <p>
                                {!! $pub->$description !!}
                            </p>
                            @if ($pub->Fichier !=null)
                            <div class="voting-btns mt20 col-lg-2 col-md-2">
                                <a href="{{  url('storage/'.$pub->Fichier) }}" class="sm-green-btn disp-block mt10"
                                    target="_blank">
                                    <i class="fa fa-download">
                                        {{ __('libelle.lien') }}</i>
                                </a>
                            </div>
                            @endif
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
<div id="myModal" class="modal">
    <span class="close cursor" onclick="closeModal()">&times;</span>
    <div class="modal-content">
            <div class="mySlides">
                <img class="lazyload" data-src="{{ Voyager::image($pub->vignette) }}" alt="image"
                    style="height:50%;width:100%">
            </div>

    </div>
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
<script>
    function openModal() {
        document.getElementById("myModal").style.display = "block";
    }

    function closeModal() {
        document.getElementById("myModal").style.display = "none";
    }

    var slideIndex = 1;
    showSlides(slideIndex);

    function plusSlides(n) {
        showSlides(slideIndex += n);
    }

    function currentSlide(n) {
        showSlides(slideIndex = n);
    }

    function showSlides(n) {
        var i;
        var slides = document.getElementsByClassName("mySlides");
        // var dots = document.getElementsByClassName("demo");
        var captionText = document.getElementById("caption");
        if (n > slides.length) {
            slideIndex = 1
        }
        if (n < 1) {
            slideIndex = slides.length
        }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }

        slides[slideIndex - 1].style.display = "block";
        //  dots[slideIndex-1].className += " active";
        // captionText.innerHTML = dots[slideIndex-1].alt;
    }

</script>
@endsection
