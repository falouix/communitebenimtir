@extends('layout.layout')
@section('SEO')
@component('components.seo')
@slot('mode')
1
@endslot
@endcomponent
@endsection
@section('title')
{{ __('routes.Recherche') }}
@endsection
@section('head-scripts')
@php
if ($locale =='ar') $styleMenu = 'StyleMenuAR.css'; else $styleMenu = 'StyleMenu.css';
@endphp
<link rel="stylesheet" type="text/css" href={{ asset("css/{$styleMenu }") }}>
@endsection
@php
$urlName[0] = __('routes.Home');
$IsActive[0] ='active';
$urlBread[0] ='';
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
                        <h3 class="line-bottom-theme-colored-3">

                            {{ __('libelle.resultatRecherche') ."(".$searchResults->count().") [" . request()->input('qglobal') ."]"}}
                        </h3>
                    </div>

                </div>

                <!-- /.NEWS SEARCH AREA -->
                <!-- ADMIN CONTENT AREA -->
                <div class="news-content-area mt20">
                    <div class="row">
                        <!-- POST 1 -->
                        @if ($searchResults->count()>0)
                        @forelse ($searchResults->groupByType() as $type => $modelSearchResults)
                        <div class="col-sm-12 col-xs-12">
                            <div class="news-content" style="height: auto; background-image: none;">

                                <div class="media-body" style="width: auto;">
                                    <h4 class="media-heading">
                                        {{  __('data.'.$type) }} ({{ count($modelSearchResults) }})
                                    </h4>
                                    @foreach($modelSearchResults as $searchResult)
                                    <h4><i class="fa fa-calendar"></i>{{  $searchResult->$titre }}</h4>
                                    <p> {!! str_limit( strip_tags($searchResult->$description) , $limit=450, $end='...')
                                        !!}</p>
                                    <div class="card-footer mt10 clearfix">
                                        <div class="{{ $pull_right }}">

                                            <a href="{{ $searchResult->url }}" class="read-more-news"><i
                                                    class="fa fa-eye"></i>
                                                {{ __('button.VoirDetails') }}</a>
                                        </div>
                                    </div>
                                    <hr>
                                    @endforeach
                                </div>
                            </div>
                        </div>

                        @empty
                        <h4>
                            {{__('libelle.SearchEmpty')}}
                            </h4>
                        @endforelse
                        @else
                        <h4>
                        {{__('libelle.SearchEmpty')}}
                        </h4>
                        @endif

                        <!-- /. POST 1 -->

                    </div>
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
