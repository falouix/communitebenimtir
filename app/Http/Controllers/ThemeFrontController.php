<?php

namespace App\Http\Controllers;

use App\AppelsOffre;
use App\Evenement;
use App\Theme;
use Illuminate\Http\Request;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;

class ThemeFrontController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $listThemes = Theme::where('status', '=', 'PUBLISHED')
            ->orderBy('created_at', 'asc')
            ->paginate(12);
            //dd($listThemes);
        return view('pages.themes.index', [
            'listThemes' => $listThemes,
        ])->with('i', (request()->input('page', 1) - 1) * 4);
    }

    public function show(Request $request)
    {
        $search = request()->segment(3);
        $listEvenements = Evenement::where('status', 'PUBLISHED')
            ->orderBy('created_at', 'desc')
            ->take(6)
            ->get();
        // *RccourciRapide == Docuements
        $listAppelsOffres = AppelsOffre::where('status', 'PUBLISHED')
            ->orderBy('created_at', 'asc')
            ->take(6)
            ->get();
        $libelle = $request->input('libelle');
        if ($libelle) {
            $listThemes = Theme::where('status', '=', 'PUBLISHED')
                ->where(html_entity_decode('texte_juridique_fr'), 'like', "%{$libelle}%")
                ->orWhere(html_entity_decode('texte_juridique_ar'), 'like', "%{$libelle}%")
                ->orWhere(html_entity_decode('texte_juridique_en'), 'like', "%{$libelle}%")
                ->orWhere('theme_fr', 'like', "%{$libelle}%")
                ->orWhere('theme_ar', 'like', "%{$libelle}%")
                ->orWhere('theme_en', 'like', "%{$libelle}%")
                ->paginate(12);
        } else {
            $listThemes = Theme::where('status', '=', 'PUBLISHED')
                ->orderBy('created_at', 'desc')
                ->paginate(12);
        }
        return view('pages.themes.index', [
            'listThemes' => $listThemes,
            'listEvenements' => $listEvenements,
            'listAppelsOffres' => $listAppelsOffres,
        ])->with('i', (request()->input('page', 1) - 1) * 4);
    }
}