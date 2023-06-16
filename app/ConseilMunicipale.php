<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * @property int $id
 * @property string $created_at
 * @property string $updated_at
 * @property int $Annee
 * @property string $titre_ar
 * @property string $titre_fr
 * @property string $TitreEN
 * @property string $TypeConseil
 * @property string $FichierConseil
 * @property string $seo_title
 * @property string $meta_description
 * @property string $meta_keywords
 * @property string $slug
 * @property string $status
 */
class ConseilMunicipale extends Model
{
    /**
     * @var array
     */
    protected $fillable = ['created_at', 'updated_at', 'Annee', 'titre_ar', 'titre_fr', 'TitreEN', 'TypeConseil', 'FichierConseil', 'seo_title', 'meta_description', 'meta_keywords', 'slug', 'status'];

}
