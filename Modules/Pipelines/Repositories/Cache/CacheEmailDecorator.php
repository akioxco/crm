<?php

namespace Modules\Pipelines\Repositories\Cache;

use Modules\Pipelines\Repositories\EmailRepository;
use Modules\Core\Repositories\Cache\BaseCacheDecorator;

class CacheEmailDecorator extends BaseCacheDecorator implements EmailRepository
{
    public function __construct(EmailRepository $email)
    {
        parent::__construct();
        $this->entityName = 'pipelines.emails';
        $this->repository = $email;
    }
}
