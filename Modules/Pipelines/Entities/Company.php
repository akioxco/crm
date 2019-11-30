<?php

namespace Modules\Pipelines\Entities;

use Dimsav\Translatable\Translatable;
use Illuminate\Database\Eloquent\Model;
use Modules\User\Entities\Sentinel\User;

class Company extends Model
{

    protected $table = 'pipelines__companies';
    
    protected $fillable = [
        'name',
        'city',
        'country_id',
        'web',
        'source_id',
        'seller_id',
        'type_id',
        'identification',
        'subdomain',
        'email',
        'phone',
    ];

    public function emails()
    {
        return $this->hasMany(Email::class);
    }

    public function phones()
    {
        return $this->hasMany(Phone::class);
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

    public function contacts()
    {
        return $this->hasMany(Contact::class);
    }

    
}
