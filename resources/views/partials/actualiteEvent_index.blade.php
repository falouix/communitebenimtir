<section class="bg-grey typo-dark">
    <div class="container">
        <div class="row">
            <!-- Section Actualités -->
            <div class="col-md-4">
                <div class="title-bg-line" style="margin-bottom: 10px ">
                    <h6 class="title"><a href="/actualites">{{ __('libelle.Actualite') }}</a></h6>
                    <h6 class="title {{$pull_right}} "> <a href="/actualites" class="bgc-transparent "
                            style="color: black; ">{{ __('button.VoirTousActualite') }} <i
                                class="fa fa-plus-square "></i></a>
                    </h6>
                </div>
                @if ($listActualite->count() == 0)
                <!-- Widget -->
                <div class="tab-news margin-top-00" style="height: 300px; ">
                    <!-- Title -->
                    <div class="blog-post-img-slider">

                        <ul class="thumbnail-widget">
                            <li>
                                <div class="thumb-content">
                                    {{ __('libelle.emptyActualite') }}
                                </div>
                            </li>
                        </ul><!-- Thumbnail Widget -->
                    </div>
                </div>
                @endif
                <div class="tab-news margin-top-00" @if($locale=='ar' ) style="height: 300px;direction: ltr;" @else
                    style="height: 300px;" @endif>
                    <!-- Title -->
                    <div class="blog-post-img-slider">
                        @foreach ($listActualite as $signleActualite)
                        <div class="item ">
                            <div class="media ">
                                <div class="media-left {{$pull}} ">
                                    <a href="/actualites/{{ $signleActualite->slug }}">
                                        <div class="tag "> {{ $signleActualite->date_publication }} </div>
                                        <img class="media-object thumbnail" style=" height: 184px;width: 500px; "
                                            @if(!empty($signleActualite->vignette))
                                        src={{ voyager::image($signleActualite->vignette) }}
                                        @else
                                        src="/images/default/default-news.jpg"
                                        @endif
                                        class="img-responsive thumbnail" alt="Blog">
                                    </a>
                                </div>
                                <div class="media-body ">
                                    <h4 class="media-heading "><a
                                            href="/actualites/{{ $signleActualite->slug }}">{{ $signleActualite->$titre }}</a>
                                    </h4>
                                    <p class="ulockd-tcompliment "> {!! str_limit(
                                        strip_tags($signleActualite->$description) , $limit=100, $end='...') !!}
                                    </p>
                                </div>
                            </div>
                        </div>
                        @endforeach
                    </div>
                </div>
            </div><!-- Column -->
            <!-- Section Evenements -->
            <div class="col-md-4">
                <div class="title-bg-line " style="margin-bottom: 10px ">
                    <h6 class="title "><a href="/evenements">{{ __('libelle.Evenement') }}</a></h6>
                    <h6 class="title {{$pull_right}} "> <a href="/evenements" class="bgc-transparent "
                            style="color: black; ">
                            {{ __('button.VoirTousEvenement') }} <i class="fa fa-plus-square "></i></a>
                    </h6>
                </div>
                <ul class="testimonial-carousel">
                    @foreach ($listevent as $signleevent)
                    <li class="h250 w250">
                        <div class="media">
                            <div class="media-left {{$pull}}">
                                <a href="{{ url('/evenements/'. $signleevent->slug) }}">
                                    <img class="media-object thumbnail w100" @if(!empty($signleevent->Vignette))
                                    src={{ voyager::image($signleevent->Vignette) }}
                                    @else
                                    src="/images/default/default-event.jpg"
                                    @endif alt="image event">
                                </a>
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading"><a
                                        href="{{ url('/evenements/'. $signleevent->slug) }}">{{ $signleevent->$titre }}</a>
                                </h4>
                                <p class="ulockd-tcompliment">{!! str_limit( strip_tags($signleevent->$description) ,
                                    $limit=283, $end='...') !!}
                                </p>
                            </div>
                        </div>
                    </li>
                    @endforeach
                </ul>
            </div>
            <div class="col-md-4">
                <div class="ulockd-faq-box ">
                    <div class="title-bg-line " style="margin-bottom: 10px ">
                        <h6 class="title "><a href="/appelsOffres/">{{ __('routes.AppelsOffre') }}</a></h6>
                        <h6 class="title {{$pull_right}}"> <a href="/appelsOffres/" class="bgc-transparent "
                                style="color: black; ">{{ __('button.VoirTousAO') }} <i
                                    class="fa fa-plus-square "></i></a>
                        </h6>
                    </div>
                    <div class="ulockd-faq-content">
                        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                            @for ($i = 0; $i < $listAppelsOffre->count(); $i++)
                                @if($i == 0)
                                <div class="panel panel-default">
                                    <div class="panel-heading" role="tab" id="heading{{$i}}">
                                        <h4 class="panel-title">
                                            <a class="collapsed" role="button" data-toggle="collapse"
                                                data-parent="#accordion" href="#collapse{{$i}}" aria-expanded="false"
                                                aria-controls="collapse{{$i}}">
                                                <i class="fa fa-angle-down icon-1"></i>
                                                <i class="fa fa-angle-up icon-2"></i>
                                                {{$listAppelsOffre[$i]->$titre}}</a>
                                        </h4>
                                    </div>
                                    <div id="collapse{{$i}}" class="panel-collapse collapse in " role="tabpanel"
                                        aria-labelledby="heading{{$i}}">
                                        <div class="panel-body">
                                            <p>{!! str_limit( strip_tags($listAppelsOffre[$i]->$description) ,
                                                $limit=100, $end='...') !!} <a
                                                    href="{{ URL::to('/appelsOffres/'.$listAppelsOffre[$i]->slug)}}">{{ __('button.VoirPlus') }}</a>
                                            </p>

                                            </h5>
                                        </div>
                                    </div>
                                </div>
                                @else
                                <div class="panel panel-default">
                                    <div class="panel-heading" role="tab" id="heading{{$i}}">
                                        <h4 class="panel-title">
                                            <a class="collapsed" role="button" data-toggle="collapse"
                                                data-parent="#accordion" href="#collapse{{$i}}" aria-expanded="false"
                                                aria-controls="collapse{{$i}}">
                                                <i class="fa fa-angle-down icon-1"></i>
                                                <i class="fa fa-angle-up icon-2"></i>
                                                {{$listAppelsOffre[$i]->$titre}}</a>
                                        </h4>
                                    </div>
                                    <div id="collapse{{$i}}" class="panel-collapse collapse" role="tabpanel"
                                        aria-labelledby="heading{{$i}}">
                                        <div class="panel-body">
                                            <p>{!! str_limit( strip_tags($listAppelsOffre[$i]->$description) ,
                                                $limit=100, $end='...') !!} <a
                                                    href="{{ URL::to('/appelsOffres/'.$listAppelsOffre[$i]->slug)}}">{{ __('button.VoirPlus') }}</a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                @endif
                                @endfor
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- Container -->
    </div>
</section>
