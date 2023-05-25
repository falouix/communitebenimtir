@php
$seo_description = "seo.site_description_{$locale}";
$seo_keys = "seo.site_keywords_{$locale}";
@endphp
<meta name="description"
    content="{{ setting($seo_description) }}">
<meta name="keywords"
    content="{{ setting($seo_keys) }}">
<meta property="og:type" content="website">
<meta property="og:url" content="">
<meta property="og:site_name" content="">
