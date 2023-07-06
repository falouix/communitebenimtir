<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>{{ __('libelle.siteName') }}|@yield('title','بلدية عوسجة')</title>

<!-- CSS FILES AND LIBS -->

@if (app()->getLocale()=='ar')
<link rel="stylesheet" type="text/css" href="{{ asset('css/bootstrap.min.css') }}">
<link rel="stylesheet" type="text/css" href="{{ asset('css/bootstrap-rtl.min.css') }}">
<link rel="stylesheet" rel="preload"
as="style" type="text/css" href="{{ asset('css/style.css') }}">
<link rel="stylesheet" rel="preload"
as="style" type="text/css" href="{{ asset('css/responsive.css') }}">
@else
<link rel="stylesheet" type="text/css" href="{{ asset('css/bootstrap-ltr.min.css') }}">
<link rel="stylesheet" type="text/css" href="{{ asset('css/bootstrap-fr.min.css') }}">
<link rel="stylesheet" type="text/css" href="{{ asset('css/style-fr.css') }}">
<link rel="stylesheet" type="text/css" href="{{ asset('css/responsive-fr.css') }}">

@endif
<link rel="stylesheet" type="text/css" href="{{ asset('css/hover-min.css') }}">
<link rel="stylesheet" type="text/css" href="{{ asset('css/font-awesome.min.css') }}">

<link rel="stylesheet" type="text/css" href="{{ asset('css/animate.css') }}">
<link rel="stylesheet" type="text/css" href="{{ asset('owl-carousel/dist/assets/owl.carousel.css') }}">
<link rel="stylesheet" type="text/css" href="{{ asset('owl-carousel/dist/assets/owl.theme.default.min.css') }}">
<!--<link href="https://fonts.googleapis.com/css?family=Cairo&display=swap" rel="stylesheet">-->
@yield('head-scripts')
<script src="{{ asset('chartjs/dist/Chart.min.js') }}"></script>
<script src="{{ asset('chartjs/dist/utils.js') }}"></script>
<!--favicon for all devices
<link rel="apple-touch-icon" sizes="57x57" href="{{ asset('img/favicone/apple-icon-57x57.png')}}">
<link rel="manifest" href="/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="theme-color" content="#ffffff">-->
<!--head script-->
