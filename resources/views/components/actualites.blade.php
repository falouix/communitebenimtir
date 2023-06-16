<div class="top-titles clearfix">
    <div class="pull-right">
        <h2 class="Title24 green-title"> {{ __('libelle.Actualite') }} </h2>
    </div>
    <div class="pull-left"> <a href="{{ url('/actualites') }}" class="green-title"><i class="fa fa-eye"></i>
            {{ __('button.VoirTous') }}
        </a></div>
</div>
<div>
    <!-- Wrapper for slides -->
    <div>
        @if(count($listActualite)>0)
        @for ($i = 0; $i < count($listActualite); $i++) <div class="item {{ $i==0 ? 'active' : '' }}">
            <!-- NEW 1 -->
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="thumbnail">
                    <img data-src="{{ voyager::image($listActualite[$i]->vignette) }}" alt="News image"
                        class="lazyload">
                    <div class="caption">
                        <a href="{{ url("/actualites/{$listActualite[$i]->slug}") }}" class="news-title mt10 ">
                            {{ str_limit($listActualite[$i]->$titre, $limit=60, $end='...')}}</a>
                        <div class="news-date">{{ $listActualite[$i]->date_publication }} <i class="fa fa-clock-o"></i>
                        </div>
                        <p class="mt10"> {!! str_limit(strip_tags($listActualite[$i]->$description), $limit=120,
                            $end='...') !!}</p>
                        <div class="news-btn mt20">
                            <a href="{{ url("/actualites/{$listActualite[$i]->slug}") }}"
                                class="yellow-btn">{{ __('button.VoirPlus') }}</a>
                        </div>
                    </div>
                </div>
            </div>
            <!--/.NEWS 1 -->
            <!-- NEW 2 -->
            @if ($i+1 <count($listActualite)) <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="thumbnail">
                    <img data-src="{{ voyager::image($listActualite[$i+1]->vignette) }}" alt="News image"
                        class="lazyload">
                    <div class="caption">
                        <a href="#" class="news-title mt10">
                            {{ str_limit($listActualite[$i+1]->$titre, $limit=60, $end='...')}}</a>
                        <div class="news-date">{{ $listActualite[$i+1]->date_publication }} <i
                                class="fa fa-clock-o"></i></div>
                        <p class="mt10"> {!! str_limit(strip_tags($listActualite[$i+1]->$description), $limit=120,
                            $end='...') !!}
                        </p>
                        <div class="news-btn mt20">
                            <a href="{{ url("/actualites/{$listActualite[$i+1]->slug}") }}"
                                class="yellow-btn">{{ __('button.VoirPlus') }}</a>
                        </div>
                    </div>

                </div>
    </div>
    @php $i += 1; @endphp
    @endif
</div>
@endfor
@else
<h4>
{{ __('libelle.emptyActualite') }}
</h4>
@endif

</div>
<!-- Controls-->

</div>
