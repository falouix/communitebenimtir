<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Mail\MailController;
use App\Reclamation;
use App\ReponseReclamation;
use Illuminate\Support\Facades\Auth;
use TCG\Voyager\Models;
use TCG\Voyager\Models\Setting;

class ReclamationController extends Controller
{
    /**

     * Create a new controller instance.

     *

     * @return void

     */
private $mailController;
    public function __construct(MailController $mailController)

    {

        $this->middleware('auth:citoyen');
        $this->mailController = $mailController;
    }

    /**

     * show dashboard.

     *

     * @return \Illuminate\Http\Response

     */
public function NvReclamation()

    {
        if(Auth::guard('citoyen')->user()->TypeCompte =='PERSONNEL'){
            return redirect('/citoyen/');
        }
        return view('citoyen.reclamation.nvreclamation');

    }
    public function index()

    {
        if(Auth::guard('citoyen')->user()->TypeCompte =='PERSONNEL'){
            return redirect('/citoyen/');
        }
        $listReclamation = Reclamation::where('IdCitoyen', Auth::guard('citoyen')->user()->id)
                ->orderBy('DateReclamation', 'asc')
                ->get();

        return view('citoyen.reclamation.index',[
                'listReclamation' =>  $listReclamation,
            ]);

    }
    public function consulter($id)

    {
        if(Auth::guard('citoyen')->user()->TypeCompte =='PERSONNEL'){
            return redirect('/citoyen/');
        }
        $reclamation = Reclamation::findOrFail($id);

        if($reclamation->IdCitoyen!=Auth::guard('citoyen')->user()->id){
            return redirect('/citoyen/reclamations');
        }
        $ReponsesReclamation = ReponseReclamation::where('Id_reclamation', $id)
                ->orderBy('DateReponse', 'asc')
                ->get();
        return view('citoyen.reclamation.consulter',[
                'reclamation' =>  $reclamation,
                'ReponsesReclamation' =>  $ReponsesReclamation,
            ]);

    }
    public function creerReclamation(Request $request)

    {

        if(Auth::guard('citoyen')->user()->TypeCompte =='PERSONNEL'){
            return redirect('/citoyen/');
        }
       //validation rules.
    $rules = [
        'Sujet' => 'required',
        'Textmessage' => 'required',
    ];

    //custom validation error messages.
    $messages = [
        'Sujet.required' => 'يجب كتابة موضوع الشكوى',
        'Textmessage.required' => 'يجب كتابة نص الشكوى',
    ];
do
{
    $coderec = "#". date('Y')."-". mt_rand(10000, 99999);
    $rec = Reclamation::where('CodeReclamation', $coderec)->get();
}

while($rec==null);

    //validate the request.
    $request->validate($rules,$messages);
    $nvreclamation = Reclamation::create([
            'CodeReclamation' => $coderec,
            'Sujet' => $request['Sujet'],
            'Textmessage' => $request['Textmessage'],
            'IdCitoyen' => Auth::guard('citoyen')->user()->id,
            'Etat' => 0,
            'Priorite' => $request['Priorite'],
            'DateReclamation' => date('Y-m-d H:i:s'),
        ]);
$PiecesJointes="";
$list_fichiers=array();
$string_fichiers="[";

   if ($files = $request->file('PiecesJointes')) {
       	// Define upload path
            $destinationPath = public_path('/uploads-citoyen/reclamations/'.$nvreclamation->id); // upload path

            foreach($files as $file) {
				// Upload Orginal Image
	           $piece =$file->getClientOriginalName();
	           $file->move($destinationPath, $piece);
                array_push($list_fichiers,"/uploads-citoyen/reclamations/". $nvreclamation->id ."/".$piece);
            }
            foreach ($list_fichiers as $fichier){
    $string_fichiers .= "\"". $fichier."\",";
 }

$string_fichiers=rtrim($string_fichiers, ',');
$string_fichiers .="]";
             $nvreclamation->PiecesJointes=$string_fichiers;
                $nvreclamation->save();

        }
        do
{
    $codedemande = "#". date('Y')."-". str_pad($nvreclamation->id, 4, '0', STR_PAD_LEFT);
    $demande = Reclamation::where('CodeReclamation', $codedemande)->get();
}
while($demande==null);

$nvreclamation->CodeReclamation=$codedemande;
$nvreclamation->save();
 $request->session()->flash('success', 'تم تسجيل الشكوى بنجاح !');
 $setting = Setting::where('key','espace-prive.email_reclamation')->firstOrFail();
$email_responsable=$setting->value;
$setting = Setting::where('key','espace-prive.nom_responsable_reclamation')->firstOrFail();
$nomresponsable=$setting->value;
$emailexpediteur=Auth::guard('citoyen')->user()->email;
$nomexpediteur=Auth::guard('citoyen')->user()->NomPrenom;
 //Envoyer un email
        $destinataire=$email_responsable;
        $contact_name = $request->name;
        $contact_mail = $request->email;
        $priorite="";
         switch($nvreclamation->Priorite)
            {
          case("haute") :
          $priorite="عالية";
          break;
          case("moyenne"):
             $priorite="متوسطة";
          break;
        case("faible"):
        $priorite="عادية";
        break;
            }
        $sujet = 'إدراج شكوى لدى بلدية القلعة-  : '.$nvreclamation->CodeReclamation;
        $message = '<b>* المرسل : </b>'.$nomexpediteur.' <b>صاحب ب.ت.و رقم :</b> '.Auth::guard('citoyen')->user()->CIN .'<br>';
        $message =$message. '<b>* الأولوية : </b>'.$priorite.'<br>';
        $message =$message. '<b>* نص الشكوى : </b><br>'.$nvreclamation->Textmessage;
        $this->mailController->envoyerMail($sujet,$message,$email_responsable,$nomresponsable,$emailexpediteur,$nomexpediteur);
    return redirect('/citoyen/reclamations/redaction');

    }
    public function repondre(Request $request)

    {

        if(Auth::guard('citoyen')->user()->TypeCompte =='PERSONNEL'){
            return redirect('/citoyen/');
        }
    $nvreponse = ReponseReclamation::create([
            'Id_reclamation' => $request['Id_reclamation'],
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
            $destinationPath = public_path('/uploads-citoyen/reponses-reclamations/'.$nvreponse->id); // upload path

            foreach($files as $file) {
				// Upload Orginal Image
	           $piece =$file->getClientOriginalName();
	           $file->move($destinationPath, $piece);
                array_push($list_fichiers,"/uploads-citoyen/reponses-reclamations/". $nvreponse->id ."/".$piece);
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