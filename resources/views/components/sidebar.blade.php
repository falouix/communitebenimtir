<div class="col-md-3 col-xs-12 hidden-sm hidden-xs">
    <div class="right-sidebar">
        @php
            $listActualite = App\Actualite::where('status', '=', 'PUBLISHED')
                ->where('date_publication', '<=', Carbon\Carbon::now()->format('Y-m-d'))
                ->orderBy('date_publication', 'desc')
                ->take(3)
                ->get();
            $listEvents = App\Evenement::where('status', '=', 'PUBLISHED')
                ->where('date_debut', '<=', Carbon\Carbon::now()->format('Y-m-d'))
                ->orderBy('date_debut', 'desc')
                ->take(3)
                ->get();
        @endphp

            <div class="widget">
                <h5 class="widget-title line-bottom-theme-colored-1">{{ __('libelle.SideActualite') }}<span></span>
                </h5>
                <ul class="thumbnail-widget">
                    @forelse ($listActualite as $item)
                        <li>
                            <div class="thumb-wrap">
                                <img width="60" height="60" alt="Thumb" class="img-responsive lazyload"
                                    data-src="{{ voyager::image($item->vignette) }}">
                            </div>
                            <div class="thumb-content"><a
                                    href="{{ url("/actualites/{$item->slug}") }}">{{ str_limit($item->$titre, $limit = 30, $end = '...') }}</a>
                                <span>{{ $item->date_publication }}</span>
                            </div>
                        </li>
                    @empty
                    <h6> {{ __('libelle.emptyEvent') }} </h6>
                    @endforelse
                </ul>
                <!-- Thumbnail Widget -->
            </div>

            <div class="widget">
                <h5 class="widget-title line-bottom-theme-colored-1">{{ __('routes.Event') }}<span></span></h5>
                <ul class="thumbnail-widget">
                    @forelse ($listEvents as $event)
                        <li>
                            <div class="thumb-wrap">
                                <img width="60" height="60" alt="Thumb" class="img-responsive lazyload"
                                    data-src="{{ voyager::image($event->Vignette) }}">
                            </div>
                            <div class="thumb-content"><a
                                    href="{{ url("/evenements/{$event->slug}") }}">{{ str_limit($event->$titre, $limit = 30, $end = '...') }}</a>
                                <span>{{ $event->date_publication }}</span>
                            </div>
                        </li>
                    @empty
                    <h6>
                        {{ __('libelle.emptyActualite') }}
                        </h6>
                    @endforelse

                </ul>
                <!-- Thumbnail Widget -->
            </div>


    </div>
</div>
