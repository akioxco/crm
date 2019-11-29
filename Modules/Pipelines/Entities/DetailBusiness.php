<?php

namespace Modules\Pipelines\Entities;

use Illuminate\Database\Eloquent\Model;

class DetailBusiness extends Model
{

    protected $table = 'pipelines__detailbusinesses';

    protected $fillable = [
        'business_id',
        'product_id',
        'quantity',
        'value',
    ];

    public function business()
    {
        return $this->belongsTo(Business::class, 'business_id');
    }

    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id');
    }
}
