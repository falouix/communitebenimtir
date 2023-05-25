<?php

namespace App\Http\Controllers\Auth;

use App\Citoyen;
use App\Http\Controllers\Controller;
use App\Mail\MailController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Route;

class CitoyenLoginController extends Controller
{
    public function __construct(MailController $mailController)
    {
        $this->middleware('guest:citoyen', ['except' => ['logout']]);
        $this->mailController = $mailController;
    }

    public function showLoginForm()
    {
        return view('auth.citoyen_login');
    }
    public function showRegisterForm()
    {
        return view('auth.citoyen_register');
    }
    public function showMDPOubliee()
    {
        return view('auth.MDPOubliee');
    }
    public function showUpdatePassword(Request $request)
    {
        //Generate a random string.
        $token = request()->segment(3);
        $citoyen = Citoyen::where('token', '=', $token)
            ->get()
            ->first();

        if ($citoyen == null) {
            abort(419, 'Page Expirée');
        } else {
            return view('auth.UpdatePassword');
        }

    }
    public function login(Request $request)
    {
        // Validate the form data
        $this->validate($request, [
            'email' => 'required|email',
            'password' => 'required|min:6',
            'captcha' => 'required|captcha',
        ]);
        //dd($request->remember);
        // Attempt to log the user in
        if (Auth::guard('citoyen')->attempt(['email' => $request->email, 'password' => $request->password, 'Etat' => "1"], $request->remember)) {
            // if successful, then redirect to their intended location
            return redirect()->intended(route('citoyen.home'));
        } else {

            $citoyen = Citoyen::where('email', '=', $request->email)->get()->first();
            //dd($citoyen);
            if ($citoyen) {

                if (Hash::check($request->password, $citoyen->password)) {
                    // Wrong Role
                    return redirect()->back()->withInput($request->only('email', 'remember'))->withErrors('هذا الحساب موقوف أو لم يتم تفعيله !');
                } else {
                    // Wrong password
                    return redirect()->back()->withInput($request->only('email', 'remember'))->withErrors('الرجاء التثبت من كلمة السر و إعادة المحاولة .');
                }
            } else {

                return redirect()->back()->withInput($request->only('email', 'remember'))->withErrors('الرجاء التثبت من بريدك الالكتروني و إعادة المحاولة .');
            }

        }
        // if unsuccessful, then redirect back to the login with the form data
        return redirect()->back()->withInput($request->only('Email', 'remember'));
    }
    private function validator(Request $request)
    {
        //validation rules.
        $rules = [
            'CIN' => 'required|numeric|digits_between:8,8|unique:citoyens',
            'NomPrenom' => 'required',
            'email' => 'required|email|unique:citoyens',
            'password' => 'required|min:6',
            'captcha' => 'required|captcha',
        ];

        //custom validation error messages.
        $messages = [
            'CIN.required' => 'يجب كتابة رقم بطاقة التعريف الوطنية',
            'CIN.unique' => 'رقم بطاقة التعريف الوطنية مستعمل من طرف مواطن آخر',
            'CIN.numeric' => 'رقم بطاقة التعريف الوطنية يجب ان يتكون من 8 أرقام',
            'CIN.digits_between' => 'رقم بطاقة التعريف الوطنية يجب ان يتكون من 8 أرقام',
            'NomPrenom.required' => 'يجب كتابة الاسم و اللقب',
            'email.email' => 'يجب كتابة عنوان بريد الكتروني صحيح',
            'email.unique' => ' عنوان البريد الكتروني مستعمل من طرف مواطن آخر',
            'password.min' => 'كلمة السر يجب أن تحتوي على ستة حروف على الاقل',
            'captcha.captcha' => 'رمز الدخول اجباري',
        ];

        //validate the request.
        $request->validate($rules, $messages);
    }
    private function validatorReset(Request $request)
    {
        //validation rules.
        $rules = [
            'email' => 'required|email',
            'captcha' => 'required|captcha',
        ];

        //custom validation error messages.
        $messages = [
            'email.email' => 'يجب كتابة عنوان بريد الكتروني صحيح',
            'captcha.captcha' => 'رمز الدخول اجباري',
        ];

        //validate the request.
        $request->validate($rules, $messages);
    }
    public function register(Request $request)
    {
        $this->validator($request);
        if ($request->password != $request->confirmpassword) {
            return redirect()->back()->withErrors('الرجاء التثبت من كلمة السر غير متطابقة .');
        }
        $nvcitoyen = Citoyen::create([
            'CIN' => $request['CIN'],
            'NomPrenom' => $request['NomPrenom'],
            'email' => $request['email'],
            'Tel' => $request['Tel'],
            'password' => Hash::make($request['password']),
            'Etat' => 1,
            'creerPar' => 1,
            'DateInscription' => date('Y-m-d H:i:s'),
            'TypeCompte' => 'CITOYEN',
        ]);
        $request->session()->flash('success', 'تم تسجيل طلبكم بنجاح في انتظار تأكيده الرجاء الانتظار !');
        return redirect('/citoyen/register');
    }
    public function reset(Request $request)
    {

        $this->validatorReset($request);
        //get citoyen by email
        $citoyen = Citoyen::where('email', '=', $request->email)->get()->first();
        //dd($citoyen);
        if ($citoyen != null) {
            do {
                //Generate a random string.
                $token = openssl_random_pseudo_bytes(16);
                //Convert the binary data into hexadecimal representation.
                $token = bin2hex($token);
                //dd($token);
                //dd($token);
                $citoyen = Citoyen::where('token', '=', $token)
                    ->where('email', '=', $request->email)
                    ->get();
            }
            //pas de citoyen avec le meme token et mail
            while ($citoyen == null);
            {
                $citoyen = Citoyen::where('email', '=', $request->email)
                    ->get()
                    ->first();
                //dd("fdhgs");
                Citoyen::where('email', $request->email)
                    ->update(['token' => $token]);
                //envoie email
                $request->session()->flash('success', 'تم إرسال بريد إلكتروني لإعادة تحيين كلمة المرور ،الرجاء التحقق من صندوق البريد الخاص بك !');
                $email_responsable = $request->email;
                $nomresponsable = $citoyen->NomPrenom;
                $emailexpediteur = $request->email;
                $nomexpediteur = "وزارة الشؤون الدينية";
                //Envoyer un email
                $sujet = 'فضاء المواطن - وزارة الشؤون الدينية - إعادة تحيين كلمة المرور';
                $message = 'ستجد رابط إعادة تعيين كلمة المرور أدناه.' . '<br>';
                $message = $message . '<b>الرابط  : </b><br>' . url("/citoyen/reset/{$token}") . '<br>';
                $message = $message . '<b>ملاحظة   : </b><p>هذا الرابط صالح مرة واحدة فقط</p>';
                $this->mailController->envoyerMail($sujet, $message, $email_responsable, $nomresponsable, $emailexpediteur, $nomexpediteur);
                return back();
            }
        } else {
            return redirect()->back()->withErrors('الرجاء التثبت من بريدك الالكتروني .');
        }

    }
    public function UpdatePassword(Request $request)
    {
        //get citoyen by email

        //  dd($request);
        if ($request->password != $request->confirmpassword) {
            return redirect()->back()->withErrors('الرجاء التثبت من كلمة السر غير متطابقة .');
        }
        //Generate a random string.
        $token = request()->segment(3);
        $citoyen = Citoyen::where('token', '=', $token)
            ->get()
            ->first();

        if ($citoyen == null) {
            abort(419, 'Page Expirée');
        }

        //dd($citoyen->email);
        //pas de citoyen avec le meme token et mail
        Citoyen::where('token', $token)
            ->update(['password' => Hash::make($request['password']), 'token' => null]);
        //dd("fdhgs");
        //envoie email
        $request->session()->flash('success', 'تم تغيير كلمة المرور بنجاح !');
        $email_responsable = $citoyen->email; //$citoyen->email
        $nomresponsable = $citoyen->NomPrenom;
        $emailexpediteur = $citoyen->email;
        $nomexpediteur = "وزارة الشؤون الدينية ";
        //Envoyer un email
        $sujet = 'تغيير كلمة المرور ';
        $message = 'لقد تم تغيير كلمة المرور بنجاح ';
        $this->mailController->envoyerMail($sujet, $message, $email_responsable, $nomresponsable, $emailexpediteur, $nomexpediteur);
        return redirect('/citoyen');

    }

    public function logout()
    {
        Auth::guard('citoyen')->logout();
        return redirect('/citoyen');
    }
    public function refreshCaptcha()
    {
        return response()->json(['captcha' => captcha_img('flat')]);
    }

}
