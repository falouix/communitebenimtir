<?php

namespace App\Http\Controllers;

use App\AppelsOffre;
use Illuminate\Http\Request;

class AppelsOffreFrontController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $listAppelsOffre = AppelsOffre::where('status', '=', 'PUBLISHED')
            ->orderBy('created_at', 'desc')
            ->paginate(6);
        return view('pages.appelsOffre.index', [
            'listAppelsOffre' => $listAppelsOffre,
        ])->with('i', (request()->input('page', 1) - 1) * 6);
    }

    /**
     * Display the specified resource.
     *
     * @param  string $slug
     * @return \Illuminate\Http\Response
     */
    public function show($slug, Request $request)
    {
        $search = request()->segment(3);
        if ($search == "search") {
            return $this->search($request);
        } else {
            return view('pages.appelsOffre.show', [
                'appeloffre' => AppelsOffre::where('slug', '=', $slug)->firstOrFail(),
            ]);
        }
    }

    // Moteur de recherche interne dans la page appelsOffres.index
    public function search(Request $request)
    {
        $libelle = $request->input('qpartial');
        $dat_deb = $request->input('searchdate');
        if ($libelle) {
            if ($dat_deb) {
                $listAppelsOffre = AppelsOffre::where('date_fin', '<=', $dat_deb)
                    ->Where('titre_fr', 'LIKE', "%{$libelle}%")
                    ->orWhere('titre_ar', 'LIKE', "%{$libelle}%")
                    ->orWhere('titre_en', 'LIKE', "%{$libelle}%")
                    ->orWhere(html_entity_decode('description_fr'), 'LIKE', "%{$libelle}%")
                    ->orWhere(html_entity_decode('description_ar'), 'LIKE', "%{$libelle}%")
                    ->orWhere(html_entity_decode('description_en'), 'LIKE', "%{$libelle}%")
                    ->where('status', 'PUBLISHED')
                    ->paginate(6);
            } else {
                $listAppelsOffre = AppelsOffre::Where('titre_fr', 'LIKE', "%{$libelle}%")
                    ->orWhere('titre_ar', 'LIKE', "%{$libelle}%")
                    ->orWhere('titre_en', 'LIKE', "%{$libelle}%")
                    ->orWhere(html_entity_decode('description_fr'), 'LIKE', "%{$libelle}%")
                    ->orWhere(html_entity_decode('description_ar'), 'LIKE', "%{$libelle}%")
                    ->orWhere(html_entity_decode('description_en'), 'LIKE', "%{$libelle}%")
                    ->where('status', 'PUBLISHED')
                    ->paginate(6);
            }
        } else {
            if ($dat_deb) {
                $listAppelsOffre = AppelsOffre::whereBetween('date_fin', '<=', $dat_deb)
                    ->where('status', 'PUBLISHED')
                    ->paginate(6);
            } else {
                $listAppelsOffre = AppelsOffre::where('status', '=', 'PUBLISHED')
                    ->orderBy('created_at', 'desc')
                    ->paginate(6);

            }
        }

        //dd($listActualite);
        return view('pages.appelsOffre.index', [
            'listAppelsOffre' => $listAppelsOffre,
        ])->with('i', (request()->input('page', 1) - 1) * 4);
    }
}
