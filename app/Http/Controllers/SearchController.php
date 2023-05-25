<?php

namespace App\Http\Controllers;

use App\Actualite;
use App\AnnuaireEtablissement;
use App\AppelsOffre;
use App\Article;
use App\Evenement;
use App\Faq;
use App\MonumentsReligieu;
use App\PubRecherch;
use App\Theme;
use App\Type;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Spatie\Searchable\Search;

class SearchController extends Controller
{
    public function searchTous(Request $request)
    {
        //dd(LaravelLocalization::getCurrentLocale());
        $model = $_GET['model'];
        $searchResults = array();
        if (isset($model)) {
            $searchResults = $this->searchWithModel($request, $model);
        }
        return view('searchResult', [
            'searchResults' => $searchResults,
        ]);
    }
    public function searchWithModel(Request $request, string $model)
    {

        switch ($model) {
            case 'all':
                if ($_GET['qglobal'] !== null) {
                    $searchResults = (new Search())
                        ->registerModel(Actualite::class,
                            'titre_fr', 'titre_ar', 'titre_en', html_entity_decode('description_fr'),
                            html_entity_decode('description_en'), html_entity_decode('description_ar'))
                        ->registerModel(Evenement::class,
                            'titre_fr', 'titre_ar', 'titre_en', html_entity_decode('description_fr'),
                            html_entity_decode('description_en'), html_entity_decode('description_ar'))
                        ->registerModel(Article::class,
                            'titre_fr', 'titre_ar', 'titre_en', html_entity_decode('contenu_fr'),
                            html_entity_decode('contenu_en'), html_entity_decode('contenu_ar'))
                        ->registerModel(AppelsOffre::class,
                            'titre_fr', 'titre_ar', 'titre_en', html_entity_decode('description_fr'),
                            html_entity_decode('description_en'), html_entity_decode('description_ar'))
                            ->search($request->input('qglobal'));
                }
                break;

        }

        return $searchResults;
    }
}
