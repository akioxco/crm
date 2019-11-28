<?php

namespace Modules\Pipelines\Repositories\Cache;

use Modules\Pipelines\Repositories\PipelineRepository;
use Modules\Core\Repositories\Cache\BaseCacheDecorator;

class CachePipelineDecorator extends BaseCacheDecorator implements PipelineRepository
{
    public function __construct(PipelineRepository $pipeline)
    {
        parent::__construct();
        $this->entityName = 'pipelines.pipelines';
        $this->repository = $pipeline;
    }
}
