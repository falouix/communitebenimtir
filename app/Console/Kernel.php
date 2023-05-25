<?php

namespace App\Console;

use App\Abonne;
use App\EmailNonEnvoye;
use App\Mail\MailController;
use App\MEssageNewsLetter;
use App\Messagenewsletter as AppMessagenewsletter;
use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;
use TCG\Voyager\Models\Setting;

class Kernel extends ConsoleKernel
{
   
    /**
     * The Artisan commands provided by your application.
     *
     * @var array
     */
    protected $commands = [
        //
    ];

    /**
     * Define the application's command schedule.
     *
     * @param  \Illuminate\Console\Scheduling\Schedule  $schedule
     * @return void
     */
    protected function schedule(Schedule $schedule)
    {
        // $schedule->command('inspire')
        //          ->hourly();
        //generer les email des newsletters pour etre envoyé
        $schedule->call(function () {
            $list_msg_newsletters_non_generer=Messagenewsletter::where('status', 0)
                ->orderBy('created_at', 'asc')
                ->get();
                foreach($list_msg_newsletters_non_generer as $message){
                    $list_abonnees=Abonne::where('status','ACTIF')->get();
                    foreach($list_abonnees as $abonne){
                        Emailnonenvoye::create([
                            'TextEmail' => $message->TextMessage,
                            'email' => $abonne->email,
                            'Sujet' => $abonne->Sujet,
                            'status' => 0,
                            ]);
                    }
                    $msg=Messagenewsletter::findOrFail($message->id);
                    $msg->status=1;
                    $msg->save();
                }

        })->everyMinute();
        //envoye les emails non envoyes
        $schedule->call(function () {
            $className = 'App\Mail\MailController';
            $mailController =  new $className;
            $list_msg=Emailnonenvoye::where('status', 0)
                ->orderBy('created_at', 'asc')
                ->get();
                $setting = Setting::where('key','newsletters.email_newsletter')->firstOrFail();
                $emailexpediteur=$setting->value;
                $setting = Setting::where('key','newsletters.nom_expediteur_newsletter')->firstOrFail();
                $nomexpediteur=$setting->value;
                foreach($list_msg as $message){
                $mailController->envoyerNewsLetter($message->Sujet,$message->TextEmail,$message->email,'',$emailexpediteur,$nomexpediteur);
                 Emailnonenvoye::where('id', $message->id)->delete();
        
                }

        })->everyMinute();
    }

    /**
     * Register the commands for the application.
     *
     * @return void
     */
    protected function commands()
    {
        $this->load(__DIR__.'/Commands');

        require base_path('routes/console.php');
    }
}