<div class="col-xs-12 col-sm-6 col-md-3 col-lg-3 ulockd-pad3910 hidden-xs hidden-sm">
    <div class="widget sidebar-widget-cdf">
            @if ($showSideMenu =='true')
        <div class="widget">
            <div class="sidebar sidebar-left mt-sm-30 mr-30 mr-sm-0">
                <div class=" nav-side-menu widget border-1px bg-silver-deep p-15">
                    <div>
                        <h3 class="widget-title line-bottom-theme-colored-2"> Menu</h3>
                    </div>
                    <i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i>
                    <div class="menu-list">
                        <ul id="menu-content">
                            @include('layout.partials.side-menu', ['sideMenu'=>$MenuParam])
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        @endif
        <h3>{{ __('libelle.Evenement') }}</h3>
        <div class="bx-wrapper" style="max-width: 100%;">
            <div class="bx-viewport" aria-live="polite"
                style="width: 100%; overflow: hidden; position: relative; height: 128px;">
                <ul class="testimonial-carousel"
                    style="width: auto; position: relative; transition-duration: 0s; transform: translate3d(0px, -133px, 0px);">
                    @foreach ($listEvenements as $event)
                    <li style="float: none; list-style: none; position: relative; width: 270px; margin-bottom: 5px;"
                        class="bx-clone" aria-hidden="true">
                        <div class="media">
                            <div class="media-left pull-left">
                                <a href="/evenements/{{ $event->slug }}">
                                    <img class="media-object thumbnail" @if(!empty($event->Vignette))
                                src={{ voyager::image($event->Vignette) }}
                                @else
                                src="/images/default/default-event.jpg"
                                @endif alt="event" width="90" height="90">
                                </a>
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">{{ $event->$titre }}</h4>
                                <p class="ulockd-tcompliment">{!! str_limit( strip_tags($event->$description) , $limit=45, $end='...')
                                !!}</p>
                                <span style="color: #3f77e3;"><i class="fa fa-clock-o"></i> {{ $event->date_debut }}
                                </span>
                            </div>
                        </div>
                    </li>
                    @endforeach
                </ul>
            </div>
            <div class="bx-controls"></div>
        </div>
        <h3 class="widget-title ulockd-bb-dashed " style="margin-top: 20px;"><span
                class="fa fa-calendar text-thm2"></span> {{ __('libelle.AppelsOffres') }}</h3>
        <div class="ulockd-lp">
            <div class="ulockd-latest-post">
                @foreach ($listAppelsOffres as $offre)
                <div class="media">
                    <div class="media-left pull-left">
                        <a href="#">
                            <img class="media-object thumbnail" @if(!empty($offre->image))
                                src={{ voyager::image($offre->image) }}
                                @else
                                src="/images/default/default-AO.jpg"
                                @endif
                                 alt="appel d'offre" width="90" height="90">
                        </a>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">{{ $offre->$titre }}</h4>
                        {!! str_limit( strip_tags($offre->$description) , $limit=50, $end='...')
                        !!}
                    </div>
                </div>
                @endforeach
            </div>

        </div>
    </div>
</div>
