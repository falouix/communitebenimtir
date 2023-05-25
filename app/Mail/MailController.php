<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Support\Facades\Mail;

class MailController extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    /* public function __construct($details)
    {
        $this->details = $details;
    }*/

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build(string $contact_name,string $contact_mail,string $sujet,string $Textmessage,string $destinataire)
    {
$to_name = 'Contact de commune makthar';
$to_email = $destinataire;
$data = array("contact_name"=>$contact_name, "Textmessage" => $Textmessage,"contact_mail" => $contact_mail,"sujet" => $sujet);

Mail::send('pages.contact.email', $data, function($message) use ($to_name, $to_email,$sujet,$contact_mail,$contact_name) {
$message->to($to_email, $to_name)
->subject($sujet);
$message->from($contact_mail,$contact_name);
});
//dd($to_email);
        //return $this->view('pages.contact.index');
    }
    public function envoyerMail(string $sujet,string $Textmessage,string $Emaildestinataire,string $Nomdestinataire,string $Emailexpediteur,string $NomExpediteur)
    {
$to_name = $Nomdestinataire;
$to_email = $Emaildestinataire;
$data = array( "Textmessage" => $Textmessage,"sujet" => $sujet);

Mail::send('citoyen.email.index', $data, function($message) use ($to_name, $to_email,$sujet,$Emailexpediteur,$NomExpediteur) {
$message->to($to_email, $to_name)
->subject($sujet);
$message->from($Emailexpediteur,$NomExpediteur);
});
//dd($to_email);
        //return $this->view('pages.contact.index');
    }

    public function envoyerNewsLetter(string $sujet,string $Textmessage,string $Emaildestinataire,string $Nomdestinataire,string $Emailexpediteur,string $NomExpediteur)
    {
$to_name = $Nomdestinataire;
$to_email = $Emaildestinataire;
$data = array( "Textmessage" => $Textmessage,"sujet" => $sujet);

Mail::send('email.indexNewsLetter', $data, function($message) use ($to_name, $to_email,$sujet,$Emailexpediteur,$NomExpediteur) {
$message->to($to_email, $to_name)
->subject($sujet);
$message->from($Emailexpediteur,$NomExpediteur);
});
    }
}
