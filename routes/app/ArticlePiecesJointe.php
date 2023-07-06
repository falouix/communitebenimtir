<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class ArticlePiecesJointe extends Model
{
    protected $fillable = [
 'id_article', 'nom_fichier', 'lien_fichier'
 ];
    
}
