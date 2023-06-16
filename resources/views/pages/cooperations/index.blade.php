@extends('layout.layout')
@section('SEO')
@component('components.seo')
@slot('mode')
1
@endslot
@endcomponent
@endsection
@section('title')
{{ __('routes.Cooperations') }}
@endsection
@section('head-scripts')
@php
if ($locale =='ar') $styleMenu = 'StyleMenuAR.css'; else $styleMenu = 'StyleMenu.css';
@endphp
<link rel="stylesheet" type="text/css" href={{ asset("css/{$styleMenu }") }}>
@endsection
@php
$urlName[0] = __('routes.Cooperations');
$IsActive[0] ='active';
$urlBread[0] ='/cooperations';
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
                        <h3 class="line-bottom-theme-colored-3"> {{ __('routes.Cooperations') }}</h3>
                    </div>
                    <div class="pull-left">
                        <div class="form-group">
                            <ul class="news-sm ">
                                <form class="booking_form_area text-center" action="{{ url('/cooperations/search') }}"
                                    method="GET" role="search">
                                    @csrf
                                    <li><input type="date" class="form-control" id="searchdate" name="searchdate"></li>
                                    <li><input type="text" class="form-control"
                                            placeholder="{{ __('libelle.SearchPlaceHolder') }}" id="qpartial"
                                            name="qpartial"></li>
                                    <li><button type="submit" class="btn sm-green-btn"><i
                                                class="fa fa-search"></i></button>
                                    </li>
                                </form>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- /.NEWS SEARCH AREA -->
                <!-- ADMIN CONTENT AREA -->
                <div class="tender-content-area mt20">
                    <div class="row">
                        @foreach ($listCooperation as $coop)
                        <div class="col-sm-6 col-md-6">
                            <div class="thumbnail">
                                <div class="img-wrap">
                                    <img data-src="{{ voyager::image($coop->vignette) }}" alt="..." class="lazyload">
                                    <span><i class="fa fa-calendar"></i>
                                        {{ $coop->DateCooperation }}</span>
                                </div>
                                <div class="caption">
                                    <h3 class="tender-title">{{ str_limit($coop->$titre,$limit=40,$end='...') }} </h3>
                                    <p>{{str_limit( strip_tags($coop->$description) , $limit=150,
                                                                $end='...')}}</p>
                                </div>
                                <div class="card-footer  clearfix">
                                    <div class="pull-left"><a href="{{ url("/cooperations/{$coop->slug}") }}"
                                            class="read-more-news yellow-btn" autocomplete="off"><i
                                                class="fa fa-eye"></i>
                                            {{ __('button.VoirDetails') }}</a> </div>
                                </div>
                            </div>
                        </div>
                        @endforeach
                    </div>
                    <nav aria-label="..." class="text-center">
                        {!! $listCooperation->links("pagination::bootstrap-4") !!}
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
