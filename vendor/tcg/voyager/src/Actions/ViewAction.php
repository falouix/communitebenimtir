<?php

namespace TCG\Voyager\Actions;

class ViewAction extends AbstractAction
{
    public function getTitle()
    {
        if($this->dataType->slug == 'messages-privates' )
        {
            return 'Repondre';
        }
        elseif ($this->dataType->slug == 'denonciations' ) {
            # code...
            return 'Consulter';
        }
        else
        {
          return __('voyager::generic.view');
        }
    }

    public function getIcon()
    {
        if($this->dataType->slug == 'messages-privates' )
        {
            return 'voyager-forward';
        }
        else {
            return 'voyager-eye';
        }

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
         if($this->dataType->slug == 'demande-acces')
         {
             return $this->dataType->slug != 'demande-acces';
         }
         else if($this->dataType->slug == 'demande-docs')
        {
            return $this->dataType->slug != 'demande-docs';
        }
         else {
            return $this->dataType->slug != 'reclamations';
         }

    }

    public function getDefaultRoute()
    {
        if ($this->dataType->slug == 'messages-privates' ) {
            # code...
            return route('voyager.'.$this->dataType->slug.'.ConsulterMessage', $this->data->{$this->data->getKeyName()});
        }
        elseif($this->dataType->slug == 'denonciations' ) {
            # code...
            return route('voyager.'.$this->dataType->slug.'.ConsulterDenonciation', $this->data->{$this->data->getKeyName()});
        }
        else {
            # code...
            return route('voyager.'.$this->dataType->slug.'.show', $this->data->{$this->data->getKeyName()});
        }
    }
}