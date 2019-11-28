<?php

namespace Modules\Pipelines\Entities;

use Dimsav\Translatable\Translatable;
use Illuminate\Database\Eloquent\Model;

class PipelineBusiness extends Model
{

    protected $table = 'pipelines__pipelinebusinesses';
    
    protected $fillable = [
        'business_id',
        'pipeline_id',
        'description',
        'date',
    ];

    public function business()
    {
        return $this->belongsTo(Business::class, 'business_id');
    }

    public function pipeline()
    {
        return $this->belongsTo(Pipeline::class, 'pipeline_id');
    }
}
