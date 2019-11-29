<?php

namespace Modules\Pipelines\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Modules\Pipelines\Entities\Pipeline;
use Modules\Pipelines\Http\Requests\CreatePipelineRequest;
use Modules\Pipelines\Http\Requests\UpdatePipelineRequest;
use Modules\Pipelines\Repositories\PipelineRepository;
use Modules\Core\Http\Controllers\Admin\AdminBaseController;

class PipelineController extends AdminBaseController
{
    /**
     * @var PipelineRepository
     */
    private $pipeline;

    public function __construct(PipelineRepository $pipeline)
    {
        parent::__construct();

        $this->pipeline = $pipeline;
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        $pipelines = $this->pipeline->all();

        return view('pipelines::admin.pipelines.index', compact('pipelines'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        return view('pipelines::admin.pipelines.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  CreatePipelineRequest $request
     * @return Response
     */
    public function store(CreatePipelineRequest $request)
    {
        $this->pipeline->create($request->all());

        return redirect()->route('admin.pipelines.pipeline.index')
            ->withSuccess(trans('core::core.messages.resource created', ['name' => trans('pipelines::pipelines.title.pipelines')]));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  Pipeline $pipeline
     * @return Response
     */
    public function edit(Pipeline $pipeline)
    {
        return view('pipelines::admin.pipelines.edit', compact('pipeline'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  Pipeline $pipeline
     * @param  UpdatePipelineRequest $request
     * @return Response
     */
    public function update(Pipeline $pipeline, UpdatePipelineRequest $request)
    {
        $this->pipeline->update($pipeline, $request->all());

        return redirect()->route('admin.pipelines.pipeline.index')
            ->withSuccess(trans('core::core.messages.resource updated', ['name' => trans('pipelines::pipelines.title.pipelines')]));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  Pipeline $pipeline
     * @return Response
     */
    public function destroy(Pipeline $pipeline)
    {
        $this->pipeline->destroy($pipeline);

        return redirect()->route('admin.pipelines.pipeline.index')
            ->withSuccess(trans('core::core.messages.resource deleted', ['name' => trans('pipelines::pipelines.title.pipelines')]));
    }
}
