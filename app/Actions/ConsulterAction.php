<?php

namespace App\Actions;
use TCG\Voyager\Actions\AbstractAction;

class ConsulterAction extends AbstractAction
{
    public function getTitle()
    {
         $title="";
        //cas ouverte
        if($this->data->{'Etat'}=="0")
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
        if($this->data->{'Etat'}=="0")
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
        if($this->dataType->slug == 'citoyens' || 'reclamations')
        {
            return [
            'class'   => 'view',
            'data-id' => $this->data->{$this->data->getKeyName()},
            'id'      => 'delete-'.$this->data->{$this->data->getKeyName()},
           ];
        }
        return [
            'class' => 'btn btn-sm btn-warning pull-right view',
        ];
    }
    public function shouldActionDisplayOnDataType()
    {
        // show or hide the action button, in this case will show for reclamations model
        return $this->dataType->slug == 'reclamations';
    }
    public function getDefaultRoute()
    {
        return route('voyager.'.$this->dataType->slug.'.ConsulterReclamation', $this->data->{$this->data->getKeyName()});
    }
}