<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Spatie\Searchable\Searchable;
use Spatie\Searchable\SearchResult;

class Type extends Model implements Searchable
{
    public function getSearchResult(): SearchResult
    {
        $url = route('pages.themes.show', $this->slug);

        return new \Spatie\Searchable\SearchResult(
            $this,
            $this->type_fr,
            $this->type_en,
            $this->type_ar,
            $this->texte_juridique_fr,
            $this->texte_juridique_en,
            $this->texte_juridique_ar,
            $url
        );
    }
}