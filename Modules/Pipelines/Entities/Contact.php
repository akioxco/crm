<?php

namespace Modules\Pipelines\Entities;

use Dimsav\Translatable\Translatable;
use Illuminate\Database\Eloquent\Model;
use Modules\User\Entities\Sentinel\User;

class Contact extends Model
{

    protected $table = 'pipelines__contacts';
    public $translatedAttributes = [];
    protected $fillable = [
        'name',
        'last_name',
        'email',
        'number_wa',
        'phone',
        'company_id',
        'web',
        'city',
        'country_id',
        'source_id',
        'seller_id',
        'added_by',
    ];

    public function company()
    {
        return $this->belongsTo(Company::class, 'company_id');
    }

    public function country()
    {
        return $this->belongsTo(Country::class, 'country_id');
    }

    public function source()
    {
        return $this->belongsTo(Source::class, 'source_id');
    }

    public function seller()
    {
        return $this->belongsTo(User::class, 'seller_id');
    }

    public function notes()
    {
        return $this->hasMany(Note::class);
    }

    public function businesses()
    {
        return $this->hasMany(Business::class);
    }


}
