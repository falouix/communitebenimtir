<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Gallery extends Model
{
    public function Video()
    {
        return $this->hasMany('App\Video');
    }
}
