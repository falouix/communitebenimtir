<div class="top-titles clearfix">
    <div class="pull-right">
        <h2 class="Title24 green-title">{{ __('libelle.Poll') }}</h2>
    </div>

</div>
    <div class="mt10">
        <!-- VOTING CONTENT -->
        @php
            $activePoll = Inani\Larapoll\Poll::where('isClosed',null)
                                                ->whereDate('starts_at','<=', now())
                                                ->whereDate('ends_at','>=', now())
                                                ->first();
            //dd($activePoll);
        @endphp

        @if($activePoll)    
        {{ PollWriter::draw($activePoll) }}
        @endif
    </div>
</div>

