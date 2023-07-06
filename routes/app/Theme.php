<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Spatie\Searchable\Searchable;
use Spatie\Searchable\SearchResult;

class Theme extends Model implements Searchable
{
    public function getSearchResult(): SearchResult
    {
        $url = route('pages.types.show', $this->slug);

        return new \Spatie\Searchable\SearchResult(
            $this,
            $this->theme_fr,
            $this->theme_en,
            $this->theme_ar,
            $this->texte_juridique_fr,
            $this->texte_juridique_en,
            $this->texte_juridique_ar,
            $url
        );
    }
}