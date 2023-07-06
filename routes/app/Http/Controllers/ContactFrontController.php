<?php

namespace App\Http\Controllers;

use App\Contact;
use App\AnnuaireEtablissement;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use App\Mail\MailController;
use TCG\Voyager\Models\Setting;
class ContactFrontController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $listservices = Contact::where('status', 'PUBLISHED')
            ->where('email','<>',null)
            ->orderBy('created_at', 'desc')
            ->get();
            //dd($listservices);
        return view('pages.contact.index', [
            'listservices' => $listservices,
            'IsRequestDataAcess'=>'false'
        ]);

    }

    /**
     * Display the specified resource.
     *
     *
     * @param  string $slug
     */
    public function show($slug, Request $request)
    {
        //dd(AnnuaireEtablissement::where('slug', '=', $request->query("slug"))->first());
        $Segment = request()->segment(3);
        if ($Segment == "DemandeAcces") {
           // return $this->search($request);
           // return the page contact with the DataAccess Inputs
           $listservices = Contact::where('status', 'PUBLISHED')
           ->orderBy('created_at', 'desc')
           ->paginate(6);
           return view('pages.contact.index', [
            'listservices' => $listservices,
            'IsRequestDataAcess'=>'true',
            'etablissement'=>AnnuaireEtablissement::where('slug', '=', $request->query("slug"))->first()
        ]);
        }
        elseif($Segment == "contactAnnuaire"){
            return view('pages.contact.index', [
             //'listservices' => $listservices,
             'IsRequestDataAcess'=>'contactAnnuaire',
             'etablissement'=>AnnuaireEtablissement::where('slug', '=', $request->query("slug"))->first()
         ]);
        }
         else {
            $listAnnuaireEtablissement = AnnuaireEtablissement::where('status', '=', 'PUBLISHED')
            ->orderBy('created_at', 'desc')
            ->paginate(6);
        return view('pages.annuaire-etablissements.index', [
            'listAnnuaireEtablissement' => $listAnnuaireEtablissement,
        ])->with('i', (request()->input('page', 1) - 1) * 4);
        }
    }
    private $mailController;
    public function __construct(MailController $mailController)
    {
        $this->mailController = $mailController;
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function sendEmail(Request $request)
    {
            $request->session()->flash('success', 'تم ارسال رسالتك بنجاح !');
            $setting = Setting::where('key','site.site_email')->firstOrFail();
              $email_destinataire=$setting->value;
              $nomdestinataire="بلدية القلعة ";
                $emailexpediteur=$request->contact_email;
                $nomexpediteur=$request->contact_name;
               //Envoyer un email
        $contact_name = $request->name;
        $contact_mail = $request->email;
        $sujet ='رسالة عن طريق بوابة بلدية القلعة '. '-'.$request->contact_name.'-';
        $message = '<b>* المرسل : </b>'.$nomexpediteur.' <b> </b> <br>';
        $message = $message.'<b>* : البريد الالكتروني للمرسل </b>'.$request->contact_email.'<br>';
        $message =$message. '<b>* المحتوى  : </b><br>'.$request->contact_message;
        $this->mailController->envoyerMail($sujet,$message,$email_destinataire,$nomdestinataire,$emailexpediteur,$nomexpediteur);
         return back();
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }


}