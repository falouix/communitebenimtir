<?php

namespace TCG\Voyager\Actions;

class EditAction extends AbstractAction
{
    public function getTitle()
    {
        return __('voyager::generic.edit');
    }

    public function getIcon()
    {
        return 'voyager-edit';
    }

    public function getPolicy()
    {
        return 'edit';
    }

    public function getAttributes()
    {

            return [
            'class'   => 'edit',
            'data-id' => $this->data->{$this->data->getKeyName()},
            'id'      => 'edit-'.$this->data->{$this->data->getKeyName()},
        ];

    }
    public function shouldActionDisplayOnDataType()
    {
        // show or hide the action button, in this case will not show for reclamation model
        if($this->dataType->slug == 'messages-privates')
         {
             return $this->dataType->slug != 'messages-privates';
         }
         elseif ($this->dataType->slug == 'demande-acces') {

              return $this->dataType->slug != 'demande-acces';
         }
        else if($this->dataType->slug == 'demande-docs')
        {
            return $this->dataType->slug != 'demande-docs';
        }
        else if($this->dataType->slug == 'denonciations')
        {
            return $this->dataType->slug != 'denonciations';
        }
         else {
            return $this->dataType->slug != 'reclamations';
         }

    }
    public function getDefaultRoute()
    {
        return route('voyager.'.$this->dataType->slug.'.edit', $this->data->{$this->data->getKeyName()});
    }
}