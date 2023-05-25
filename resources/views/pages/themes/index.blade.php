@extends('layout.layout')
@section('SEO')
@component('components.seo')
@slot('mode')
1
@endslot
@endcomponent
@endsection
@section('title')
{{ __('routes.LibelleTexteJuridiques') }}
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
$urlBread[0] ='/themes';
@endphp
@section('content')
@include('layout.partials.breadcrumb',['count' => 1,
'urlbread' => $urlBread,
'urlName' => $urlName,
'IsActive' => $IsActive
])

<div class="contact-body ">
    <div class="container">
        <!-- MAIN CONTENT -->
        <!-- RIGHT SIDEBAR -->
        @include('components.sidebar')
        <!-- /. RIGHT SIDEBAR -->
        <div class="col-md-9col-xs-12">
            <div class="main-content">
                <!-- HEADER AREA -->
                <!-- NEWS SEARCH AREA -->
                <div class="main-content-header clearfix">
                    <div class="{{ $pull }}">
                        <h3 class="line-bottom-theme-colored-3"> {{ __('routes.themes') }}</h3>
                    </div>
                </div>
                <!-- MAIN CONTENT -->
                <div class="theme-content-area">
                    @if($listThemes!=null)
                    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                        @forelse ($listThemes as $singleTheme)
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingOne">
                                <h4 class="panel-title">
                                    <a role="button" data-toggle="collapse" data-parent="#accordion"
                                        href="#collapse{{ $singleTheme->id }}" aria-expanded="false"
                                        aria-controls="collapse{{ $singleTheme->id }}" class="collapsed">
                                        {!! $singleTheme->$titreThemeJuridique !!}
                                    </a>
                                </h4>
                            </div>
                            <div id="collapse{{ $singleTheme->id }}" class="panel-collapse collapse" role="tabpanel"
                                aria-labelledby="headingOne" aria-expanded="false" style="height: 0px;">
                                <div class="panel-body">
                                    {!! $singleTheme->$texteJuridique !!}
                                </div>
                            </div>
                        </div>
                        @empty
                        {{ __('libelle.SearchEmpty') }}
                        @endforelse
                        @endif
                    </div>
                    <nav aria-label="..." class="text-center">
                        {!! $listThemes->links("pagination::bootstrap-4") !!}
                    </nav>
                </div>
                <!-- /. MAIN CONTENT -->
            </div>

            <!-- /. MAIN CONTENT -->
        </div>
        <!-- /.ADMIN PAGE -->

        <!-- FOOTER -->
        @include('layout.partials.footer')


        <!-- /. FOOTER -->
    </div>


    @endsection

    @section('scripts-contents')
    @endsection