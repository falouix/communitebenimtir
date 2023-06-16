<?php

namespace App;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Scope;
use Spatie\Searchable\Searchable;
use Spatie\Searchable\SearchResult;

class Faq extends Model implements Searchable
{
    /**
     * Scope a query to search Actualite
     */
    public function scopeSearch(Builder $query, ?string $search)
    {
        //$locale = \Session::get('locale');
        if ($search) {
            $locale = \Session::get('locale');
            $localet = 'titre_' . $locale;

            $localed = 'description_' . $locale;
            // When I use %% LIKE will be equal to CONTAINS
            return $query->where('status', 'PUBLISHED')
                ->where($localet, 'LIKE', "%{$search}%")
                ->orWhere($localed, 'LIKE', "%{$search}%");
        }
    }

    public function getSearchResult(): SearchResult
    {
        $url = (string) route('pages.faqs.show', $this->slug);

        return new \Spatie\Searchable\SearchResult(
            $this,
            $this->titre_fr,
            $this->titre_en,
            $this->titre_ar,
            $this->description_fr,
            $this->description_en,
            $this->description_ar,
            $url

        );
    }
}