<?php

namespace App\Http\Controllers;

use App\DemandeAcce;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\MessagesPrivate;
use App\Reclamation;
use App\ReponseDemandeAcce;
use App\ReponseMessagesPrivate;
use App\ReponseReclamation;
use Illuminate\Support\Facades\Auth;

class MessageController extends Controller
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
public function NvMsg()

    {
        if(Auth::guard('citoyen')->user()->TypeCompte =='CITOYEN'){
            return redirect('/citoyen/');
        }
        return view('citoyen.messages.NouveauMsg');

    }
    public function index()

    {
        if(Auth::guard('citoyen')->user()->TypeCompte =='CITOYEN'){
            return redirect('/citoyen/');
        }
        $listMsg = MessagesPrivate::where('id_citoyen', Auth::guard('citoyen')->user()->id)
                ->orderBy('DateEnvoie', 'desc')
                ->get();

        return view('citoyen.messages.index',[
                'listMsg' =>  $listMsg,
            ]);

    }
    public function consulter($id)

    {
        if(Auth::guard('citoyen')->user()->TypeCompte =='CITOYEN'){
            return redirect('/citoyen/');
        }
        $msg = MessagesPrivate::findOrFail($id);
        
        if($msg->id_citoyen!=Auth::guard('citoyen')->user()->id){
            return redirect('/citoyen/messages');
        }
        $ReponsesMsg = ReponseMessagesPrivate::where('id_message_prive', $id)
                ->orderBy('DateReponse', 'asc')
                ->get();
        return view('citoyen.messages.consulter',[
                'msg' =>  $msg,
                'ReponsesMsg' =>  $ReponsesMsg,
            ]);

    }
    public function creerMsg(Request $request)

    {
        if(Auth::guard('citoyen')->user()->TypeCompte =='CITOYEN'){
            return redirect('/citoyen/');
        }
       //validation rules.
    $rules = [
        'Sujet' => 'required',
        'Textmessage' => 'required',
    ];

    //custom validation error messages.
    $messages = [
        'Sujet.required' => 'يجب كتابة موضوع الرسالة',
        'Textmessage.required' => 'يجب كتابة نص الرسالة',
    ];
    //validate the request.
    $request->validate($rules,$messages);
    $nvmsg = MessagesPrivate::create([
            'Textmessage' => $request['Textmessage'],
            'Sujet' => $request['Sujet'],
            'id_citoyen' => Auth::guard('citoyen')->user()->id,
            'Lu' => 0,
            'Expediteur' => Auth::guard('citoyen')->user()->NomPrenom,
            'DateEnvoie' => date('Y-m-d H:i:s'),
            'NomDocumentDemande' => $request['NomDocumentDemande'],
        ]);
$PiecesJointes="";
$list_fichiers=array();
$string_fichiers="[";

   if ($files = $request->file('PiecesJointes')) {
       	// Define upload path
            $destinationPath = public_path('/uploads-citoyen/messages/'.$nvmsg->id); // upload path
           
            foreach($files as $file) {
				// Upload Orginal Image           
	           $piece =$file->getClientOriginalName();
	           $file->move($destinationPath, $piece);
                array_push($list_fichiers,"/uploads-citoyen/messages/". $nvmsg->id ."/".$piece);
            }
            foreach ($list_fichiers as $fichier){
    $string_fichiers .= "\"". $fichier."\",";
 }
 
$string_fichiers=rtrim($string_fichiers, ',');
$string_fichiers .="]";
             $nvmsg->PiecesJointes=$string_fichiers;
                $nvmsg->save();

        }
 $request->session()->flash('success', 'تم تسجيل الرسالة بنجاح !');
    return redirect('/citoyen/messages/redaction');

    }
    public function repondre(Request $request)

    {
        if(Auth::guard('citoyen')->user()->TypeCompte =='CITOYEN'){
            return redirect('/citoyen/');
        }
      
    $nvreponse = ReponseMessagesPrivate::create([
            'id_message_prive' => $request['id_message_prive'],
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
            $destinationPath = public_path('/uploads-citoyen/reponses-messages/'.$nvreponse->id); // upload path
           
            foreach($files as $file) {
				// Upload Orginal Image           
	           $piece =$file->getClientOriginalName();
	           $file->move($destinationPath, $piece);
                array_push($list_fichiers,"/uploads-citoyen/reponses-messages/". $nvreponse->id ."/".$piece);
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
