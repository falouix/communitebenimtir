<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Citoyen;

class DemandeDoc extends Model
{
protected $fillable = [
 'citoyen_id', 'date_demande', 'etat', 'raison_refus', 'langue', 'traiter_par','type_docs_id','type_envoi','libelle_type_doc','description'
 ];
    public function citoyenId()
    {
        return $this->belongsTo(Citoyen::class,'citoyen_id');
    }
    public function getMakeNameAttribute()
{
    return $this->citoyenId->NomPrenom;
}
/*public function citoyenIdList()
{
    return Citoyen::where('active', 1)->orderBy('created_at')->get();
}*/
}
