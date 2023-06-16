<?php

namespace App\Http\Controllers;

use App\AppelsOffre;
use App\Evenement;
use App\Type;
use Illuminate\Http\Request;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;

class TypeFrontController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $listTypes = Type::where('status', '=', 'PUBLISHED')
            ->orderBy('Annee', 'desc')
            ->paginate(12);
        return view('pages.types.index', [
            'listTypes' => $listTypes
        ])->with('i', (request()->input('page', 1) - 1) * 4);
    }
    public function show(Request $request)
    {
        $lang = LaravelLocalization::getCurrentLocale();
        $type = 'type_loi_' . $lang;
        $libelle = $request->input('libelle');
        $typeS = $request->input($type);
        if ($libelle) {
            $listTypes = Type::where('status', '=', 'PUBLISHED')
                ->orWhere('type_fr', 'LIKE', "%{$libelle}%")
                ->orWhere('type_ar', 'LIKE', "%{$libelle}%")
                ->orWhere('type_en', 'LIKE', "%{$libelle}%")
                ->orWhere(html_entity_decode('texte_juridique_fr'), 'LIKE', "%{$libelle}%")
                ->orWhere(html_entity_decode('texte_juridique_ar'), 'LIKE', "%{$libelle}%")
                ->orWhere(html_entity_decode('texte_juridique_en'), 'LIKE', "%{$libelle}%")
                ->orWhere('type_loi_ar', 'LIKE', "%{$typeS}%")
                ->orWhere('type_loi_fr', 'LIKE', "%{$typeS}%")
                ->orWhere('type_loi_en', 'LIKE', "%{$typeS}%")
                ->orderBy('Annee', 'desc')
                ->paginate(12);
        } else {
            //dd($typeS);
            $listTypes = Type::where('status', '=', 'PUBLISHED')
                ->Where('type_loi_ar', 'LIKE', "%{$typeS}%")
                ->orWhere('type_loi_fr', 'LIKE', "%{$typeS}%")
                ->orWhere('type_loi_en', 'LIKE', "%{$typeS}%")
                ->orderBy('Annee', 'desc')
                ->paginate(12);
        }
        return view('pages.types.index', [
            'listTypes' => $listTypes
        ])->with('i', (request()->input('page', 1) - 1) * 4);
    }
}