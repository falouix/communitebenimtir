<?php

namespace TCG\Voyager\Actions;

class DeleteAction extends AbstractAction
{
    public function getTitle()
    {
        return __('voyager::generic.delete');
    }

    public function getIcon()
    {
        return 'voyager-trash';
    }

    public function getPolicy()
    {
        return 'delete';
    }

   public function getAttributes()
    {
        return [
            'class'   => 'delete',
            'data-id' => $this->data->{$this->data->getKeyName()},
            'id'      => 'delete-'.$this->data->{$this->data->getKeyName()},
        ];

    }

    public function getDefaultRoute()
    {
        return 'javascript:;';
    }

    public function shouldActionDisplayOnDataType()
    {
        if($this->dataType->slug == 'reclamations' && $this->data->{'Etat'}=="1" )
        {
            return $this->dataType->slug != 'reclamations';
        }
        else if($this->dataType->slug == 'demande-acces' && ($this->data->{'EtatDemande'}=="1" || $this->data->{'EtatDemande'}=="2"))
        {
            return $this->dataType->slug != 'demande-acces';
        }
        else if($this->dataType->slug == 'demande-docs' && ($this->data->{'etat'}=="1" || $this->data->{'etat'}=="2"))
        {
            return $this->dataType->slug != 'demande-docs';
        }
        else {
            $model = $this->data->getModel();
        if ($model && in_array(\Illuminate\Database\Eloquent\SoftDeletes::class, class_uses($model)) && $this->data->deleted_at ) {
            return false;
        }

        return parent::shouldActionDisplayOnDataType();
        }
    }
}