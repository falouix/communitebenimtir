<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class DemandeAcce extends Model
{
    protected $fillable = [
 'codeDemande', 'IdDemandeur', 'Info', 'ServiceConcerne', 'ReferenceDocs', 'Remarques','FormeAcce','DateDemande','EtatDemande','PiecesJointes','creerPar','NomDocumentDemande'
 ];
}
