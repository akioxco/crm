<?php

namespace Modules\Pipelines\Repositories\Cache;

use Modules\Pipelines\Repositories\PhoneRepository;
use Modules\Core\Repositories\Cache\BaseCacheDecorator;

class CachePhoneDecorator extends BaseCacheDecorator implements PhoneRepository
{
    public function __construct(PhoneRepository $phone)
    {
        parent::__construct();
        $this->entityName = 'pipelines.phones';
        $this->repository = $phone;
    }
}
