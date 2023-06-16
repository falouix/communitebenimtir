<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Route;

class DownloadsController extends Controller
{
    public function __construct()

    {

        $this->middleware('auth:citoyen');
        

    }
    public function download() {
    $file_path = public_path().$_GET['file'];
    //dd($file_path);
    return response()->download($file_path);
  }
}
