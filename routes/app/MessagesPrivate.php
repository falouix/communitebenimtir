<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class MessagesPrivate extends Model
{
protected $fillable = [
 'Textmessage', 'DateEnvoie', 'Sujet', 'Expediteur', 'Lu', 'PiecesJointes','id_citoyen'
 ];
}