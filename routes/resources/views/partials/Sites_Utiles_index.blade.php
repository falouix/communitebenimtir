 <section class="ulockd-partner ulockd-bgthm1 section-pad5 ">
        <div class="container ">
            <div class="row ">
                <div class="col-md-8 col-md-offset-2 col-lg-6 col-lg-offset-3 text-center ">
                    <div class="ulockd-main-title " style=" margin-bottom: 10px; ">
                    <h3>{{ __('libelle.siteUtiles') }}</h3>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="fancybox-gallery-slider">
                    @foreach($listSitesUtiles as $singleSiteUtile)
                        <div class="item">
                            <div class="gs-thumb">
                                <img class="img-responsive img-whp" src="{{ voyager::image($singleSiteUtile->image) }}" alt="{{ $singleSiteUtile->$titre }}">
                                <div class="gallery-overlay">
                                    <div class="lbox-caption">
                                        <div class="lbox-details">
                                            <a class="lightbox-image " href="{{ $singleSiteUtile->lien }}" target="_blank">
                                                <span class="fa fa-link"></span>
                                            </a>
                                            <h5>{{ $singleSiteUtile->$titre }}</h5>
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
