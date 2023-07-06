@php
if ($mode=="1") {
$seo_description = setting("seo.site_description_{$locale}");
$seo_keys = setting("seo.site_keywords_{$locale}");
$ogImage = setting('site.logo');
}
if ($seo_description =="") $seo_description = setting("seo.site_description_{$locale}");
if($seo_keys =="") $seo_keys = setting("seo.site_keywords_{$locale}");
if($ogImage =="") $ogImage = $ogImage = setting('site.logo');
@endphp
<meta name="description" content="{{ $seo_description }}">
<meta name="keywords" content="{{ $seo_keys }}">

<meta property="og:title" content="" />
<meta property="og:description" content="{{ $seo_description }}" />
<meta property="og:image" content="{{ $ogImage }}" />