<?php

namespace App\Http\Controllers;

use App\DemandeAcce;
use App\DemandeDoc;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Reclamation;
use App\ReponseDemandeAcce;
use App\ReponseReclamation;
use App\TypeDoc;
use Illuminate\Support\Facades\Auth;

class DemandeDocsController extends Controller
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
public function NvDemande()

    {
        if(Auth::guard('citoyen')->user()->TypeCompte =='CITOYEN'){
            return redirect('/citoyen/');
        }
        return view('citoyen.demandedocs.nvdemande');

    }
    public function index()

    {
        if(Auth::guard('citoyen')->user()->TypeCompte =='CITOYEN'){
            return redirect('/citoyen/');
        }
        $listDemande = DemandeDoc::where('citoyen_id', Auth::guard('citoyen')->user()->id)
                ->orderBy('date_demande', 'desc')
                ->get();
//dd($listDemande);
        return view('citoyen.demandedocs.index',[
                'listDemande' =>  $listDemande,
            ]);

    }
    
    public function creerDemande(Request $request)

    {
        if(Auth::guard('citoyen')->user()->TypeCompte =='CITOYEN'){
            return redirect('/citoyen/');
        }
       //validation rules.
    $rules = [
        'type_docs_id' => 'required',
    ];

    //custom validation error messages.
    $messages = [
        'type_docs_id.required' => 'يجب اختيار الوثيقة المطلوبة',
    ];
    $libelle_typeDoc = TypeDoc::where('id', $request['type_docs_id'])->get()->first()->libelle;
    //validate the request.
    $request->validate($rules,$messages);
    $nvdemande = DemandeDoc::create([
            'langue' => $request['langue'],
            'description' => $request['description'],
            'citoyen_id' => Auth::guard('citoyen')->user()->id,
            'etat' => 0,
            'type_docs_id' => $request['type_docs_id'],
            'type_envoi' => $request['type_envoi'],
            'date_demande' => date('Y-m-d H:i:s'),
            'libelle_type_doc' => $libelle_typeDoc,
        ]);
 $request->session()->flash('success', 'تم تسجيل المطلب بنجاح !');
    return redirect('/citoyen/demandedocs/redaction');

    }
    public function consulter($id)

    {
        if(Auth::guard('citoyen')->user()->TypeCompte =='CITOYEN'){
            return redirect('/citoyen/');
        }
        $demande = DemandeDoc::findOrFail($id);
        
        if($demande->citoyen_id!=Auth::guard('citoyen')->user()->id){
            return redirect('/citoyen/demandedocs');
        }
        
        return view('citoyen.demandedocs.consulter',[
                'demande' =>  $demande,
            ]);

    }
   
}
