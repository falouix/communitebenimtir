<?php

namespace App\Http\Controllers;

use App\Actualite;
use App\Finance;
use App\RaccourciRapide;
use Illuminate\Http\Request;

class FinanceFrontController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $year = date('Y', strtotime(today()));
        $data = Finance::select('*')->where('status', 'PUBLISHED')
            ->where('Annee', '<=', $year)
            ->where('Annee', '>=', $year - 2)
            ->orderBy('Annee', 'desc')
            ->orderBy('TypeFinance', 'desc')

            ->get();
        //dd($listSerivces);
        $listActualite = Actualite::where('status', 'PUBLISHED')
            ->orderBy('created_at', 'desc')
            ->take(5)
            ->get();
        // *RccourciRapide == Docuements
        $listRaccourciRapide = RaccourciRapide::orderBy('created_at', 'asc')
            ->take(6)
            ->get();

        return view('pages.finance.index', [
            'data' => $data->groupBy(['Annee', 'TypeFinance']),
            'listActualite' => $listActualite,
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
                $data = Finance::selet('*')->where('status', 'PUBLISHED')
                    ->orderBy('Annee', 'desc')
                    ->orderBy('TypeFinance', 'desc')
                    ->where('Annee', '>=', $AnneeDebut)
                    ->where('Annee', '<=', $AnneeFin)
                    ->get();
                //dd($data);
            } else {
                $data = Finance::where('TypeFinance', $type)
                    ->where('status', 'PUBLISHED')
                    ->orderBy('Annee', 'desc')
                    ->orderBy('TypeFinance', 'desc')
                    ->where('Annee', '>=', $AnneeDebut)
                    ->where('Annee', '<=', $AnneeFin)
                    ->get();
            }
        } else {
            $year = date('Y', strtotime(today()));
            $data = Finance::where('TypeFinance', $search)
                ->where('status', 'PUBLISHED')
                ->orderBy('Annee', 'desc')
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
        return view('pages.finance.index', [
            'data' => $data->groupBy(['Annee', 'TypeFinance']),
            'listActualite' => $listActualite,
            'listRaccourciRapide' => $listRaccourciRapide,
        ]);
    }
}
