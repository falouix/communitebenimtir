<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;

use App\ConseilMunicipale;
use App\RaccourciRapide;
use App\Actualite;


class ConseilMunicipalFrontController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $year = date('Y', strtotime(today()));
        $data = ConseilMunicipale::select('*')->where('status', 'PUBLISHED')
            ->where('Annee', '<=', $year)
            ->where('Annee', '>=', $year - 2)
            ->orderBy('Annee', 'desc')
            ->orderBy('date_publication', 'desc')
            ->get();

       // dd($data->groupBy(['Annee', 'TypeConseil']));
        $listActualite = Actualite::where('status', 'PUBLISHED')
            ->orderBy('created_at', 'desc')
            ->take(5)
            ->get();
        // *RccourciRapide == Docuements
        $listRaccourciRapide = RaccourciRapide::orderBy('created_at', 'asc')
            ->take(6)
            ->get();

        return view('pages.conseil.index', [
            'data' => $data->groupBy(['Annee', 'TypeConseil']),
            'listActualite'=>$listActualite,
            'listRaccourciRapide' => $listRaccourciRapide,
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  string  $type
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request)
    {
        $search = request()->segment(3);
        // dd($search);
        $type = $request->input('type');
        $AnneeDebut = $request->input('AnneeDebut');
        $AnneeFin = $request->input('AnneeFin');

        // dd($AnneeFin);
        if ($search == "search") {
            if ($type == "TOUS") {
                $data = ConseilMunicipale::select('*')->where('status', 'PUBLISHED')
                    ->orderBy('Annee', 'desc')
                    ->orderBy('date_publication', 'desc')
                    ->orderBy('TypeConseil', 'desc')
                    ->where('Annee', '>=', $AnneeDebut)
                    ->where('Annee', '<=', $AnneeFin)
                    ->get();
                //dd($data);
            } else {
                $data = ConseilMunicipale::where('TypeConseil', $type)
                    ->where('status', 'PUBLISHED')
                    ->orderBy('Annee', 'desc')
                    ->orderBy('date_publication', 'desc')
                    ->orderBy('TypeConseil', 'desc')
                    ->where('Annee', '>=', $AnneeDebut)
                    ->where('Annee', '<=', $AnneeFin)
                    ->get();
            }
        } else {
            $year = date('Y', strtotime(today()));
            $data = ConseilMunicipale::where('TypeConseil', $search)
                ->where('status', 'PUBLISHED')
                ->orderBy('Annee', 'desc')
                ->orderBy('date_publication', 'desc')
                ->where('Annee', '<=', $year - 0)
                ->where('Annee', '>=', $year - 2)
                ->get();
        }

        //dd($listSerivces);
        $listActualite = Actualite::where('status', 'PUBLISHED')
            ->orderBy('created_at', 'desc')
            ->take(3)
            ->get();
        // *RccourciRapide == Docuements
        $listRaccourciRapide = RaccourciRapide::orderBy('created_at', 'asc')
            ->take(6)
            ->get();
        return view('pages.conseil.index', [
            'data' => $data->groupBy(['Annee', 'TypeConseil']),
            'listActualite'=>$listActualite,
            'listRaccourciRapide' => $listRaccourciRapide,
        ]);
    }

}
