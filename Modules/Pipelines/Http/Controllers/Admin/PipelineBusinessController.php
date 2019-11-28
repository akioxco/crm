<?php

namespace Modules\Pipelines\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Modules\Pipelines\Entities\PipelineBusiness;
use Modules\Pipelines\Http\Requests\CreatePipelineBusinessRequest;
use Modules\Pipelines\Http\Requests\UpdatePipelineBusinessRequest;
use Modules\Pipelines\Repositories\PipelineBusinessRepository;
use Modules\Core\Http\Controllers\Admin\AdminBaseController;

class PipelineBusinessController extends AdminBaseController
{
    /**
     * @var PipelineBusinessRepository
     */
    private $pipelinebusiness;

    public function __construct(PipelineBusinessRepository $pipelinebusiness)
    {
        parent::__construct();

        $this->pipelinebusiness = $pipelinebusiness;
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        $pipelinebusinesses = $this->pipelinebusiness->all();

        return view('pipelines::admin.pipelinebusinesses.index', compact('pipelinebusinesses'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        return view('pipelines::admin.pipelinebusinesses.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  CreatePipelineBusinessRequest $request
     * @return Response
     */
    public function store(CreatePipelineBusinessRequest $request)
    {
        $this->pipelinebusiness->create($request->all());
        return back()->withInput();
        return redirect()->route('admin.pipelines.pipelinebusiness.index')
            ->withSuccess(trans('core::core.messages.resource created', ['name' => trans('pipelines::pipelinebusinesses.title.pipelinebusinesses')]));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  PipelineBusiness $pipelinebusiness
     * @return Response
     */
    public function edit(PipelineBusiness $pipelinebusiness)
    {
        return view('pipelines::admin.pipelinebusinesses.edit', compact('pipelinebusiness'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  PipelineBusiness $pipelinebusiness
     * @param  UpdatePipelineBusinessRequest $request
     * @return Response
     */
    public function update(PipelineBusiness $pipelinebusiness, UpdatePipelineBusinessRequest $request)
    {
        $this->pipelinebusiness->update($pipelinebusiness, $request->all());
        return back()->withInput();
        return redirect()->route('admin.pipelines.pipelinebusiness.index')
            ->withSuccess(trans('core::core.messages.resource updated', ['name' => trans('pipelines::pipelinebusinesses.title.pipelinebusinesses')]));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  PipelineBusiness $pipelinebusiness
     * @return Response
     */
    public function destroy(PipelineBusiness $pipelinebusiness)
    {
        $this->pipelinebusiness->destroy($pipelinebusiness);
        return back()->withInput();
        return redirect()->route('admin.pipelines.pipelinebusiness.index')
            ->withSuccess(trans('core::core.messages.resource deleted', ['name' => trans('pipelines::pipelinebusinesses.title.pipelinebusinesses')]));
    }
}
