<div class="page-bread clearfix">
    <ol class="breadcrumb">
        <div class="container">
            <li><a href="{{ url('/') }}">{{ __('routes.Home') }}</a></li>
            @for ($i = 0; $i < $count; $i++) <li>/</li>
                <li><a href="{{ url($urlBread[$i]) }}" class="{{ $IsActive[$i] }}">{{ $urlName[$i] }}</a></li>
                @endfor

        </div>
    </ol>
</div>