<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;

use App\BudgetPartcipatif;
use App\RaccourciRapide;
use App\Actualite;

class BudgetParticipatifFrontController extends Controller
{
     /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $year = date('Y', strtotime(today()));
        $data = BudgetPartcipatif::where('status', 'PUBLISHED')
            ->orderBy('Annee', 'desc')
            ->where('Annee', '<=', $year - 0)
            ->where('Annee', '>=', $year - 2)
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

        return view('pages.budget_participatif.index', [
            'data' => $data->groupBy('Annee'),
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
        //dd($request);
        $search = request()->segment(3);
        $type = $request->input('type');
        $AnneeDebut = $request->input('AnneeDebut');
        $AnneeFin = $request->input('AnneeFin');

        // dd($AnneeFin);
        if ($search == "search") {
            if ($type == "TOUS") {
                $data = BudgetPartcipatif::where('status', 'PUBLISHED')
                    ->orderBy('Annee', 'desc')
                    ->orderBy('TypeBudget', 'desc')
                    ->where('Annee', '>=', $AnneeDebut)
                    ->where('Annee', '<=', $AnneeFin)
                    ->get();
                //dd($data);
            } else {
                $data = BudgetPartcipatif::where('TypeBudget', $type)
                    ->where('status', 'PUBLISHED')
                    ->orderBy('Annee', 'desc')
                    ->orderBy('TypeBudget', 'desc')
                    ->where('Annee', '>=', $AnneeDebut)
                    ->where('Annee', '<=', $AnneeFin)
                    ->get();
            }
        } else {
            $year = date('Y', strtotime(today()));
            $data = BudgetPartcipatif::where('TypeBudget', $search)
                ->where('status', 'PUBLISHED')
                ->orderBy('Annee', 'desc')
                ->where('Annee', '<=', $year - 0)
                ->where('Annee', '>=', $year - 2)
                ->get();
        }
        $listActualite = Actualite::where('status', 'PUBLISHED')
            ->orderBy('created_at', 'desc')
            ->take(3)
            ->get();
        // *RccourciRapide == Docuements
        $listRaccourciRapide = RaccourciRapide::orderBy('created_at', 'asc')
            ->take(6)
            ->get();
        return view('pages.budget_participatif.index', [
            'data' => $data->groupBy('Annee'),
            'listActualite'=>$listActualite,
            'listRaccourciRapide' => $listRaccourciRapide,
        ]);
    }
}
