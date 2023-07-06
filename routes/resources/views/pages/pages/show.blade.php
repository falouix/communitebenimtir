@extends('layout.layout')
@section('SEO')
@component('components.seo')
@slot('mode')
1
@endslot
@slot('seo_description')
{{ $page->meta_description }}
@endslot
@slot('seo_keys')
{{ $page->meta_keywords }}
@endslot
@endcomponent
@endsection
@section('title')
{{ $page->$titre }}
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

$urlName[0] = str_limit( $page->$titre , $limit=55, $end='...');
$IsActive[0] ='active';
$urlBread[0] ='/pages/{$page->slug}';
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
            <!-- MAIN CONTENT -->
            <div class="main-content">
                <!-- HEADER AREA -->
                <div class="main-content-header clearfix">
                    <div class="pull-right">
                        <h3 class="line-bottom-theme-colored-3"> {{ $page->$titre }}</h3>
                    </div>
                </div>
                <!-- /. HEADER AREA -->
                <!-- contact CONTENT AREA -->
                <div class="page-content-area">
                    <div class="row">
                        <div class="col-md-12">
                            <p>
                                {!! $page->$contenu !!}

                            </p>
                        </div>

                    </div>
                    @if(json_decode($page->fichiers))
                    <div class="row">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">{{ __('libelle.NomFichier') }}</th>
                                    <th scope="col">{{ __('libelle.lien') }}</th>
                                </tr>
                            </thead>
                            <tbody>
                                @php
                                if ($locale != 'ar')$nom_fichier = 'nom_fichier'.$locale; else $nom_fichier =
                                'nom_fichier';
                                @endphp
                                @foreach (json_decode($page->fichiers) as $fichier)
                                @php
                                $i=1;
                                @endphp
                                <tr>
                                    <th scope="row">{{ $i }}</th>
                                    <td>{{ $fichier->$nom_fichier }}</td>
                                    <td><a class="pdf" href="{{ voyager::image($fichier->lien_fichier) }}">
                                            {{ __('button.Download') }}</a></td>
                                </tr>
                                @php
                                $i++;
                                @endphp
                                @endforeach

                            </tbody>
                        </table>
                    </div>
                    @endif
                    <div class="row">
                        <div class="owl-carousel-news">
                            <!-- SINGLE NEWS SLIDER -->
                            <!-- Title -->
                            <div class="owl-carousel owl-theme">
                                @foreach(json_decode($page->images, true) as $image)
                                <div class="item">
                                    <img src="{{ voyager::image($image) }}" alt="image" class="img-responsive"
                                        style="width: 100%;">
                                </div>
                                @endforeach
                            </div>
                            <!-- /. SINGLE NEWS SLIDER -->
                        </div>
                    </div>
                    <div class="row">
                        @if (!empty($page->ListStatistiques))
                        @php
                        $i=0;
                        @endphp
                        @foreach(json_decode($page->ListStatistiques, true) as $stat)
                        @php
                        $Statistique= App\Statistique::where('id','=',$stat)->firstOrFail();
                        @endphp

                        <canvas id="myChart{{ $i }}" width="400" height="200"></canvas>
                        {!! $Statistique->$descriptionStatistique !!}
                        @switch($Statistique->Type_Stats )
                        @case("line")
                        <script>
                            new Chart(document.getElementById("myChart{{ $i }}"),{"type":"{{ $Statistique->Type_Stats }}","data":{"labels":{!! $Statistique->AxeX !!},"datasets":[{"label":"{{ $Statistique->$titreStatistique }}","data":{{ $Statistique->AxeY }},"fill":false,"borderColor":"rgb(75,192,192)","lineTension":0.1}]},"options":{}});
                        </script>
                        @break
                        @case("bar")
                        <script>
                            var ctx = document.getElementById("myChart{{ $i }}").getContext('2d');
                                                     var Datalabels = {!! $Statistique->AxeX !!};
                                                        var AxeY = {{ $Statistique->AxeY }};
                                                        var Couleurs = {!! $Statistique->Couleurs !!};
                                                            var dataPoints =[];
                                                            var background =[];
                                                            var Data =[];
                                                           var labels = [];
                                                      for(var i = 0; i < Datalabels.length; i++){
                                                          dataPoints.push({label:Datalabels[i] ,data:[AxeY[i]] , backgroundColor: Couleurs[i]});
                                                      }
                                                var myChart = new Chart(ctx, {
                                                    type: 'bar',
                                                    data: {
                                                        labels:["{{ $Statistique->$titreStatistique }}"],
                                                        datasets: dataPoints,
                                                    },
                                                    options: {
                                                        legend: {
                                                            display: true,
                                                            position: 'right',
                                                            labels: {
                                                                fontColor: "#000000",
                                                            }
                                                        },
                                                        scales:{
                                                            yAxes:
                                                            [
                                                                {"ticks":{"beginAtZero":true}}
                                                                ]
                                                                }
                                                    }
                                                });
                                            //new Chart(document.getElementById("myChart{{ $i }}"),{"type":"bar","data":{"labels":{!! $Statistique->AxeX !!},"datasets":[{"label":"{{ $Statistique->$titreStatistique }}","data":{{ $Statistique->AxeY }},"fill":false,"backgroundColor":{!! $Statistique->Couleurs !!},"borderColor":{!! $Statistique->Couleurs !!},"borderWidth":1}]},"options":{"scales":{"yAxes":[{"ticks":{"beginAtZero":true}}]}}});
                        </script>
                        @break

                        @default
                        <span>Something went wrong, please try again {{ $Statistique->Type_Stats }}</span>
                        @endswitch

                        @php
                        $i++;
                        @endphp
                        @endforeach
                        @endif
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
                items: 1
            },
            1000: {
                items: 1
            }
        }
    })
</script>
@endsection
