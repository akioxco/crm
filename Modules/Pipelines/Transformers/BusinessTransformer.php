<?php

namespace Modules\Pipelines\Transformers;

use Illuminate\Http\Resources\Json\Resource;

class BusinessTransformer extends Resource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'typeName' => $this->typeBusiness['name'],
            'contactoName' => $this->contact['name'],
            'seller' => $this->seller['first_name'].' '.$this->seller['last_name'],
            'status' => $this->status,
        ];
    }
}
