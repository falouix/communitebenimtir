<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Gallery;
use App\AppelsOffre;
use App\Evenement;

class GalleryFrontController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
    */
    public function index()
    {
        $listGallery = Gallery::where('status','=','PUBLISHED')
                                    ->orderBy('created_at','desc')
                                    ->paginate(6);
        return view('pages.gallery.index',[
            'listGallery'=> $listGallery
        ])->with('i', (request()->input('page', 1) - 1) * 4);
    }

    /**
     * Display the specified resource.
     *
     *
     * @param  string $slug
     */
    public function show($slug)
    {
        return view('pages.gallery.show',[
            'gallerie'=> Gallery::where('slug','=',$slug)->firstOrFail()
        ]);
    }
}