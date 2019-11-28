<?php

namespace Modules\Pipelines\Entities;

use Dimsav\Translatable\Translatable;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{

    protected $table = 'pipelines__products';
    
    protected $fillable = [
        'name',
        'price',
    ];
    
    public function detailBusinesses()
    {
        return $this->hasMany(DetailBusiness::class);
    }
}
