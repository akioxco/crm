<?php

namespace Modules\Pipelines\Repositories\Cache;

use Modules\Pipelines\Repositories\CompanyRepository;
use Modules\Core\Repositories\Cache\BaseCacheDecorator;

class CacheCompanyDecorator extends BaseCacheDecorator implements CompanyRepository
{
    public function __construct(CompanyRepository $company)
    {
        parent::__construct();
        $this->entityName = 'pipelines.companies';
        $this->repository = $company;
    }
}
