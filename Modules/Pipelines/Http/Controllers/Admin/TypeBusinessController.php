<?php

namespace Modules\Pipelines\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Modules\Pipelines\Entities\TypeBusiness;
use Modules\Pipelines\Http\Requests\CreateTypeBusinessRequest;
use Modules\Pipelines\Http\Requests\UpdateTypeBusinessRequest;
use Modules\Pipelines\Repositories\TypeBusinessRepository;
use Modules\Core\Http\Controllers\Admin\AdminBaseController;

class TypeBusinessController extends AdminBaseController
{
    /**
     * @var TypeBusinessRepository
     */
    private $typebusiness;

    public function __construct(TypeBusinessRepository $typebusiness)
    {
        parent::__construct();

        $this->typebusiness = $typebusiness;
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        $typebusinesses = $this->typebusiness->all();

        return view('pipelines::admin.typebusinesses.index', compact('typebusinesses'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        return view('pipelines::admin.typebusinesses.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  CreateTypeBusinessRequest $request
     * @return Response
     */
    public function store(CreateTypeBusinessRequest $request)
    {
        $this->typebusiness->create($request->all());

        return redirect()->route('admin.pipelines.typebusiness.index')
            ->withSuccess(trans('core::core.messages.resource created', ['name' => trans('pipelines::typebusinesses.title.typebusinesses')]));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  TypeBusiness $typebusiness
     * @return Response
     */
    public function edit(TypeBusiness $typebusiness)
    {
        return view('pipelines::admin.typebusinesses.edit', compact('typebusiness'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  TypeBusiness $typebusiness
     * @param  UpdateTypeBusinessRequest $request
     * @return Response
     */
    public function update(TypeBusiness $typebusiness, UpdateTypeBusinessRequest $request)
    {
        $this->typebusiness->update($typebusiness, $request->all());

        return redirect()->route('admin.pipelines.typebusiness.index')
            ->withSuccess(trans('core::core.messages.resource updated', ['name' => trans('pipelines::typebusinesses.title.typebusinesses')]));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  TypeBusiness $typebusiness
     * @return Response
     */
    public function destroy(TypeBusiness $typebusiness)
    {
        $this->typebusiness->destroy($typebusiness);

        return redirect()->route('admin.pipelines.typebusiness.index')
            ->withSuccess(trans('core::core.messages.resource deleted', ['name' => trans('pipelines::typebusinesses.title.typebusinesses')]));
    }
}
