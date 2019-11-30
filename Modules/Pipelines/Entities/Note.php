<?php

namespace Modules\Pipelines\Entities;

use Dimsav\Translatable\Translatable;
use Illuminate\Database\Eloquent\Model;
use Modules\User\Entities\Sentinel\User;

class Note extends Model
{

    protected $table = 'pipelines__notes';
    public $translatedAttributes = [];

    protected $fillable = [
        'note',
        'seller_id',
        'contact_id',
    ];

    public function seller()
    {
        return $this->belongsTo(User::class, 'seller_id');
    }

    public function contact()
    {
        return $this->belongsTo(User::class, 'contact_id');
    }

}
