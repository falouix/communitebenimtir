<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class ReponseReclamation extends Model
{
     protected $fillable = [
 'Id_reclamation', 'TextReponse', 'Expediteur', 'DateReponse', 'PiecesJointes', 'Lu'
 ];
}
