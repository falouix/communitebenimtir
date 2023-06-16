<?php

namespace App\Http\Controllers;

use App\AppelsOffre;
use App\Article;
use App\Evenement;
use Illuminate\Http\Request;

class PageFrontController extends Controller
{
 

    
    /**
     * Display the specified resource.
     *
     * @param  string $slug
     * 
     */
    public function show($slug)
    {
        $page = Article::where('slug','=',$slug)->Where('status','PUBLISHED')->firstOrFail();
        $pages = $page->pages()->paginate(6);
        if (count($pages)>0){
            return view('pages.pages.index',[
            'page'=>$page,
            'listPages'=>$pages,
        ])->with('i', (request()->input('page', 1) - 1) * 4);

        } else {
           return view('pages.pages.show',[
            'page'=>Article::where('slug','=',$slug)
            ->where('status', 'PUBLISHED')
            ->firstOrFail(),
        ]); 
        }
        
    }
     public function details($slug)
    {
           return view('pages.pages.show',[
            'page'=>Article::where('slug','=',$slug)
            ->where('status', 'PUBLISHED')
            ->firstOrFail(),
        ]); 
        
    }
}