<?php

namespace Modules\Pipelines\Repositories\Cache;

use Modules\Pipelines\Repositories\PipelineBusinessRepository;
use Modules\Core\Repositories\Cache\BaseCacheDecorator;

class CachePipelineBusinessDecorator extends BaseCacheDecorator implements PipelineBusinessRepository
{
    public function __construct(PipelineBusinessRepository $pipelinebusiness)
    {
        parent::__construct();
        $this->entityName = 'pipelines.pipelinebusinesses';
        $this->repository = $pipelinebusiness;
    }
}
