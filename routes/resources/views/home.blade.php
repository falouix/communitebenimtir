@extends('layout.layout')
@section('SEO')
    @component('components.seo')
        @slot('mode')
            1
        @endslot
    @endcomponent
@endsection
@section('title')
    {{ __('routes.Home') }}
@endsection
@section('content')

    <article class="bckg-grey">
        <!-- BANNER -->

        @if ($slider->count() > 0)
        <div class="Home-banner container">
            <!-- <div class="row"> -->
            <!-- Slider et Widget-->
            <div id="carousel-example-generic-banner" class="carousel slide box-shadow" data-ride="carousel">
                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    @php $i=1 @endphp
                    @foreach ($slider as $itemAr)
                        @if ($i == 1)
                            <div class="item active">
                                <img data-src="@if ($itemAr) {{ voyager::image($itemAr->photo) }} @else {{ voyager::image($sliderTous->photo) }} @endif"
                                    alt="image" class="lazyload">
                            </div>
                        @else
                            <div class="item ">
                                <img data-src="@if ($itemAr) {{ voyager::image($itemAr->photo) }} @else {{ voyager::image($sliderTous->photo) }} @endif"
                                    alt="image" class="lazyload">
                            </div>
                        @endif
                        @php $i++ @endphp
                    @endforeach

            </div>
            <a class="left carousel-control" href="#carousel-example-generic-banner" role="button"
                data-slide="prev">
                <span class="glyphicon glyphicon-chevron-{{ $left }}" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic-banner" role="button"
                data-slide="next">
                <span class="glyphicon glyphicon-chevron-{{ $right }}" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <!-- Controls -->
