<?php

namespace App;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Spatie\Searchable\Searchable;
use Spatie\Searchable\SearchResult;

class MonumentsReligieu extends Model implements Searchable
{
    public function scopeSearch(Builder $query, ?string $search)
    {
        //$locale = \Session::get('locale');
        if ($search) {
            $locale = \Session::get('locale');
            $localet = 'libelle_' . $locale;

            $localed = 'description_' . $locale;
            // When I use %% LIKE will be equal to CONTAINS
            return $query->where('status', 'PUBLISHED')
                ->where($localet, 'LIKE', "%{$search}%")
                ->orWhere($localed, 'LIKE', "%{$search}%");
        }
    }

    public function getSearchResult(): SearchResult
    {
        $url = route('pages.monuments.show', $this->slug);

        return new \Spatie\Searchable\SearchResult(
            $this,
            $this->libelle_fr,
            $this->libelle_en,
            $this->libelle_ar,
            $this->description_fr,
            $this->description_en,
            $this->description_ar,
            $url
        );
    }

}