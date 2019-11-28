<?php

namespace Modules\Pipelines\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Modules\Pipelines\Entities\DetailBusiness;
use Modules\Pipelines\Http\Requests\CreateDetailBusinessRequest;
use Modules\Pipelines\Http\Requests\UpdateDetailBusinessRequest;
use Modules\Pipelines\Repositories\DetailBusinessRepository;
use Modules\Core\Http\Controllers\Admin\AdminBaseController;

class DetailBusinessController extends AdminBaseController
{
    /**
     * @var DetailBusinessRepository
     */
    private $detailbusiness;

    public function __construct(DetailBusinessRepository $detailbusiness)
    {
        parent::__construct();

        $this->detailbusiness = $detailbusiness;
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        //$detailbusinesses = $this->detailbusiness->all();

        return view('pipelines::admin.detailbusinesses.index', compact(''));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        return view('pipelines::admin.detailbusinesses.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  CreateDetailBusinessRequest $request
     * @return Response
     */
    public function store(CreateDetailBusinessRequest $request)
    {
        $this->detailbusiness->create($request->all());
        return back()->withInput();
        return redirect()->route('admin.pipelines.detailbusiness.index')
            ->withSuccess(trans('core::core.messages.resource created', ['name' => trans('pipelines::detailbusinesses.title.detailbusinesses')]));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  DetailBusiness $detailbusiness
     * @return Response
     */
    public function edit(DetailBusiness $detailbusiness)
    {
        return view('pipelines::admin.detailbusinesses.edit', compact('detailbusiness'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  DetailBusiness $detailbusiness
     * @param  UpdateDetailBusinessRequest $request
     * @return Response
     */
    public function update(DetailBusiness $detailbusiness, UpdateDetailBusinessRequest $request)
    {
        $this->detailbusiness->update($detailbusiness, $request->all());
        return back()->withInput();
        return redirect()->route('admin.pipelines.detailbusiness.index')
            ->withSuccess(trans('core::core.messages.resource updated', ['name' => trans('pipelines::detailbusinesses.title.detailbusinesses')]));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  DetailBusiness $detailbusiness
     * @return Response
     */
    public function destroy(DetailBusiness $detailbusiness)
    {
        $this->detailbusiness->destroy($detailbusiness);
        return back()->withInput();
        return redirect()->route('admin.pipelines.detailbusiness.index')
            ->withSuccess(trans('core::core.messages.resource deleted', ['name' => trans('pipelines::detailbusinesses.title.detailbusinesses')]));
    }
}
