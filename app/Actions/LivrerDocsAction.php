<?php

namespace App\Actions;
use TCG\Voyager\Actions\AbstractAction;

class LivrerDocsAction extends AbstractAction
{
    public function getTitle()
    {
        //return __('voyager::generic.view');
        $title="";
        //cas en attente
         if($this->data->{'etat'}=="0")
        {
           $title='Livrer';
        }
        //cas Livrer
        else if($this->data->{'etat'}=="1")
        {
            $title='Refuser';
        }
        return $title;
    }

    public function getIcon()
    {
        //return 'voyager-eye';
         $icon="";
        //cas en attente
         if($this->data->{'etat'}=="0")
        {
           $icon='voyager-check';
        }
        //cas Livrer
        else if($this->data->{'etat'}=="1")
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
        if($this->dataType->slug == 'demande-docs')
        {
            return [
            'class'   => 'LivRefDemande',
            'data-id' => $this->data->{$this->data->getKeyName()},
            'id'      => 'LivRefDemande-'.$this->data->{$this->data->getKeyName()},
         ];
        }
        /*return [
            'class' => '',
        ];*/
    }
    public function shouldActionDisplayOnDataType()
    {
        // show or hide the action button, in this case will show for posts model
        if( $this->dataType->slug == 'demande-docs' && ($this->data->{'etat'}=="1" || $this->data->{'etat'}=="0"))
        {
            return $this->dataType->slug == 'demande-docs';
        }

    }
    public function getDefaultRoute()
    {
        //return route('voyager.'.$this->dataType->slug.'.show', $this->data->{$this->data->getKeyName()});
        //return route('state.modifEtat', array("id"=>$this->data->{$this->data->getKeyName()}));
        return 'javascript:;';
    }
}