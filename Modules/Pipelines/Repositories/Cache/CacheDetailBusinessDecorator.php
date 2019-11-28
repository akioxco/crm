<?php

namespace Modules\Pipelines\Repositories\Cache;

use Modules\Pipelines\Repositories\DetailBusinessRepository;
use Modules\Core\Repositories\Cache\BaseCacheDecorator;

class CacheDetailBusinessDecorator extends BaseCacheDecorator implements DetailBusinessRepository
{
    public function __construct(DetailBusinessRepository $detailbusiness)
    {
        parent::__construct();
        $this->entityName = 'pipelines.detailbusinesses';
        $this->repository = $detailbusiness;
    }
}
