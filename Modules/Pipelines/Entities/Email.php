<?php

namespace Modules\Pipelines\Entities;

use Dimsav\Translatable\Translatable;
use Illuminate\Database\Eloquent\Model;

class Email extends Model
{

    protected $table = 'pipelines__emails';
    public $translatedAttributes = [];
    protected $fillable = [
        'email',
        'company_id',
    ];

    public function company()
    {
        return $this->belongsTo(Company::class, 'company_id');
    }
}
