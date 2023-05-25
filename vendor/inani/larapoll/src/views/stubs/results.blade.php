@if(Session::has('errors'))
    <div class="alert alert-danger">
            {{ session('errors') }}
    </div>
@endif
@if(Session::has('success'))
    <div class="alert alert-success">
        {{ session('success') }}
    </div>
@endif
<h5>
@php
                    $questionLang = explode('/',$question);
                    //dd(count($questionLang));
                @endphp
                @switch($locale)
                                @case('ar')
                                {{ $questionLang[0] }}
                                @break
                                @case('fr')
                                @if(count($questionLang) >1){{ $questionLang[1] }} @else {{ $question }} @endif
                                @break
                                @case('en')
                                @if(count($questionLang) >1 && count($questionLang) >=2 ){{ $questionLang[2] }} @else {{ $question }} @endif
                                @break
                            @endswitch
                
</h5>

@foreach($options as $option)
    <div class='result-option-id'>
        <strong>
            @php
                $optionLang = explode('/',$option->name);
                //dd($questionLang);
                @endphp
        @switch($locale)
                                @case('ar')
                                {{ $optionLang[0] }}
                                @break
                                @case('fr')
                                @if(count($optionLang) >1){{ $optionLang[1] }} @else {{ $option->name }} @endif
                                @break
                                @case('en')
                                @if(count($optionLang) >1 && count($optionLang) >=2 ){{ $optionLang[2] }} @else {{ $option->name }}@endif
                                @break

                            @endswitch
        </strong><span class='pull-right'>{{ $option->percent }} % </span>
        <div class='progress'>
            <div class='progress-bar progress-bar-striped active' role='progressbar' aria-valuenow='{{ $option->percent }}' aria-valuemin='0' aria-valuemax='100' style='width: {{ $option->percent }}%'>
                <span class='sr-only'>{{ $option->percent }} % </span>
            </div>
        </div>
    </div>
@endforeach
