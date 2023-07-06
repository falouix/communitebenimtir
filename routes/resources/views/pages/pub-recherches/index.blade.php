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

<div class="news-body ">
    <div class="container">
        <!-- RIGHT SIDEBAR -->
        @include('components.sidebar')
        <!-- /. RIGHT SIDEBAR -->
        <!-- MAIN CONTENT -->
        <div class="col-md-9 col-xs-12">
            <div class="main-content">
                <!-- HEADER AREA -->
                <!-- NEWS SEARCH AREA -->
                <div class="main-content-header clearfix">
                    <div class="pull-right">
                        <h3 class="line-bottom-theme-colored-3"> {{ __('routes.Publications') }}</h3>
                    </div>

                    <div class="pull-search">

                        <form class="booking_form_area text-center" action="{{ url('/PubRecherches/search') }}"
                            method="GET" role="search">
                            @csrf
                            <div class="col-md-6 col-lg-6">
                                <input type="date" class="form-control" id="searchdate" name="searchdate">
                            </div>
                            <div class="col-md-5 col-lg-4">
                                <div class="form-group">
                                    <input type="text" class="form-control"
                                        placeholder="{{ __('libelle.SearchPlaceHolder') }}" id="qpartial"
                                        name="qpartial" autocomplete="off">
                                </div>
                            </div>
                            <div class="col-md-1 col-lg-1">
                                <button type="submit" class="btn sm-green-btn"><i class="fa fa-search"></i></button>
                            </div>
                        </form>

                    </div>
                </div>

                <!-- /.NEWS SEARCH AREA -->
                <!-- ADMIN CONTENT AREA -->
                <div class="events-content-area mt20">
                    <div class="row">
                        <!-- POST 1 -->
                        @forelse ($listPubs as $pub)
                        <div class="col-sm-12 col-xs-12">
                            <div class="events-content">
                                <div class="media-left media-middle">
                                    <a href="#">
                                        <img class="media-object lazyload"
                                            data-src="{{ voyager::image($pub->vignette) }}" alt="image" width="150"
                                            height="150">
                                    </a>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">
                                        {{ str_limit($pub->$titre, $limit=50,
                                            $end='...') }}
                                    </h4>
                                    <span><i class="fa fa-calendar"></i>{{ $pub->DatePublication }}</span>
                                    <p>{!! str_limit( strip_tags($pub->$description) , $limit=250,
                                        $end='...') !!}</p>
                                    <div class="card-footer mt10 clearfix">
                                        <div class="{{ $pull_right }}">
                                            <a href="{{ url("/PubRecherches/{$pub->slug}") }}" class="read-more-news"><i
                                                    class="fa fa-eye"></i>
                                                {{ __('button.VoirDetails') }}</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        @empty
                        {{ __('libelle.emptyPubRecherches ')}}
                        @endforelse

                        <!-- /. POST 1 -->

                    </div>

                    <!-- /. ROW -->
                    <nav aria-label="..." class="text-center">
                        {!! $listPubs->links("pagination::bootstrap-4") !!}
                    </nav>
                </div>
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

@endsection
