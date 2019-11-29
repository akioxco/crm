<?php

namespace Modules\Pipelines\Repositories\Cache;

use Modules\Pipelines\Repositories\NoteRepository;
use Modules\Core\Repositories\Cache\BaseCacheDecorator;

class CacheNoteDecorator extends BaseCacheDecorator implements NoteRepository
{
    public function __construct(NoteRepository $note)
    {
        parent::__construct();
        $this->entityName = 'pipelines.notes';
        $this->repository = $note;
    }
}
