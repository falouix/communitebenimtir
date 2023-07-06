<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Denonciation extends Model
{
    protected $fillable = [
 'type_personne', 'raison_sociale', 'adresse', 'tel', 'email', 'identifie','structure_signale','secteur','description','PiecesJointes','Nom','Prenom'
 ,'CIN','TrancheAge','Sexe','Profession','Gouvernorat','personne_signale','created_at','updated_at','creerPar','modifierPar'
 ];
}
