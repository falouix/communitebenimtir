@extends('layout.layout')
@section('title')
{{ __('routes.Home') }}
@endsection
@section('menu')
@include('layout.partials.menu', ['frontMenu' => $frontMenu])
@endsection

@section('sideheadmenu')
<div class="widget">
  <h4 class="title">Medias</h4>
  <ul class="link">
    <li><a href="#">Web TV</a></li>
    <li><a href="#">Gallerie</a></li>
  </ul>
</div>
@endsection

<!-- Section content : Actualités, Evenements, Chiffres clés etc.. -->
@section('content')
<section class="error-page">
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">
                <div class="error-content" style="
                border-top-width: 200px;
                padding-top: 200px;
            ">
                    <div class="error-title ff-montserrat color-gray"><span class="text-thm2"> @yield('code')</span></div>
                    <h1 class="sub-title ff-montserrat fz60"> @yield('message')</h1>
                    <p class="color-black33">{{ __('libelle.ErrorHandler') }}</p>
                    <a class="btn btn-lg ulockd-btn-white" style="
                    color: blue;" href="/">{{ __('routes.Home') }}</a>
                </div>
            </div>
        </div>
    </div>
</section>

@endsection



