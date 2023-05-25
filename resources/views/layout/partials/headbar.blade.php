<div class="top-header">
    <div class="container">
        @php
        $liensHeads = App\Lien :: where('afficher_dans', '=', 'top_header')
        ->orderBy('ordre')
        ->get();
        @endphp
        <!--container-->
        <!-- TOP HEADER LINKS -->
        <div class="col-md-8 col-sm-12 col-xs-12 top-header-links hidden-xs">
            <ul id="topheader">
                @foreach ($liensHeads as $lienHead)
                <li><a href="{{ $lienHead->lien }}" target="{{ $lienHead->nv_onglet }}">
                        {{ $lienHead->$titre }}
                    </a>
                </li>
                @endforeach

            </ul>
        </div>
        <!-- FIN  TOP HEADER LINKS -->
        <!-- FONTS -->
        <div class="col-md-2 col-sm-6 col-xs-6 header-social-media">
            <ul>
                <li><a href="{{ setting('site.site_facebook') }}" target="_blank" title="Facbook"><i
                            class="fa fa-facebook"></i></a>
                </li>
            </ul>
        </div>
        <div class="col-sm-6 col-md-2 col-xs-6 text-left">
            <ul>
                @if(setting('site-langue.site_langue_fr')) <li class="lg-fr"><a
                        href="{{ LaravelLocalization::getLocalizedURL('fr') }}" title="Français">Fr</a></li> @endif
                @if(setting('site-langue.site_langue_ar')) <li class="lg-fr"><a
                        href="{{ LaravelLocalization::getLocalizedURL('ar') }}" title="العربية">ع</a></li> @endif
            </ul>
        </div>
        <!-- /. FONTS -->
    </div>
    <!-- ./ container-->
</div>

<!-- MAIN HEADER -->
<div class="main-header hidden-xs">
    <div class="container">
        <!-- container -->
        <div class="row">
            <!-- LOGO -->
            <div class="logo col-md-5 col-sm-4 col-xs-4">
                <a class="navbar-brand mt20" href="/"><img
                        src="{{ voyager::image(setting("site.sire_logoSm_{$locale}")) }}" alt="pixelsuae" width="100"
                        class="img-responsive hidden-lg hidden-md"></a>
                <a class="navbar-brand mt10" href="/"><img
                        src="{{ voyager::image(setting("site.site_logoLg_{$locale}")) }}" alt="pixelsuae" width="100"
                        class="img-responsive hidden-xs hidden-sm"></a>
            </div>
            <!--/. LOGO -->
            <!-- SEARCH -->
            <div class="search col-md-6 col-sm-8 col-xs-12 hidden-xs">
                <ul class="nav navbar-nav  mt30">
                    <li>
                        <form class="navbar-form" action="{{ url("/search") }}" method="GEt" role="search">
                            @csrf
                            <div class="form-group">
                                <input type="text" class="form-control"
                                    placeholder="{{ __('libelle.SearchPlaceHolder') }}" id="qglobal" name="qglobal">
                                <input type="text" name="model" id="model" value="all" hidden="">
                                <button type="submit" class="btn sm-green-btn">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </form>
                    </li>

                </ul>
            </div>
            <div class="search col-md-1 col-sm-8 col-xs-12 hidden-xs">
                <img src="{{ asset('/img/logo/drap.png') }}" alt="pixelsuae" width="100"
                    class="img-responsive hidden-xs hidden-sm" style=" padding-top: 30px;">
            </div>
            <!-- SEARCH -->
        </div>
    </div>
    <!-- /.container -->
</div>
<!--/. MAIN HEADER-->
<!-- NAVBAR -->
<div class="navbar text-left yellow-border">
    <div class="container">
        <nav class="navbar navbar-default">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed btn-border" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Menu</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                    <a href="{{ url('/') }}"><img src="{{ voyager::image(setting("site.sire_logoSm_{$locale}")) }}"
                            alt="image" class="img-responsive hidden-md hidden-lg hidden-sm"></a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav  hidden-sm hidden-md hidden-lg">

                        <li><a href="#">{{ __('libelle.faq') }}</a></li>
                        <li>
                            <form class="navbar-form" action="{{ url("/search") }}" method="GEt" role="search">
                                @csrf
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="ابحث" id="q" name="q">
                                    <input type="text" name="model" id="model" value="all" hidden="">
                                    <button type="submit" class="btn sm-green-btn">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </div>
                            </form>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav">
                        @include('layout.partials.menu')
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container -->
        </nav>
    </div>
</div>
<!--/. NAVBAR-->
