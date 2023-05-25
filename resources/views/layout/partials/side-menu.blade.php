@php
switch ($locale) {
case 'en':
$title='title';
break;
case 'ar':
$title='title_ar';
break;
default:
$title='title';
break;
}
@endphp

@foreach($sideMenu as $menuItem)

@if ($menuItem->children->isEmpty())
<li><a href="{{ $menuItem->url }}" target="{{ $menuItem->target }}">{{ $menuItem->$title }}</a></li>

@else
<li data-toggle="collapse" data-target="#{{ $menuItem->id }}" class="collapsed">
    <a href="#" class="ml-20">
        {{ $menuItem->$title }} <span class="arrow"></span>
    </a>
</li>

<ul class="sub-menu collapse" id="{{ $menuItem->id }}" style="">
    @foreach($menuItem->children as $subMenuItem)

    <li><a href="{{ $subMenuItem->$title }}" target="{{ $subMenuItem->target }}">{{ $subMenuItem->$title }}</a></li>

    @endforeach
</ul>
@endif
@endforeach