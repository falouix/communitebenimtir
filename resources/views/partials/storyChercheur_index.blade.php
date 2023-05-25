<section id="testimonial" class="split-divider ">
        <div class="container-fluid">
            <div class="row">
                <div class=" col-sm-5 col-md-offset-1">
                    <div class="row">
                        <!-- Title -->
                        <div class="whychose-title tac-xsd">
                            <h2><a href="/successStory">{{ __('libelle.SuccessStory') }}</a></h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="row ulockd-mrgn310">
                        <div class="col-sm-6">
                            <!-- News Wrapper -->
                            <!-- News Wrapper -->
                            <!-- Widget -->
                            <div class="widget no-box margin-top-50">
                                <ul class="thumbnail-widget ">
                                @for ($i = 0; $i < 2; $i++)
                                @if(!empty ( $listSuccessStory[$i] ) )
                                          <li>
                                        <div class="thumb-wrap">
                                            <img   width="200 " height="100" alt="Thumb " class="img-responsive"  @if(!empty($listSuccessStory[$i]->image))
                                    src={{ voyager::image($listSuccessStory[$i]->image) }}
                               @else
                                    src="/images/default/default-news.jpg"
                               @endif
                                class="img-responsive thumbnail" alt="Blog">
                                        </div>
                                        <div class="thumb-content">
                                            <a href="/successStory/{{ $listSuccessStory[$i]->slug }}">{{$listSuccessStory[$i]->$titre}}</a>
                                            <p>{!! str_limit( strip_tags($listSuccessStory[$i]->$description) , $limit=93, $end='...') !!}</p>
                                        </div>
                                    </li>
                                    @endif
                                    @endfor
                                </ul>
                                <!-- Thumbnail Widget -->
                            </div>
                            <!-- Widget -->
                        </div>
                        <!-- Column -->
                        <!-- Column -->
                        <div class="col-sm-6 ">
                            <!-- News Wrapper -->
                            <!-- News Wrapper -->
                            <!-- Widget -->
                            <div class="widget no-box margin-top-50 ">
                                <ul class="thumbnail-widget ">
                                     @for ($i = 2; $i < 4; $i++)
                                @if(!empty ( $listSuccessStory[$i] ) )
                                          <li>
                                        <div class="thumb-wrap">
                                            <img   width="200 " height="100" alt="Thumb " class="img-responsive"  @if(!empty($listSuccessStory[$i]->image))
                                    src={{ voyager::image($listSuccessStory[$i]->image) }}
                               @else
                                    src="/images/default/default-news.jpg"
                               @endif
                                class="img-responsive thumbnail" alt="Blog">
                                        </div>
                                        <div class="thumb-content">
                                            <a href="/successStory/{{ $listSuccessStory[$i]->slug }}">{{$listSuccessStory[$i]->$titre}}</a>
                                            <p>{!! str_limit( strip_tags($listSuccessStory[$i]->$description) , $limit=93, $end='...') !!}</p>
                                        </div>
                                    </li>
                                    @endif
                                    @endfor
                                </ul>
                                <!-- Thumbnail Widget -->
                            </div>
                            <!-- Widget -->
                        </div>
                        <!-- Column -->
                    </div>
                    </div><!-- Row -->
                </div>
                <div class="col-sm-6 col-md-6 col-lg-6">
                    <div class="testimonial_grid text-center">
                        <div class="thumb">
                            <a href="/chercheur/{{ $chercheurDuMois->slug }}">
                              <img  width="100" height="100" alt="Thumb" class="img-responsive"  @if(!empty($chercheurDuMois->photo))
                                    src={{ voyager::image($chercheurDuMois->photo) }}
                               @else
                                    src="/images/default/default-news.jpg"
                               @endif
                                class="img-responsive thumbnail" alt="Blog">
                            </a>
                        </div>
                        <div class="details" style="padding: 60px 30px 25px;">
                            <h6 class="text-uppercase color-white fz14"><a href="/chercheurs/{{ $chercheurDuMois->slug }}" class="text-uppercase color-white fz14">{{ __('libelle.ChercheurDuMois') }}</a></h6>
                            <p class="fz15">{{ $chercheurDuMois->$nom }}</p>
                            <p >{!! str_limit($chercheurDuMois->$experience, $limit=368, $end='...') !!}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
