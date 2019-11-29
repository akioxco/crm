<?php

namespace Modules\Pipelines\Repositories\Cache;

use Modules\Pipelines\Repositories\CountryRepository;
use Modules\Core\Repositories\Cache\BaseCacheDecorator;

class CacheCountryDecorator extends BaseCacheDecorator implements CountryRepository
{
    public function __construct(CountryRepository $country)
    {
        parent::__construct();
        $this->entityName = 'pipelines.countries';
        $this->repository = $country;
    }
}
