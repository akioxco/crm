<?php

namespace Modules\Pipelines\Repositories\Cache;

use Modules\Pipelines\Repositories\BusinessRepository;
use Modules\Core\Repositories\Cache\BaseCacheDecorator;

class CacheBusinessDecorator extends BaseCacheDecorator implements BusinessRepository
{
    public function __construct(BusinessRepository $business)
    {
        parent::__construct();
        $this->entityName = 'pipelines.businesses';
        $this->repository = $business;
    }
}
