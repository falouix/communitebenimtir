<?php

namespace App\Http\Controllers;

use App\Evenement;
use Carbon;
use Illuminate\Http\Request;

class EvenementFrontController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function index()
    {
        $listEvents = Evenement::where('status', '=', 'PUBLISHED')
            ->where('date_debut', '<=', Carbon\Carbon::now()->format('Y-m-d'))
            ->orderBy('date_debut', 'desc')
            ->paginate(6);
        return view('pages.evenements.index', [
            'listEvents' => $listEvents,
        ])->with('i', (request()->input('page', 1) - 1) * 6);
    }

    /**
     * Display the specified resource.
     *
     *
     * @param  string $slug
     */
    public function show($slug, Request $request)
    {
        // dd(Evenement::where('slug', '=', $slug)->firstOrFail());
        $search = request()->segment(3);
        if ($search == "search") {
            return $this->search($request);
        } else {
            return view('pages.evenements.show', [
                'event' => Evenement::where('slug', '=', $slug)->firstOrFail(),
            ]);
        }
    }
    // Moteur de recherche interne dans la page evenements.index
    public function search(Request $request)
    {

        $libelle = $request->input('qpartial');
        $dat_deb = $request->input('searchdate');

        if ($libelle) {
            if ($dat_deb) {
                $listEvents = Evenement::where('date_debut', $dat_deb)
                    ->Where('titre_fr', 'LIKE', "%{$libelle}%")
                    ->orWhere('titre_ar', 'LIKE', "%{$libelle}%")
                    ->orWhere('titre_en', 'LIKE', "%{$libelle}%")
                    ->orWhere(html_entity_decode('description_fr'), 'LIKE', "%{$libelle}%")
                    ->orWhere(html_entity_decode('description_ar'), 'LIKE', "%{$libelle}%")
                    ->orWhere(html_entity_decode('description_en'), 'LIKE', "%{$libelle}%")
                    ->orWhere('lieu_fr', 'LIKE', "%{$libelle}%")
                    ->orWhere('lieu_ar', 'LIKE', "%{$libelle}%")
                    ->orWhere('lieu_en', 'LIKE', "%{$libelle}%")
                    ->where('status', 'PUBLISHED')
                    ->paginate(6);
            } else {
                $listEvents = Evenement::Where('titre_fr', 'LIKE', "%{$libelle}%")
                    ->orWhere('titre_ar', 'LIKE', "%{$libelle}%")
                    ->orWhere('titre_en', 'LIKE', "%{$libelle}%")
                    ->orWhere(html_entity_decode('description_fr'), 'LIKE', "%{$libelle}%")
                    ->orWhere(html_entity_decode('description_ar'), 'LIKE', "%{$libelle}%")
                    ->orWhere(html_entity_decode('description_en'), 'LIKE', "%{$libelle}%")
                    ->orWhere('lieu_fr', 'LIKE', "%{$libelle}%")
                    ->orWhere('lieu_ar', 'LIKE', "%{$libelle}%")
                    ->orWhere('lieu_en', 'LIKE', "%{$libelle}%")
                    ->where('status', 'PUBLISHED')
                    ->paginate(6);
            }
        } else {
            if ($dat_deb) {
                $listEvents = Evenement::where('date_debut', $dat_deb)
                    ->where('status', 'PUBLISHED')
                    ->paginate(6);
            } else {
                $listEvents = Evenement::where('status', '=', 'PUBLISHED')
                    ->where('date_debut', '<=', Carbon\Carbon::now()->format('Y-m-d'))
                    ->orderBy('date_debut', 'desc')
                    ->paginate(6);
            }

        }

        //dd($listActualite);
        return view('pages.evenements.index', [
            'listEvents' => $listEvents,
        ])->with('i', (request()->input('page', 1) - 1) * 4);
    }
    public function getAllEvent()
    {

        $listEvents = Evenement::where('status', '=', 'PUBLISHED')
            ->orderBy('date_debut', 'desc')
            ->take(10)
            ->get();
        return $listEvents;

    }
}