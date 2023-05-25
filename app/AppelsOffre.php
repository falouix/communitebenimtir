<?php

namespace App;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Scope;
use Spatie\Searchable\Searchable;
use Spatie\Searchable\SearchResult;

class AppelsOffre extends Model implements Searchable
{
    /**
     * Scope a query to search AppelsOffre
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
                ->orWhere($localed, 'LIKE', "%{$search}%")
                ->latest()
                ->featured();
        }
    }

    public function getSearchResult(): SearchResult
    {
        $url = route('appelsOffres.show', $this->slug);

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
        return $query->orderBy('created_at', 'desc');
    }

    /**
     * Scope a query to only include posts posted last month.
     */
    public function scopeLastMonth(Builder $query, int $limit = 5): Builder
    {
        return $query->whereBetween('created_at', [carbon('1 month ago'), now()])
            ->latest()
            ->limit($limit);
    }
}