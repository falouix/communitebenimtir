@php
switch ($locale) {
case 'ar':
$title = 'title_ar';
break;
case 'fr':
$title = 'title';
break;
case 'en':
$title = 'title_en';
break;
}
@endphp
@foreach ($frontMenu as $item)
@php

$originalItem = $item;
//dd($item);
@endphp

@if(!$originalItem->children->isEmpty())
<li class="dropdown">
    <a href="{{ $item->link() }}" class="dropdown-toggle" data-toggle="dropdown"
        data-target="{{$public_url}}{{ $item->link() }}" target="{{ $item->target }}">
        {{ $item->$title }}
        <b class="caret"></b></a>
    <ul class="dropdown-menu">
        @foreach ($originalItem->children as $subitem1)

        @php

        $originalItem = $subitem1;

        @endphp
        @if(!$originalItem->children->isEmpty())
        <li class="dropdown-submenu">
            <a tabindex="-1" href="{{ $subitem1->link() }}"
                data-target="{{ $subitem1->link() }}">{{ $subitem1->$title }}</a>
            <ul class="dropdown-menu">
                @foreach ($originalItem->children as $subitem2)
                @php
                $originalItem = $subitem2;
                @endphp
                @if(!$originalItem->children->isEmpty())
                <li class="dropdown-submenu">
                    <a tabindex="-1" href="{{ $subitem2->link() }}">{{ $subitem2->$title }}</a>
                    <ul class="dropdown-menu">
                        @foreach ($originalItem->children as $itemfin)
                        <li><a tabindex="-1" href="{{ $itemfin->link() }}">{{ $itemfin->$title }}</a>
                        </li>
                        @endforeach

                    </ul>
                </li>
                @else
                <li><a href="{{ $subitem2->link() }}">{{ $subitem2->$title }}</a></li>
                @endif
                @endforeach
            </ul>

        </li>
        @else

        <li>
            <a href="{{ $subitem1->link() }}" class="dropdown-toggle" data-toggle="dropdown"
                target="{{ $subitem1->target }}">{{ $subitem1->$title }}</a>
        </li>
        @endif
        @endforeach
    </ul>
</li>
@else
<li>
    <a href="{{ $item->link() }}" class="dropdown-toggle" data-toggle="dropdown"
        data-target="{{ $item->link() }} target=" {{ $item->target }}">{{ $item->$title }}</a>
</li>
@endif

@endforeach
