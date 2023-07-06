<?php

Class L18n{

    /*
    |
    | Gets the URL of the current page and applies the desired language to it.
    | If `lang` is set to "en" then the URL for the route `trips` should look
    | like `http://domain.com/en/trips`. If the `lang` is set to "" then the URL
    | should look like `http://domain.com/trips`.
    |
    */
    static function currentUrl($lang = "")
    {

        Session::put('applocale', $lang);
        dd(Session::get('applocale'));
      //  dd(app()->setLocale("here"));
       // dd($lang);
       //App::setLocale($lang);
        // if the desired language is found in the supported_locales variable
        if( in_array($lang, Config::get('app.available_locales')) )
        {
            // if the first part of the URL is found in the supported_locales
            if( in_array(Request::segment(1), Config::get('app.available_locales')) )
            {
                // remove the first two characters from the `path`; DELETE (en)
                $cleanPath = substr(Request::path(), 2);
                // replace current `path` with the modified `lang` + `cleanPath`; MERGE (de/path)
                $translated = str_replace(Request::path(), $lang.$cleanPath, Request::url());
            }
            // else if the first part of the URL is null; DOES NOT EXIST (there is no language set)
            elseif (Request::segment(1)==null)
            {
                // append `lang` to the end of the  current URL
                $translated = Request::url().'/'.$lang;
            }
            // else if the first part of the URL is something, but not a language then
            else{
                // save current path
                $path = Request::path();
                // append `lang` and `path` to `domain`
                $translated = Config::get('app.url').'/'.$lang.'/'.$path;
            }

            return $translated;
        }
        // if the desired language is not found in the supported_locales variable; (default to app.locale)
        else{
            // if the first part  of the URL is found in the supported_locales (the user is currently viewing the translated page)
            if( in_array(Request::segment(1), Config::get('app.available_locales')) )
            {
                // remove the first three characters from `path`; DELETE (en/)
                $cleanPath = substr(Request::path(), 3);
                // replace current `path` with `cleanPath`
                $default = str_replace(Request::path(), $cleanPath, Request::url());
            }
            // the URL has no language set
            else{
                // just return the current URL
                $default = Request::url();
            }


            return $default;
        }
    }

    //Covert Month to letter by locale
    static function monthToLetter(int $num, string $local='fr'){

        $monthLetter="";
        switch ($local) {
            case 'ar':
                switch ($num) {
                    case 1:
                        $monthLetter='جانفي';
                        break;
                    case 2:
                        $monthLetter='فيفري';
                        break;
                    case 3:
                        $monthLetter='مارس';
                        break;
                    case 4:
                        $monthLetter='أفريل';
                        break;
                    case 5:
                        $monthLetter='ماي';
                        break;
                    case 6:
                        $monthLetter='جوان';
                        break;
                    case 7:
                        $monthLetter='جويلية';
                        break;
                    case 8:
                        $monthLetter='أوت';
                        break;
                    case 9:
                        $monthLetter='سبتمبر';
                        break;
                    case 10:
                        $monthLetter='أكتوبر';
                        break;
                    case 11:
                        $monthLetter='نوفمبر';
                        break;
                    case 12:
                        $monthLetter='ديسمبر';
                        break;
                }
                break;
            default:
            switch ($num) {
                case 1:
                    $monthLetter='Jan';
                    break;
                case 2:
                    $monthLetter='Fev';
                    break;
                case 3:
                    $monthLetter='Mars';
                    break;
                case 4:
                    $monthLetter='Avril';
                    break;
                case 5:
                    $monthLetter='May';
                    break;
                case 6:
                    $monthLetter='Juin';
                    break;
                case 7:
                    $monthLetter='Juillet';
                    break;
                case 8:
                    $monthLetter='Aôut';
                    break;
                case 9:
                    $monthLetter='Sept';
                    break;
                case 10:
                    $monthLetter='Oct';
                    break;
                case 11:
                    $monthLetter='Nov';
                    break;
                case 12:
                    $monthLetter='Dec';
                    break;
            }
                break;
        }

         return $monthLetter;
    }
    protected function compileEchos($value)
    {

        $value = preg_replace('/\{\{\{\s*(.+?)\s*\}\}\}/s', '<?php echo $1; ?>', $value);
        return preg_replace('/\{\{\s*(.+?)\s*\}\}/s', "<?php echo htmlentities($1, ENT_QUOTES, 'UTF-8', false); ?>", $value);
    }
}
