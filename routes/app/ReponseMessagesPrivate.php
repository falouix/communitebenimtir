<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class ReponseMessagesPrivate extends Model
{
 protected $fillable = [
 'id_message_prive', 'TextReponse', 'Expediteur', 'DateReponse', 'PiecesJointes', 'Lu'
 ];
}