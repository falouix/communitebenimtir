<form method="POST" action="{{ route('poll.vote', $id) }}">
    @csrf
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">
                <span class="glyphicon glyphicon-arrow-right"></span> 
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
                
            </h3>
        </div>
    </div>
    <div class="panel-body">
        <ul class="list-group">
            @foreach ($options as $id => $name)
                @php
                $optionLang = explode('/',$name);
                //dd($questionLang);
                @endphp
                <li class="list-group-item">
                    <div class="radio">
                        <label>
                            <input value="{{ $id }}" type="radio" name="options">
                            @switch($locale)
                                @case('ar')
                                {{ $optionLang[0] }}
                                @break
                                @case('fr')
                                @if(count($optionLang) >1){{ $optionLang[1] }} @else {{ $name }} @endif
                                @break
                                @case('en')
                                @if(count($optionLang) >1 && count($optionLang) >=2 ){{ $optionLang[2] }} @else {{ $name }} @endif
                                @break

                            @endswitch
                            
                        </label>
                    </div>
                </li>
            @endforeach
        </ul>
    </div>
    <div class="panel-footer">
        <input type="submit" class="btn btn-primary btn-sm" value="Vote" />
    </div>
</form>
