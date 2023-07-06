@extends('layout.layout')

@section('title')
{{ $actualite->$titre }}
@endsection

@section('menu')
@include('layout.partials.menu', ['frontMenu' => $frontMenu])
@endsection

@section('sideheadmenu')
<div class="widget">
    <h4 class="title">Medias</h4>
    <ul class="link">
        <li><a href="#">Web TV</a></li>
        <li><a href="#">Gallerie</a></li>
    </ul>
</div>
@endsection
@section('content')
<div class="ulockd-inner-page">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="ulockd-icd-layer">
                    <ul class="list-inline ulockd-icd-sub-menu ulockd-mrgn60">
                        <li><a href="/"> {{ __('routes.Home') }} </a></li>
                        <li><a href="#"> &gt; </a></li>
                        <li> <a href="/actualites"> {{ __('libelle.ListActualite') }} </a> </li>
                        <li><a href="#"> &gt; </a></li>
                        <li> <a href="#"> {{ str_limit( strip_tags($actualite->$titre) , $limit=80, $end='...') }} </a> </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<section class="ulockd-service bgc-whitef7">
    <div class="container">
        <div class="row">
            @include('partials.sidebar',['showSideMenu'=>'true','MenuParam'=>$frontMenu])
                <div class="col-md-9 bgc-white ulockd-pad615 ulockd-pad1215">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-xxs-12 col-xs-5 col-sm-4 col-md-4 ulockd-pdng0">
                                <img class="img-responsive img-whp thumbnail" @if(!empty($actualite->vignette))
									src={{ voyager::image($actualite->vignette) }}
							   @else
									src="/images/default/default-news.jpg"
                               @endif
                                alt="$actualite.alt">
                            </div>
                            <div class="col-xxs-12 col-xs-7 col-sm-8 col-md-8">
                                <h3 class="ulockd-mrgn120 c-blue" > {!! $actualite->$titre !!} </h3>

                                <ul class="list-inline ulockd-mrgn1225">
                                    <li><span class="color-black22"> <i class="fa fa-calendar icon-style1"></i> {{ __('libelle.DatePublication') }}
                                        </span>: {!! $actualite->date_publication !!}</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="row ulockd-mrgn1220 cases-details">
                        <div class="col-md-12">
                            <p class="project-dp-one ulockd-mrgn620">{!! $actualite->$description !!}</p>
                        </div>
                    </div>
                    <div class="fancybox-gallery-slider">
                        @foreach(json_decode($actualite->carousel, true) as $image)
                        <div class="item">
                            <div class="gs-thumb">
                                <img class="img-responsive img-whp" src="{{ Voyager::image($image) }}" alt="2.jpg">
                                <div class="gallery-overlay">
                                    <div class="lbox-caption">
                                        <div class="lbox-details">
                                            <a class="lightbox-image" data-fancybox-group="preject" href="{{ Voyager::image($image) }}">
                                                <span class="fa fa-photo"></span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        @endforeach
                    </div>
                </div>
</div>
</div>
</section>
@endsection
