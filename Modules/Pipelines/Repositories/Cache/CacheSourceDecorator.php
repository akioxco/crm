<?php

namespace Modules\Pipelines\Repositories\Cache;

use Modules\Pipelines\Repositories\SourceRepository;
use Modules\Core\Repositories\Cache\BaseCacheDecorator;

class CacheSourceDecorator extends BaseCacheDecorator implements SourceRepository
{
    public function __construct(SourceRepository $source)
    {
        parent::__construct();
        $this->entityName = 'pipelines.sources';
        $this->repository = $source;
    }
}
