<?php

namespace Modules\Pipelines\Entities;

use Dimsav\Translatable\Translatable;
use Illuminate\Database\Eloquent\Model;

class Pipeline extends Model
{

    protected $table = 'pipelines__pipelines';
    public $translatedAttributes = [];
    protected $fillable = [
        'name'
    ];
}
