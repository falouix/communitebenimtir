<?php

namespace App\Http\Controllers;

use App\Abonne;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Mail\MailController;
use App\Reclamation;
use App\ReponseReclamation;
use Illuminate\Support\Facades\Auth;
use TCG\Voyager\Models;
use TCG\Voyager\Models\Setting;

class NewsLetterController extends Controller
{

    public function abonner(Request $request)

    {

       //validation rules.
    $rules = [
        'email' => 'required',
        'captcha' => 'required|captcha',
    ];

    //custom validation error messages.
    $messages = [
        'email.required' => 'email',
        'captcha.captcha'=>'رمز الدخول اجباري',
    ];

    //validate the request.
    $request->validate($rules,$messages);
    $nvabonne = Abonne::create([
            'email' => $request['email'],
            'status' => 'ACTIF',
        ]);
    return redirect('/');

    }
      public function refreshCaptcha()
    {
        return response()->json(['captcha'=> captcha_img('flat')]);
    }

}