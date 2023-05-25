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
@section('head-scripts')
@php
if ($locale =='ar') $styleMenu = 'StyleMenuAR.css'; else $styleMenu = 'StyleMenu.css';
@endphp
<link rel="stylesheet" type="text/css" href={{ asset("css/{$styleMenu }") }}>
@endsection
@php
$urlName[0] = $page->$titre;
$IsActive[0] ='active';
$urlBread[0] ='/pages/{$page->$titre}';
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
                    <div class="{{ $pull }}">
                        <h3 class="line-bottom-theme-colored-3"> {{ $page->$titre }}</h3>
                    </div>

                    <div class="{{ $pull_right }}">

                        <div class="form-group">
                            <ul class="news-sm ">
                                <form class="booking_form_area text-center" action="{{ url('/pages/search') }}"
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
                <div class="news-content-area mt20">
                    <div class="row">
                        <!-- POST 1 -->
                        @forelse ($listPages as $page)
                        @php
                        $actualite = App\Article::Where('id',$page->article_id)->Where('status','PUBLISHED')->first();
                        if($actualite){$image = json_decode($actualite->images);}

                        @endphp
                        @if($actualite)
                        <div class="col-sm-12 col-xs-12">
                            <div class="news-content">

                                @if($image)
                                <div class="media-left media-middle">
                                    <a href="#">
                                        <img class="media-object" src="{{ voyager::image($image[0]) }}" alt="image"
                                            width="150" height="150">
                                    </a>
                                </div>
                                @endif
                                <div class="media-body">
                                    <h4 class="media-heading">{{ str_limit($actualite->$titre, $limit=50,
                                        $end='...') }}
                                    </h4>

                                    <p> {!! str_limit( strip_tags($actualite->$description) , $limit=250,
                                        $end='...') !!}</p>
                                    <div class="card-footer mt10 clearfix">
                                        <div class="{{ $pull_right }}">
                                            <a href="" class="share-news"><i class="fa fa-share-alt"></i>
                                                {{ __('button.Share') }}</a>
                                            <a href="{{ url("/pages/details/{$actualite->slug}") }}"
                                                class="read-more-news"><i class="fa fa-eye"></i>
                                                {{ __('button.VoirDetails') }}</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        @endif
                        @empty
                        {{ __('libelle.emptyActualite')}}
                        @endforelse

                        <!-- /. POST 1 -->

                    </div>

                    <!-- /. ROW -->
                    <!-- /. ROW -->
                    <nav aria-label="..." class="text-center">
                        {!! $listPages->links("pagination::bootstrap-4") !!}
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