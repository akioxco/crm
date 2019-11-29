<?php

namespace Modules\Pipelines\Entities;

use Dimsav\Translatable\Translatable;
use Illuminate\Database\Eloquent\Model;

class Phone extends Model
{

    protected $table = 'pipelines__phones';
    public $translatedAttributes = [];
    protected $fillable = [
        'phone',
        'company_id',
    ];

    public function company()
    {
        return $this->belongsTo(Company::class, 'company_id');
    }
}
