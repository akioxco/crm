<?php

namespace Modules\Pipelines\Entities;

use Dimsav\Translatable\Translatable;
use Illuminate\Database\Eloquent\Model;

class Country extends Model
{

    protected $table = 'pipelines__countries';
    public $translatedAttributes = [];
    protected $fillable = [
        'name',
        'iso'
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
