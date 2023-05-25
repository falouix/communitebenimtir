<?php

namespace App\Http\Controllers;

use App\ArticlesTravauxAssociation;
use Illuminate\Http\Request;
use App\Actualite;
use App\RaccourciRapide;
class ArticlesTravauxAssociationController extends Controller
{
 

    
    public function index()
    {
        $listTravaux = ArticlesTravauxAssociation::where('status','=','PUBLISHED')
                                    ->orderBy('date_publication','desc')
                                         ->paginate(6);
        return view('pages.travauxassociations.index',[
            'listTravaux'=> $listTravaux
        ])->with('i', (request()->input('page', 1) - 1) * 6);
    }
}
