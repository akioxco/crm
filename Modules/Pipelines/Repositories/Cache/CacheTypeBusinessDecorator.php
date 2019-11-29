<?php

namespace Modules\Pipelines\Repositories\Cache;

use Modules\Pipelines\Repositories\TypeBusinessRepository;
use Modules\Core\Repositories\Cache\BaseCacheDecorator;

class CacheTypeBusinessDecorator extends BaseCacheDecorator implements TypeBusinessRepository
{
    public function __construct(TypeBusinessRepository $typebusiness)
    {
        parent::__construct();
        $this->entityName = 'pipelines.typebusinesses';
        $this->repository = $typebusiness;
    }
}
