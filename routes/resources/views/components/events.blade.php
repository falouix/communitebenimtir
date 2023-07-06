<div class="top-titles clearfix">
    <div class="pull-right">
        <h2 class="Title24 green-title">{{ __('libelle.Evenement') }} </h2>
    </div>
    <div class="pull-left"> <a href="{{ url('/evenements') }}" class="green-title"><i class="fa fa-eye"></i>
            {{ __('button.VoirTous') }}
        </a>
    </div>
</div>
<!-- carousel -->
<div>
    <!-- Wrapper for slides -->
    <div>
        @if(count($listEvents)>0)
        @for ($i = 0; $i < count($listEvents); $i++) <div class="item {{ $i==0 ? 'active' : '' }}">
            <!-- EVENT 1 -->
            <div class="col-md-6">
                <div class="media">
                    <div class="media-left media-middle">
                        <a href="#">
                            <img class="media-object lazyload"
                                data-src="{{ voyager::image($listEvents[$i]->Vignette) }}" alt="image">
                        </a>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">
                            <a
                                href="{{ url("/evenements/{$listEvents[$i]->slug}") }}">{{ str_limit($listEvents[$i]->$titre, $limit=90, $end='...')}}</a>
                        </h4>
                        <div class="news-date">
                            <span><i class="fa fa-clock-o"></i> {{ $listEvents[$i]->date_debut }}</span>
                            <span><i class="fa fa-map-marker" aria-hidden="true"></i>
                                {{ $listEvents[$i]->$lieu }}</span>
                        </div>
                        <p class="mt10"> {!! str_limit(strip_tags($listEvents[$i]->$description), $limit=100,
                            $end='...')
                            !!}</p>
                        <div class="news-btn mt20">
                            <a href="{{ url("/evenements/{$listEvents[$i]->slug}") }}"
                                class="yellow-btn">{{ __('button.VoirPlus') }}</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /. EVENT 1 -->
    </div>
    @endfor
    @else
    <h4> {{ __('libelle.emptyEvent') }} </h4>
    @endif
</div>
</div>
</div>

</div>
