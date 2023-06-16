<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class ReponseDemandeAcce extends Model
{
     protected $fillable = [
 'Id_demandeacces', 'TextReponse', 'Expediteur', 'DateReponse', 'PiecesJointes', 'Lu'
 ];
}