@endif



    </div>
    <!--./ Slider et Widget-->
    <!-- </div>  -->


    <!-- WIDGETS -->
    <section class="widgets  section">
        <div class="container">
            <!---->
            <div class="row">
                <div class=" col-lg-12 col-md-12 col-sm-12 pad-left-0 pad-right-0">
                    <!-- VOTING -->
                    <div class=" col-md-4 col-sm-4 col-xs-12">
                        <div class="pray-times white-box">
                            <!-- WHITE BOX -->
                            <div class="widget-title line-bottom-theme-colored-1">
                                <a href="{{ url('/conseil-municipal') }}" class="widget-title line-bottom-theme-colored-1" title="{{ __('routes.ConseilMunicipal') }}">
                                    {{ __('routes.ConseilMunicipal') }}
                                </a>
                            </div>
                            <div class="widget-content icone-widget">
                                <a href="{{ url('/conseil-municipal') }}" title="{{ __('routes.ConseilMunicipal') }}"><img
                                        data-src="{{ asset('img/icone/meeting.png') }}" class="lazyload"></a>
                            </div>
                        </div>
                        <!-- /. WHITE BOX -->
                    </div>
                    <!-- /. VOTING -->
                    <!-- EVENTS -->
                    <div class="Pilgrimage col-md-4 col-sm-6 col-xs-12">
                        <div class="white-box">
                            <!-- WHITE BOX -->
                            <div class="widget-title line-bottom-theme-colored-1">
                                <a href="{{ url('/finance') }}" class="widget-title line-bottom-theme-colored-1" title="{{ __('routes.Finance') }}">
                                    {{ __('routes.Finance') }}
                                </a>
                            </div>
                            <div class="widget-content icone-widget">
                                <a href="{{ url('/finance') }}" title="{{ __('routes.Finance') }}"><img data-src="{{ asset('img/icone/loan.png') }}"
                                        class="lazyload"></a>
                            </div>
                            <!-- /. Pilgrimage CONTENT -->
                        </div>
                        <!-- /. WHITE BOX -->
                    </div>
                    <!-- /. EVENTS -->

                    <!-- Pilgrimage -->
                    <div class="Pilgrimage col-md-4 col-sm-6 col-xs-12">
                        <div class="white-box">
                            <!-- WHITE BOX -->
                            <div class="widget-title line-bottom-theme-colored-1">
                                <a href="{{ url('/budget-participatif') }}" class="widget-title line-bottom-theme-colored-1" title="{{ __('routes.BudgetParticipatif') }}">
                                    {{ __('routes.BudgetParticipatif') }}
                                </a>
                            </div>
                            <div class="widget-content icone-widget">
                                <a href="{{ url('/budget-participatif') }}"><img
                                        data-src="{{ asset('img/icone/accounting.png') }}" class="lazyload"></a>
                            </div>
                            <!-- /. Pilgrimage CONTENT -->
                        </div>
                        <!-- /. WHITE BOX -->
                    </div>
                    <!-- /. Pilgrimage -->
                    <!-- Pilgrimage -->
                    <div class="Pilgrimage col-md-4 col-md-6 col-xs-12">
                        <div class="white-box">
                            <!-- WHITE BOX -->
                            <div class="widget-title line-bottom-theme-colored-1">
                                <a href="{{ url('/projets-realisations') }}" class="widget-title line-bottom-theme-colored-1" title="{{ __('routes.ProjetRealisation') }}">
                                    {{ __('routes.ProjetRealisation') }}
                                </a>
                            </div>
                            <div class="widget-content icone-widget">
                                <a href="{{ url('/projets-realisations') }}"><img
                                        data-src="{{ asset('img/icone/process.png') }}" class="lazyload"></a>
                            </div>
                            <!-- /. Pilgrimage CONTENT -->
                        </div>
                        <!-- /. WHITE BOX -->
                    </div>
                    <div class="Pilgrimage col-md-4 col-md-6 col-xs-12">
                        <div class="white-box">
                            <!-- WHITE BOX -->
                            <div class="widget-title line-bottom-theme-colored-1">
                                <a href="{{ url('/pages/acces-aux-documents-administratifs') }}" class="widget-title line-bottom-theme-colored-1" title="{{ __('routes.Acces_information') }}">
                                    {{ __('routes.Acces_information') }}
                                </a>
                            </div>
                            <div class="widget-content icone-widget">
                                <a href="{{ url('/pages/acces-aux-documents-administratifs') }}"><img
                                        data-src="{{ asset('img/icone/access-control.png') }}" class="lazyload"></a>
                            </div>
                            <!-- /. Pilgrimage CONTENT -->
                        </div>
                        <!-- /. WHITE BOX -->
                    </div>
                    <div class="Pilgrimage col-md-4 col-md-6 col-xs-12">
                        <div class="white-box">
                            <!-- WHITE BOX -->
                            <div class="widget-title line-bottom-theme-colored-1">
                                <a href="{{ url('/pages/references-legales') }}" class="widget-title line-bottom-theme-colored-1" title="{{ __('routes.References_legales') }}">
                                    {{ __('routes.References_legales') }}
                                </a>
                            </div>
                            <div class="widget-content icone-widget">
                                <a href="{{ url('/pages/references-legales') }}"><img
                                        data-src="{{ asset('img/icone/law.png') }}" class="lazyload"></a>
                            </div>
                            <!-- /. Pilgrimage CONTENT -->
                        </div>
                        <!-- /. WHITE BOX -->
                    </div>
                    <!-- /. Pilgrimage -->
                </div>

            </div>

        </div>
    </section>
    <!-- /. WIDGETS -->
    <!-- /. BANNER -->
    <!-- News and events -->
    <section class=" section news-pray ">
        <div class="container">
            <div class="row">
                <!-- NEWS -->
                <div class="col-lg-12 col-md-12 col-xs-12">
                    <div class="News-content">
                        <div class="news-wrapper clearfix position-actualites">
                            @php
                                $item = $homeCompenents->where('position', '=', 'position-actualites')->first();
                            @endphp
                            @if ($item)
                                @include("components.{$item->lien_view}")
                            @else
                                @include('components.actualites')
                            @endif
                        </div>
                        <!-- /. NEWS WRAPPER -->
                    </div>
                    <!--/.NEWS CONTENT -->
                </div>
                <!--/.NEWS -->

                <!-- EVENTS -->
                <div class="col-lg-12 col-md-12 col-xs-12">
                    <div class="events-wrapper position-events">
                        @php
                            $item = $homeCompenents->where('position', '=', 'position-events')->first();
                        @endphp
                        @if ($item)
                            @include("components.{$item->lien_view}")
                        @else
                            @include('components.events')
                        @endif
                    </div>
                </div>
                <!-- /. EVENTS -->
            </div>
        </div>
    </section>
    <!-- /. News and event-->

    <!-- FOOTER -->
    @include('layout.partials.footer')
    <!-- /. FOOTER -->
@endsection
@section('scripts-contents')
@endsection
