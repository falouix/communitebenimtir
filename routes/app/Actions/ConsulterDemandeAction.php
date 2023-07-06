<?php

namespace App\Actions;
use TCG\Voyager\Actions\AbstractAction;

class ConsulterDemandeAction extends AbstractAction
{
    public function getTitle()
    {
         $title="";
        //cas ouverte
        if($this->data->{'EtatDemande'}=="0")
        {
           $title='Répondre';
        }
        else
        {
           $title="Consulter";
        }
        return $title;
    }
    public function getIcon()
    {
        $icon="";
        //cas ouverte
        if($this->data->{'EtatDemande'}=="0")
        {
           $icon='voyager-forward';
        }
        else
        {
           $icon='voyager-eye';
        }
        return $icon;
    }
    public function getPolicy()
    {
        return 'read';
    }
    public function getAttributes()
    {

            return [
            'class'   => 'view',
            'data-id' => $this->data->{$this->data->getKeyName()},
            'id'      => 'delete-'.$this->data->{$this->data->getKeyName()},
           ];

    }
    public function shouldActionDisplayOnDataType()
    {
        // show or hide the action button, in this case will show for reclamations model
        return $this->dataType->slug == 'demande-acces';
    }
    public function getDefaultRoute()
    {
        return route('voyager.'.$this->dataType->slug.'.ConsulterDemande', $this->data->{$this->data->getKeyName()});
    }
}