<?php

namespace Modules\Pipelines\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Modules\Pipelines\Entities\Note;
use Modules\Pipelines\Http\Requests\CreateNoteRequest;
use Modules\Pipelines\Http\Requests\UpdateNoteRequest;
use Modules\Pipelines\Repositories\NoteRepository;
use Modules\Core\Http\Controllers\Admin\AdminBaseController;


use Modules\Pipelines\Entities\Source;
use Modules\User\Entities\Sentinel\User;



class NoteController extends AdminBaseController
{
    /**
     * @var NoteRepository
     */
    private $note;

    public function __construct(NoteRepository $note)
    {
        parent::__construct();

        $this->note = $note;
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        $notes = $this->note->all();

        return view('pipelines::admin.notes.index', compact('notes'));

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        return view('pipelines::admin.notes.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  CreateNoteRequest $request
     * @return Response
     */
    public function store(CreateNoteRequest $request)
    {   
        $request['seller_id'] = auth()->user()->id;
        $this->note->create($request->all());

        return redirect()->route('admin.pipelines.note.index')
            ->withSuccess(trans('core::core.messages.resource created', ['name' => trans('pipelines::notes.title.notes')]));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  Note $note
     * @return Response
     */
    public function edit(Note $note)
    {
        return view('pipelines::admin.notes.edit', compact('note'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  Note $note
     * @param  UpdateNoteRequest $request
     * @return Response
     */
    public function update(Note $note, UpdateNoteRequest $request)
    {
        $this->note->update($note, $request->all());

        return redirect()->route('admin.pipelines.note.index')
            ->withSuccess(trans('core::core.messages.resource updated', ['name' => trans('pipelines::notes.title.notes')]));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  Note $note
     * @return Response
     */
    public function destroy(Note $note)
    {
        $this->note->destroy($note);

        return redirect()->route('admin.pipelines.note.index')
            ->withSuccess(trans('core::core.messages.resource deleted', ['name' => trans('pipelines::notes.title.notes')]));
    }
}
