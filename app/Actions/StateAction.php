<?php

namespace App\Actions;
use TCG\Voyager\Actions\AbstractAction;

class StateAction extends AbstractAction
{
    public function getTitle()
    {
        //return __('voyager::generic.view');
        $title="";
        //cas en attente
         if($this->data->{'Etat'}=="0")
        {
           $title='Confirmé';
        }
        //cas Confirmé
        else if($this->data->{'Etat'}=="1")
        {
            $title='Suspendu';
        }
        //cas Suspendu
        else if($this->data->{'Etat'}=="2")
        {
             $title='Réactiver';
        }
        return $title;
    }

    public function getIcon()
    {
        //return 'voyager-eye';
         $icon="";
        //cas en attente
         if($this->data->{'Etat'}=="0")
        {
           $icon='voyager-check';
        }
        //cas Confirmé
        else if($this->data->{'Etat'}=="1")
        {
            $icon='voyager-x';
        }
        //cas Suspendu
        else if($this->data->{'Etat'}=="2")
        {
             $icon='voyager-refresh';
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
        if($this->dataType->slug == 'citoyens')
        {
            return [
            'class'   => 'EditEtat',
            'data-id' => $this->data->{$this->data->getKeyName()},
            'id'      => 'EditEtat-'.$this->data->{$this->data->getKeyName()},
         ];
        }
        /*return [
            'class' => '',
        ];*/
    }
    public function shouldActionDisplayOnDataType()
    {
        // show or hide the action button, in this case will show for posts model
        return $this->dataType->slug == 'citoyens';
    }
    public function getDefaultRoute()
    {
        //return route('voyager.'.$this->dataType->slug.'.show', $this->data->{$this->data->getKeyName()});
        //return route('state.modifEtat', array("id"=>$this->data->{$this->data->getKeyName()}));
        return 'javascript:;';
    }
}