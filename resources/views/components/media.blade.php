<div class="top-titles clearfix">
    <div class="pull-right">
        <h2 class="Title24 green-title">{{ __('routes.media') }}</h2>
    </div>
    <div class="pull-left"> <a href="{{ url('/galleries/webtv') }}" class="green-title"><i class="fa fa-eye"></i>
            {{ __('button.VoirTous') }} </a></div>
</div>
<!-- VIDEO AUDIO -->
@php
$videos = App\Gallery::Where('status','PUBLISHED')
->where('date_debut', '<=', Carbon\Carbon::now()->format('Y-m-d'))
->where('date_fin', '>=', Carbon\Carbon::now()->format('Y-m-d'))
->Where('type','webtv')
->orderBy('date_debut', 'desc')
->orderBy('featured', 'desc')
->take(2)->get();
//dd($videos);
if($videos->count() == 0){
$videos = App\Gallery::Where('status','PUBLISHED')
->where('featured', 1)
->Where('type','webtv')
->orderBy('date_debut', 'desc')
->take(2)->get();
}
//dd($videos);

@endphp

@switch(count($videos))
@case(1)
<div class="col-md-6 col-sm-6 library-videos">
    <div class="mt10">
        <a href="{{ url("/gallerie/".$videos[0]->slug) }}">{{ str_limit($videos[0]->$titre, $limit=42, $end='...') }}</a>
    </div>
    @if($videos[0]->youtube == "on")

    <div class="vid-wh" controls="">
        <iframe width="250" height="250" src="https://www.youtube.com/embed/{{$videos[0]->lienyoutube}}" frameborder="0"
            allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    </div>
    @else
    @php
       $firstvideo= json_decode($videos[0]->videos); 
       $explode = explode('.', $firstvideo[0]);
       $extension= $explode[count($explode)-1];
      // dd($extension);
    @endphp
    @if($extension=="mp3")
    <audio controls>
        <source src="{{ voyager::image($firstvideo[0]) }}" >
      </audio>
    
    @else
    <video class="vid-wh">
        <source src="{{ voyager::image($videos[0]->cover) }}" type="video/mp4">
    </video>
    <video class="vid-wh"
    controls @if($videos[0]->cover) poster= "{{ voyager::image($videos[0]->cover) }}" @endif> 
    <source src= "{{  voyager::image($firstvideo[0])  }}"
         type="video/mp4"> 
    </video>
    @endif

    @endif
</div>
@break
@case(2)
<div class="col-md-6 col-sm-6 library-videos">
    <div class="mt10">
        <a href="{{ url("/gallerie/".$videos[0]->slug) }}">{{ str_limit($videos[0]->$titre, $limit=42, $end='...') }}</a>
    </div>
    @if($videos[0]->youtube == "on")

    <div class="vid-wh" controls>
        <iframe width="250" height="250" src="https://www.youtube.com/embed/{{$videos[0]->lienyoutube}}" frameborder="0"
            allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    </div>
    @else
    @php
       $firstvideo= json_decode($videos[0]->videos); 
       $explode = explode('.', $firstvideo[0]);
       $extension= $explode[count($explode)-1];
      // dd($extension);
    @endphp
    @if($extension=="mp3")
    <audio controls>
        <source src="{{ voyager::image($firstvideo[0]) }}" >
      </audio>
    
    @else
    <video class="vid-wh">
        <source src="{{ voyager::image($videos[0]->cover) }}" >
    </video>
    <video class="vid-wh"
    controls @if($videos[0]->cover) poster= "{{ voyager::image($videos[0]->cover) }}" @endif> 
    <source src= "{{  voyager::image($firstvideo[0])  }}"
         type="video/mp4"> 
    </video>
    @endif
    
    @endif

</div>
<div class="col-md-6 col-sm-6 library-videos">
    <div class="mt10">
        <a href="{{ url("/gallerie/".$videos[1]->slug) }}">{{ str_limit($videos[1]->$titre, $limit=42, $end='...') }}</a>
    </div>
    @if($videos[1]->youtube == "on")

    <div class="vid-wh" controls="">
        <iframe width="250" height="250" src="https://www.youtube.com/embed/{{$videos[1]->lienyoutube}}" frameborder="0"
            allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    </div>
    @else
    @php
       $firstvideo= json_decode($videos[1]->videos); 
       $explode = explode('.', $firstvideo[0]);
       $extension= $explode[count($explode)-1];
      // dd($extension);
    @endphp
    @if($extension=="mp3")
    <audio controls>
        <source src="{{ voyager::image($firstvideo[0]) }}" >
      </audio>
    
    @else
    <video class="vid-wh">
        <source src="{{ voyager::image($videos[1]->cover) }}" type="video/mp4">
    </video>
    <video class="vid-wh"
    controls @if($videos[0]->cover) poster= "{{ voyager::image($videos[1]->cover) }}" @endif> 
    <source src= "{{  voyager::image($firstvideo[0])  }}"
         type="video/mp4"> 
    </video>
    @endif
    
    @endif
</div>
@break
@endswitch
<!-- /. VIDEO AUDIO -->
