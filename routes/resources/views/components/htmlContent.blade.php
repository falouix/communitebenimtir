<div class="widget-title Title24 green-title">{{ $item->$titre }}</div>
<div class="widget-content">
    <!-- Pilgrimage CONTENT -->
@php $content = "contenu_specifique_{$locale}"; @endphp

{!! $item->$content !!}
</div>
