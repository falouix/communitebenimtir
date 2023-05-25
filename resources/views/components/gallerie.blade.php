<div class="top-titles clearfix">
    <div class="pull-right">
        <h2 class="Title24 green-title">{{ __('routes.PortFolio') }}</h2>
    </div>
    <div class="pull-left"> <a href="{{ url('/galleries') }}" class="green-title"><i class="fa fa-eye"></i>
            {{ __('button.VoirTous') }}
        </a></div>
</div>
<a href="/galleries/{{ $gallerie->slug }}">
    <div class="album-img">
        <img data-src="{{ voyager::image($gallerie->cover) }}" alt="{{ $gallerie->$titre }}"
            style="margin: auto; width: 100%; margin-top: 20px;" class="lazyload">
    </div>
</a>
