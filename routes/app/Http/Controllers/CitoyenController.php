<?php

namespace App\Http\Controllers;

use App\DemandeAcce;
use App\DemandeDoc;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Reclamation;
use Illuminate\Support\Facades\Auth;
class CitoyenController extends Controller
{
    /**

     * Create a new controller instance.

     *

     * @return void

     */

    public function __construct()

    {

        $this->middleware('auth:citoyen');

    }

    /**

     * show dashboard.

     *

     * @return \Illuminate\Http\Response

     */

    public function index()

    {
        $nbReclamationOuvert=Reclamation::where('Etat', 0)->where('IdCitoyen',Auth::guard('citoyen')->user()->id)->count();
        $nbReclamationFerme=Reclamation::where('Etat', 1)->where('IdCitoyen',Auth::guard('citoyen')->user()->id)->count();

        $nbDemandeAccesEncours=DemandeAcce::where('EtatDemande', 0)->where('IdDemandeur',Auth::guard('citoyen')->user()->id)->count();
        $nbDemandeAccesAccepte=DemandeAcce::where('EtatDemande', 1)->where('IdDemandeur',Auth::guard('citoyen')->user()->id)->count();
        $nbDemandeAccesRefuse=DemandeAcce::where('EtatDemande', 2)->where('IdDemandeur',Auth::guard('citoyen')->user()->id)->count();

        $nbDemandeDocEncours=DemandeDoc::where('etat', 0)->where('citoyen_id',Auth::guard('citoyen')->user()->id)->count();
        $nbDemandeDocAccepte=DemandeDoc::where('etat', 1)->where('citoyen_id',Auth::guard('citoyen')->user()->id)->count();
        $nbDemandeDocRefuse=DemandeDoc::where('etat', 2)->where('citoyen_id',Auth::guard('citoyen')->user()->id)->count();

        return view('citoyen.home',[
                'nbReclamationOuvert' =>  $nbReclamationOuvert,
                'nbReclamationFerme' =>  $nbReclamationFerme,
                'nbDemandeAccesEncours' =>  $nbDemandeAccesEncours,
                'nbDemandeAccesAccepte' =>  $nbDemandeAccesAccepte,
                'nbDemandeAccesRefuse' =>  $nbDemandeAccesRefuse,
                'nbDemandeDocEncours' =>  $nbDemandeDocEncours,
                'nbDemandeDocAccepte' =>  $nbDemandeDocAccepte,
                'nbDemandeDocRefuse' =>  $nbDemandeDocRefuse,
            ]);

    }
}
