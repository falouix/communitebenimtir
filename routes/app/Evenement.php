<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Spatie\Searchable\Searchable;
use Spatie\Searchable\SearchResult;

class Evenement extends Model implements Searchable
{
    /**
     * Scope a query to search Evenement
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
        $url = route('evenements.show', $this->slug);

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

    /**
     * Scope a query to order posts by featured post
     */
    public function scopeFeatured(Builder $query): Builder
    {
        return $query->orderBy('featured', 'asc');
    }

    /**
     * Scope a query to order posts by latest posted
     */
    public function scopeLatest(Builder $query): Builder
    {
        return $query->orderBy('date_publication', 'desc');
    }

    /**
     * Scope a query to only include posts posted last month.
     */
    public function scopeLastMonth(Builder $query, int $limit = 5): Builder
    {
        return $query->whereBetween('date_publication', [carbon('1 month ago'), now()])
            ->latest()
            ->limit($limit);
    }

    /**
     * return the excerpt of the post content
     */
    public function excerpt(int $length = 50, $locale = 'fr'): string
    {
        $localed = 'description_' . $locale;
        return Str::limit($this->$localed, $length);
    }

}
