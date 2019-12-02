<?php

namespace Modules\Pipelines\Entities;

use Illuminate\Database\Eloquent\Model;
use Modules\User\Entities\Sentinel\User;

class Business extends Model
{

    protected $table = 'pipelines__businesses';
    
    protected $fillable = [
        'name',
        'type_id',
        'contact_id',
        'seller_id',
    ];

    public function contact()
    {
        return $this->belongsTo(Contact::class, 'contact_id');
    }

    public function typeBusiness()
    {
        return $this->belongsTo(TypeBusiness::class, 'type_id');
    }

    public function seller()
    {
        return $this->belongsTo(User::class, 'seller_id');
    }

    public function detailBusinesses()
    {
        return $this->hasMany(DetailBusiness::class);
    }

    public function pipelineBusinesses()
    {
        return $this->hasMany(PipelineBusiness::class);
    }

    public function getValueAttribute()
    {
        $value = 0;
        foreach($this->detailBusinesses as $detailBusiness){
            $value = $value + $detailBusiness->product->price * $detailBusiness->quantity;
        }
        return $value;
    }

    public function getStatusAttribute (){
        return $this->pipelineBusinesses->last()->pipeline->name;
    }
}
