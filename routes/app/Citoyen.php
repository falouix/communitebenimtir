<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Citoyen extends Authenticatable
 {

protected $guard = 'citoyen';

/**
 * The attributes that are mass assignable.
 *
 * @var array
 */
 protected $fillable = [
 'CIN', 'NomPrenom', 'email', 'Tel', 'Login', 'password','Etat','ConfirmePar','DateInscription','TypeCompte','creerPar'
 ];

/**
 * The attributes that should be hidden for arrays.
 *
 * @var array
 */
 protected $hidden = [
 'PWD', 'remember_token',
 ];
    public function Citoyens()
{
    return $this->hasMany(DemandeDoc::class, 'citoyen', 'citoyen_id');
}
}
