<?php

namespace Modules\Pipelines\Repositories\Cache;

use Modules\Pipelines\Repositories\ProductRepository;
use Modules\Core\Repositories\Cache\BaseCacheDecorator;

class CacheProductDecorator extends BaseCacheDecorator implements ProductRepository
{
    public function __construct(ProductRepository $product)
    {
        parent::__construct();
        $this->entityName = 'pipelines.products';
        $this->repository = $product;
    }
}
