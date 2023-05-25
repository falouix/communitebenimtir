<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Reclamation extends Model
{
    protected $fillable = [
 'CodeReclamation', 'Sujet', 'Textmessage', 'IdCitoyen', 'Etat', 'DateReclamation','Priorite','PiecesJointes','creerPar'
 ];
    
}
