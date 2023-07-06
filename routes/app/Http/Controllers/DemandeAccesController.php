<?php

namespace App\Http\Controllers;

use App\DemandeAcce;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Reclamation;
use App\ReponseDemandeAcce;
use App\ReponseReclamation;
use Illuminate\Support\Facades\Auth;

class DemandeAccesController extends Controller
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
        if(Auth::guard('citoyen')->user()->TypeCompte =='PERSONNEL'){
            return redirect('/citoyen/');
        }
        return view('citoyen.demandeacces.nvdemande');

    }
    public function index()

    {
        if(Auth::guard('citoyen')->user()->TypeCompte =='PERSONNEL'){
            return redirect('/citoyen/');
        }
        $listDemande = DemandeAcce::where('IdDemandeur', Auth::guard('citoyen')->user()->id)
                ->orderBy('DateDemande', 'asc')
                ->get();

        return view('citoyen.demandeacces.index',[
                'listDemande' =>  $listDemande,
            ]);

    }
    public function consulter($id)

    {
        if(Auth::guard('citoyen')->user()->TypeCompte =='PERSONNEL'){
            return redirect('/citoyen/');
        }
        $demande = DemandeAcce::findOrFail($id);
        
        if($demande->IdDemandeur!=Auth::guard('citoyen')->user()->id){
            return redirect('/citoyen/demandeacces');
        }
        $ReponsesDemandeAcce = ReponseDemandeAcce::where('Id_demandeacces', $id)
                ->orderBy('DateReponse', 'asc')
                ->get();
        return view('citoyen.demandeacces.consulter',[
                'demande' =>  $demande,
                'ReponsesDemandeAcce' =>  $ReponsesDemandeAcce,
            ]);

    }
    public function creerDemande(Request $request)

    {
        if(Auth::guard('citoyen')->user()->TypeCompte =='PERSONNEL'){
            return redirect('/citoyen/');
        }
       //validation rules.
    $rules = [
        'NomDocumentDemande' => 'required',
        'ServiceConcerne' => 'required',
    ];

    //custom validation error messages.
    $messages = [
        'NomDocumentDemande.required' => 'يجب كتابة اسم الوثيقة المطلوبة',
        'ServiceConcerne.required' => 'يجب كتابة اسم الهيكل المعني',
    ];
do
{
    $codedemande = "#". date('Y')."-". mt_rand(10000, 99999);
    $demande = DemandeAcce::where('codeDemande', $codedemande)->get();
}
while($demande==null);
    //validate the request.
    $request->validate($rules,$messages);
    $nvdemande = DemandeAcce::create([
            'codeDemande' => $codedemande,
            'ServiceConcerne' => $request['ServiceConcerne'],
            'Info' => $request['Info'],
            'IdDemandeur' => Auth::guard('citoyen')->user()->id,
            'Etat' => 0,
            'ReferenceDocs' => $request['ReferenceDocs'],
            'FormeAcce' => $request['FormeAcce'],
            'DateDemande' => date('Y-m-d H:i:s'),
            'EtatDemande' => 0,
            'NomDocumentDemande' => $request['NomDocumentDemande'],
        ]);
$PiecesJointes="";
$list_fichiers=array();
$string_fichiers="[";

   if ($files = $request->file('PiecesJointes')) {
       	// Define upload path
            $destinationPath = public_path('/uploads-citoyen/demande-access/'.$nvdemande->id); // upload path
           
            foreach($files as $file) {
				// Upload Orginal Image           
	           $piece =$file->getClientOriginalName();
	           $file->move($destinationPath, $piece);
                array_push($list_fichiers,"/uploads-citoyen/demande-access/". $nvdemande->id ."/".$piece);
            }
            foreach ($list_fichiers as $fichier){
    $string_fichiers .= "\"". $fichier."\",";
 }
 
$string_fichiers=rtrim($string_fichiers, ',');
$string_fichiers .="]";
             $nvdemande->PiecesJointes=$string_fichiers;
                $nvdemande->save();

        }
        do
{
    $codedemande = "#". date('Y')."-". str_pad($nvdemande->id, 4, '0', STR_PAD_LEFT);
    $demande = DemandeAcce::where('codeDemande', $codedemande)->get();
}
while($demande==null);
$nvdemande->codeDemande=$codedemande;
$nvdemande->save();
 $request->session()->flash('success', 'تم تسجيل المطلب بنجاح !');
    return redirect('/citoyen/demandeacces/redaction');

    }
    public function repondre(Request $request)

    {
      if(Auth::guard('citoyen')->user()->TypeCompte =='PERSONNEL'){
            return redirect('/citoyen/');
        }
    $nvreponse = ReponseDemandeAcce::create([
            'Id_demandeacces' => $request['Id_demandeacces'],
            'TextReponse' => $request['TextReponse'],
            'Expediteur' => Auth::guard('citoyen')->user()->NomPrenom,
            'Lu' => 0,
            'DateReponse' => date('Y-m-d H:i:s'),
        ]);
$PiecesJointes="";
$list_fichiers=array();
$string_fichiers="[";

   if ($files = $request->file('PiecesJointes')) {
       	// Define upload path
            $destinationPath = public_path('/uploads-citoyen/reponses-demande-access/'.$nvreponse->id); // upload path
           
            foreach($files as $file) {
				// Upload Orginal Image           
	           $piece =$file->getClientOriginalName();
	           $file->move($destinationPath, $piece);
                array_push($list_fichiers,"/uploads-citoyen/reponses-demande-access/". $nvreponse->id ."/".$piece);
            }
            foreach ($list_fichiers as $fichier){
    $string_fichiers .= "\"". $fichier."\",";
 }
 
$string_fichiers=rtrim($string_fichiers, ',');
$string_fichiers .="]";
             $nvreponse->PiecesJointes=$string_fichiers;
                $nvreponse->save();

        }
 
    return redirect()->back();

    }
}
