<?php

namespace App\Actions;
use TCG\Voyager\Actions\AbstractAction;

class NonSatisfaiteAction extends AbstractAction
{
    public function getTitle()
    {
        return 'Marquer comme non satisfaite';
    }

    public function getIcon()
    {
        return 'voyager-x';
    }

    public function getPolicy()
    {
        return 'read';
    }

    public function getAttributes()
    {

        if($this->dataType->slug == 'demande-acces')
        {
            return [
            'class'   => 'Satisfaite',
            'data-id' => $this->data->{$this->data->getKeyName()},
            'id'      => 'Satisfaite-'.$this->data->{$this->data->getKeyName()},
         ];
        }
        /*return [
            'class' => '',
        ];*/
    }
    public function shouldActionDisplayOnDataType()
    {
        // show or hide the action button, in this case will show for posts model
        if ($this->dataType->slug == 'demande-acces' && $this->data->{'EtatDemande'}=="0") {
            return $this->dataType->slug == 'demande-acces';
        }
        return null;
    }
    public function getDefaultRoute()
    {
        //return route('voyager.'.$this->dataType->slug.'.show', $this->data->{$this->data->getKeyName()});
        //return route('state.modifEtat', array("id"=>$this->data->{$this->data->getKeyName()}));
        return 'javascript:;';
    }
}