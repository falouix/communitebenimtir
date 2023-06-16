<?php

namespace App\Http\Controllers;

use App\Actualite;
use Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;

class ActualiteFrontController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $listActualite = Actualite::where('status', '=', 'PUBLISHED')
            ->where('date_publication', '<=', Carbon\Carbon::now()->format('Y-m-d'))
            ->orderBy('date_publication', 'desc')
            ->paginate(6);
        return view('pages.actualites.index', [
            'listActualite' => $listActualite,
        ])->with('i', (request()->input('page', 1) - 1) * 4);
    }

    /**
     * Display the specified resource.
     *
     *
     * @param  string $slug
     */
    public function show($slug, Request $request)
    {
        //dd(Actualite::where('slug', '=', $slug)->firstOrFail());
        $search = request()->segment(3);
        if ($search == "search") {
            return $this->search($request);
        } else {
            // $act = Actualite::where('slug', '=', $slug)->firstOrFail();
            //dd(Shortcode::compile($act->description_ar));
            return view('pages.actualites.show', [
                'actualite' => Actualite::where('slug', '=', $slug)->firstOrFail(),
            ]) /*->withShortcodes()*/;
        }
    }

    // Moteur de recherche interne dans la page actaulites.index
    public function search(Request $request)
    {
        $libelle = $request->input('qpartial');
        $date_deb = $request->input('searchdate');
        if ($libelle) {
            if ($date_deb) {
                $listActualite = Actualite::where('date_publication', $date_deb)
                    ->Where('titre_fr', 'LIKE', "%{$libelle}%")
                    ->orWhere('titre_ar', 'LIKE', "%{$libelle}%")
                    ->orWhere('titre_en', 'LIKE', "%{$libelle}%")
                    ->orWhere(html_entity_decode('description_fr'), 'LIKE', "%{$libelle}%")
                    ->orWhere(html_entity_decode('description_ar'), 'LIKE', "%{$libelle}%")
                    ->orWhere(html_entity_decode('description_en'), 'LIKE', "%{$libelle}%")
                    ->where('status', 'PUBLISHED')
                    ->paginate(6);
            } else {
                $listActualite = Actualite::Where('description_fr', 'LIKE', "%{$libelle}%")
                    ->orWhere('description_ar', 'LIKE', "%{$libelle}%")
                    ->orWhere('description_en', 'LIKE', "%{$libelle}%")
                    ->where('status', 'PUBLISHED')
                    ->paginate(6);
            }
        } else {
            if ($date_deb) {
                $listActualite = Actualite::where('date_publication', $date_deb)
                    ->where('status', 'PUBLISHED')
                    ->paginate(6);
            } else {
                $listActualite = Actualite::where('status', '=', 'PUBLISHED')
                    ->where('date_publication', '<=', Carbon\Carbon::now()->format('Y-m-d'))
                    ->orderBy('date_publication', 'desc')
                    ->paginate(6);

            }

        }

        //dd($listActualite);
        return view('pages.actualites.index', [
            'listActualite' => $listActualite,
        ])->with('i', (request()->input('page', 1) - 1) * 4);
    }
    public function getAllActualites()
    {
        $actualitesList = Actualite::where('status', '=', 'PUBLISHED')
            ->orderBy('date_publication', 'desc')
            ->take(10)
            ->get();
        return $actualitesList;
    }
}