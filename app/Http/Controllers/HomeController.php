<?php

namespace App\Http\Controllers;

use Mcamara\LaravelLocalization\Facades\LaravelLocalization;
use Illuminate\Http\Request;
use App\Actualite;
use App\Evenement;
use App\AppelsOffre;
use App\Slider;
use App\Gallery;
use App\Lien;
use App\PubRecherch;
use App\SitesUtile;
use App\AccueilComposant;
use Carbon;
class HomeController extends Controller
{
    public function __construct()
    {
      //  $this->middleware('setlocale');
    }
    public function index(){
        $homeCompenents = AccueilComposant::select('*')->where('position','position-events')->orWhere('position', '=', 'position-actualites');
        $listActualite = Actualite::where('status', '=', 'PUBLISHED')
            ->where('date_publication','<=', Carbon\Carbon::now()->format('Y-m-d'))
            ->orderBy('date_publication', 'desc')
            ->take(10)
            ->get();
        $listEvents = Evenement::where('status', '=', 'PUBLISHED')
            ->orderBy('date_debut', 'desc')
            ->take(10)
            ->get();

         $locale = LaravelLocalization::getCurrentLocale();
         if ($locale == 'ar') {
          $slider = Slider::select('*')->Where('status', '=', 'PUBLISHED')->Where('langue','AR')->orWhere('langue','TOUS')->get();
         }else{
          $slider = Slider::select('*')->Where('status', '=', 'PUBLISHED')->Where('langue','FR')->orWhere('langue','TOUS')->get();
         }
       //dd($sliderFr);
        return view('home',[
            'homeCompenents' => $homeCompenents,
            'listActualite' => $listActualite,
            'listEvents' => $listEvents,
            'slider' => $slider,
        ]);
    }
    public function getAllLiensHeader(){
        $actualitesList = Lien :: where('afficher_dans', '=', 'top_header')
        ->orderBy('ordre')
        ->get();
        return $actualitesList;
    }
}
