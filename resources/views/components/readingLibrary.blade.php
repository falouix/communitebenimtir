<div class="top-titles clearfix">
    <div class="pull-right">
        <h2 class="Title24 green-title">{{ __('routes.PubRecherches') }}</h2>
    </div>
    <div class="pull-left"> <a href="{{ url('/PubRecherches') }}" class="green-title"><i class="fa fa-eye"></i>
            {{ __('button.VoirTous') }}
        </a></div>
</div>
<!-- 1 -->
@foreach ($listPublications as $item)
<div class="media">
    <div class="media-left media-middle">
        <a href="{{ url('/PubRecherches') }}">
            <img width="200px" class="media-object lazyload" data-src="{{ voyager::image($item->vignette) }}"
                alt="{{ $item->$titre }}">
        </a>
    </div>
    <div class="media-body">
        <h4 class="media-heading">{{ $item->$titre }}</h4>
        <p class="mt10">{!! str_limit(strip_tags($item->$description), $limit=220,
            $end='...') !!}</p>
    </div>
</div>
@endforeach
<!-- /. 1 -->
