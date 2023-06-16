<!doctype html>
<html @if (app()->getLocale()=='ar') dir="rtl" @else dir="ltr" @endif
lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <!---->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="société CDF">
    @yield('SEO')
    @include('layout.partials.head-scripts')

</head>

<body>
    @include('layout.partials.headbar')
    @yield('content')

    @yield('scripts-contents')

</body>

</html>
