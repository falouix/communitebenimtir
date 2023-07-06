<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Spatie\Searchable\Searchable;
use Spatie\Searchable\SearchResult;

class Article extends Model implements Searchable
{
    public function getSearchResult(): SearchResult
    {
        $url = (string) route('pages.show', $this->slug);

        return new \Spatie\Searchable\SearchResult(
            $this,
            $this->titre_fr,
            $this->titre_en,
            $this->titre_ar,
            $this->contenu_fr,
            $this->contenu_en,
            $this->contenu_ar,
            $url
        );
    }
    public function pages()
    {
        return $this->hasMany('App\ListArticle');
    }
    public function fichiers()
    {
        return $this->hasMany('App\ArticlePiecesJointe');
    }
}