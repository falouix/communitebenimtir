<?php

namespace App\Http\Controllers;

use App\Denonciation;
use App\PubRecherch;
use Illuminate\Http\Request;
use Carbon;
class DenonciationController extends Controller
{
    public function index()
    {
        
        return view('pages.denonciations.index');
    }
    public function indexPersoPhysique()
    {
        
        return view('pages.denonciations.denonciation-PersoPhysique');
    }
    public function indexPersoMorale()
    {
        
        return view('pages.denonciations.denonciation-PersoMorale');
    }
    public function creerDenonciationPersoPhysique(Request $request)
    {
        //validation rules.
    $rules = [
        'Nom' => 'required',
        'Prenom' => 'required',
        'CIN' => 'required',
        'adresse' => 'required',
        'tel' => 'required',
        'description' => 'required',
    ];

    //custom validation error messages.
    $messages = [
        'Nom.required' => 'يجب كتابة الاسم',
        'Prenom.required' => 'يجب كتابة اللقب',
        'CIN.required' => 'يجب كتابة رقم بطاقة التعريف الوطنية',
        'adresse.required' => 'يجب كتابة العنوان',
        'tel.required' => 'يجب كتابة رقم الهاتف',
        'description.required' => 'يجب كتابة الموضوع',
    ];
        //validate the request.
    $request->validate($rules,$messages);
    $nvdenonciation = Denonciation::create([
            'type_personne' => 1,
            'adresse' => $request['adresse'],
            'tel' => $request['tel'],
            'email' => $request['email'],
            'identifie' => $request['identifie'],
            'structure_signale' => $request['structure_signale'],
            'secteur' => $request['secteur'],
            'description' => $request['description'],
            'Nom' => $request['Nom'],
            'Prenom' => $request['Prenom'],
            'CIN' => $request['CIN'],
            'TrancheAge' => $request['TrancheAge'],
            'Sexe' => $request['Sexe'],
            'Profession' => $request['Profession'],
            'Gouvernorat' => $request['Gouvernorat'],
            'personne_signale' => $request['personne_signale'],
            'creerPar' => 1,
        ]);
        $PiecesJointes="";
$list_fichiers=array();
$string_fichiers="[";

   if ($files = $request->file('PiecesJointes')) {
       	// Define upload path
            $destinationPath = public_path('/storage/denonciations/'.$nvdenonciation->id); // upload path

            foreach($files as $file) {
				// Upload Orginal Image
	           $piece =$file->getClientOriginalName();
	           $file->move($destinationPath, $piece);
                array_push($list_fichiers,"/storage/denonciations/". $nvdenonciation->id ."/".$piece);
            }
            foreach ($list_fichiers as $fichier){
    $string_fichiers .= "\"". $fichier."\",";
 }

$string_fichiers=rtrim($string_fichiers, ',');
$string_fichiers .="]";
             $nvdenonciation->PiecesJointes=$string_fichiers;
                $nvdenonciation->save();

        }
        return redirect('/denonciation-PersoPhysique');
    }
    public function creerDenonciationPersoMorale(Request $request)
    {
        //validation rules.
    $rules = [
        'raison_sociale' => 'required',
        'adresse' => 'required',
        'description' => 'required',
    ];

    //custom validation error messages.
    $messages = [
        'raison_sociale.required' => 'يجب كتابة الاسم',
        'adresse.required' => 'يجب كتابة العنوان',
        'description.required' => 'يجب كتابة الموضوع',
    ];
        //validate the request.
    $request->validate($rules,$messages);
    $nvdenonciation = Denonciation::create([
            'type_personne' => 2,
            'adresse' => $request['adresse'],
            'tel' => $request['tel'],
            'email' => $request['email'],
            'identifie' => $request['identifie'],
            'structure_signale' => $request['structure_signale'],
            'secteur' => $request['secteur'],
            'description' => $request['description'],
            'raison_sociale' => $request['raison_sociale'],
            'creerPar' => 1,
        ]);
        $PiecesJointes="";
$list_fichiers=array();
$string_fichiers="[";

   if ($files = $request->file('PiecesJointes')) {
       	// Define upload path
            $destinationPath = public_path('/storage/denonciations/'.$nvdenonciation->id); // upload path

            foreach($files as $file) {
				// Upload Orginal Image
	           $piece =$file->getClientOriginalName();
	           $file->move($destinationPath, $piece);
                array_push($list_fichiers,"/storage/denonciations/". $nvdenonciation->id ."/".$piece);
            }
            foreach ($list_fichiers as $fichier){
    $string_fichiers .= "\"". $fichier."\",";
 }

$string_fichiers=rtrim($string_fichiers, ',');
$string_fichiers .="]";
             $nvdenonciation->PiecesJointes=$string_fichiers;
                $nvdenonciation->save();

        }
        return redirect('/denonciation-PersoMorale');
    }
}