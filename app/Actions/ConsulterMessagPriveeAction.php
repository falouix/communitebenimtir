<?php

namespace App\Actions;
use TCG\Voyager\Actions\AbstractAction;

class ConsulterMessagPriveeAction extends AbstractAction
{
    public function getTitle()
    {
        return 'Répondre';
    }
    public function getIcon()
    {
        return 'voyager-forward';
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
            'id'      => 'view-'.$this->data->{$this->data->getKeyName()},
           ];
    }
    public function shouldActionDisplayOnDataType()
    {
        // show or hide the action button, in this case will show for reclamations model
        return $this->dataType->slug == 'messages-privates';
    }
    public function getDefaultRoute()
    {
        //return route('messagesprivates.ConsulterMessage', array("id"=>$this->data->{$this->data->getKeyName()}));

        return route('voyager.'.$this->dataType->slug.'.ConsulterMessage', $this->data->{$this->data->getKeyName()});
    }
}