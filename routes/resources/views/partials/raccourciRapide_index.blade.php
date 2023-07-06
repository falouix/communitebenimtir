@php
    $titre='titre_'.$locale;
@endphp
<section class="ulockd-partner ulockd-bgthm1">
        <div class="container">
            <div class="row text-center">
                <div class="inline hidden-xs hidden-sm">
                @for ($i = 0; $i < $listRaccourciRapide->count(); $i++)
                    <a href="{{  $listRaccourciRapide[$i]->lien }}">
                        <div class="ulockd-partner-thumb text-center padd-left-right">
                            <div class="blog-raccourcis" style="background-color: {{  $listRaccourciRapide[$i]->color }}">
                                <div class="racc-rapide">
                                    <div class="details">
                                        <div class="racc-icon">
                                            <i class="{{  $listRaccourciRapide[$i]->icone}}"></i>
                                        </div>
                                        <h4 title="{{ $listRaccourciRapide[$i]->$titre }}">{{ $listRaccourciRapide[$i]->$titre }}</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                @endfor
                </div>
                <div class="col-md-12 col-lg-12 hidden-lg hidden-md ">
					<div class="fservice-slider">
                    @for ($i = 0; $i < $listRaccourciRapide->count(); $i++)
                    <div class="item">
                    <a href="{{  $listRaccourciRapide[$i]->lien }}">
                        <div class="ulockd-partner-thumb text-center padd-left-right">
                            <div class="blog-raccourcis" style="background-color: {{  $listRaccourciRapide[$i]->color }}">
                                <div class="racc-rapide">
                                    <div class="details">
                                        <div class="racc-icon">
                                            <i class="{{  $listRaccourciRapide[$i]->icone}}"></i>
                                        </div>
                                        <h4 title="{{ $listRaccourciRapide[$i]->$titre }}">{{ $listRaccourciRapide[$i]->$titre }}</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                    </div>
                    
                @endfor
					</div>
				</div>
            </div>
        </div>
        
</section>