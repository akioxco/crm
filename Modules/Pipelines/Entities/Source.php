<?php

namespace Modules\Pipelines\Entities;

use Dimsav\Translatable\Translatable;
use Illuminate\Database\Eloquent\Model;

class Source extends Model
{

    protected $table = 'pipelines__sources';
    public $translatedAttributes = [];
    protected $fillable = [
        'name'
    ];

    public function companies()
    {
        return $this->hasMany(Company::class);
    }

    public function contacts()
    {
        return $this->hasMany(Contact::class);
    }
}
