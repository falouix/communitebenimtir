<?php

namespace App\Actions;
use TCG\Voyager\Actions\AbstractAction;

class EtatReclamationAction extends AbstractAction
{
    public function getTitle()
    {
        //return __('voyager::generic.view');
        $title="";
        //cas ouverte
        if($this->data->{'Etat'}=="0")
        {
           $title='Fermée';
        }
        return $title;
    }

    public function getIcon()
    {
        //return 'voyager-eye';
        $icon="";
        //cas ouverte
        if($this->data->{'Etat'}=="0")
        {
           $icon='voyager-x';
        }
        return $icon;
    }

    public function getPolicy()
    {
        return 'read';
    }

    public function getAttributes()
    {
        /*return [
            'class' => 'btn btn-sm btn-warning pull-right view',
        ];*/
        if($this->dataType->slug == 'reclamations')
        {
            return [
            'class'   => 'EtatReclamation',
            'data-id' => $this->data->{$this->data->getKeyName()},
            'id'      => 'EtatReclamation-'.$this->data->{$this->data->getKeyName()},
         ];
        }
        /*return [
            'class' => '',
        ];*/
    }
    public function shouldActionDisplayOnDataType()
    {
        // show or hide the action button, in this case will show for posts model
        return $this->dataType->slug == 'reclamations' && $this->data->{'Etat'}=="0";
    }
    public function getDefaultRoute()
    {
        //return route('voyager.'.$this->dataType->slug.'.show', $this->data->{$this->data->getKeyName()});
        //return route('state.modifEtat', array("id"=>$this->data->{$this->data->getKeyName()}));
        return 'javascript:;';
    }
}
