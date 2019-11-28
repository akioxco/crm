<?php

namespace Modules\Pipelines\Repositories\Cache;

use Modules\Pipelines\Repositories\ContactRepository;
use Modules\Core\Repositories\Cache\BaseCacheDecorator;

class CacheContactDecorator extends BaseCacheDecorator implements ContactRepository
{
    public function __construct(ContactRepository $contact)
    {
        parent::__construct();
        $this->entityName = 'pipelines.contacts';
        $this->repository = $contact;
    }
}
