<?php

namespace Modules\Pipelines\Entities;

use Dimsav\Translatable\Translatable;
use Illuminate\Database\Eloquent\Model;

class TypeBusiness extends Model
{

    protected $table = 'pipelines__typebusinesses';
    public $translatedAttributes = [];
    protected $fillable = [
        'name'
    ];

    public function businesses()
    {
        return $this->hasMany(Business::class);
    }
}
