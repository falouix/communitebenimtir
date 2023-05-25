<section class="ulockd-service-three" style="padding-top: 20px;">
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2 col-lg-6 col-lg-offset-3 text-center">
                <h2>{!! __('libelle.Gallerie') !!}</h2>
            </div>
            <div class="col-md-12">
                <!-- Masonry Filter -->
                <ul class="list-inline masonry-filter text-center">
                    <li><a href="#" class="active" data-filter="*">{{ __('libelle.Tous') }}</a></li>
                    <li><a href="#" data-filter=".gallerie" class="">{{ __('libelle.FiltreGallerie') }}</a></li>
                    <li><a href="#" data-filter=".webtv" class="">{{ __('libelle.FiltreWebTv') }}</a></li>
                </ul>
                <!-- End Masonry Filter -->
                <!-- Masonry Grid -->
                <div id="grid" class="masonry-gallery grid-5 mrgn10 clearfix"
                    style="position: relative; height: 234px;">
                    @foreach ($listWebTv as $webTvItem)
                    <!-- Masonry Item -->
                    <div class="isotope-item webtv" style="position: absolute; left: 702px; top: 0px;">
                        <div class="gallery-thumb">
                            <img class="img-responsive img-whp" src="{{ voyager::image($webTvItem->cover) }}"
                                alt="project">
                            <div class="overlayer">
                                <div class="lbox-caption">
                                    <div class="lbox-details">
                                        <h5>{{ $webTvItem->$titre }}</h5>
                                        <ul class="list-inline">
                                            <li>
                                                <a href="/galleries">
                                                    <span class="fa fa-play-circle"></span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Masonry Item -->
                    @endforeach

                    @foreach ($listGallerie as $gallerieItem)
                    <!-- Masonry Item -->
                    <div class="isotope-item gallerie" style="position: absolute; left: 0px; top: 0px;">
                        <div class="gallery-thumb">
                            <img class="img-responsive img-whp" src="{{ voyager::image($gallerieItem->cover) }}"
                                alt="project">
                            <div class="overlayer">
                                <div class="lbox-caption">
                                    <div class="lbox-details">
                                        <h5>{{ $gallerieItem->$titre }}</h5>
                                        <ul class="list-inline">
                                            <li>
                                                <a class="popup-img" href="{{ voyager::image($gallerieItem->cover) }}"
                                                    title="{{ $gallerieItem->$titre }}"><span
                                                        class="fa fa-plus-square"></span></a>
                                            </li>
                                            <li>
                                                <a class="link-btn" href="#"><span class="fa fa-link"></span></a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Masonry Item -->
                    @endforeach
                </div>
                <!-- Masonry Gallery Grid Item -->
            </div>
        </div>
    </div>
</section>
