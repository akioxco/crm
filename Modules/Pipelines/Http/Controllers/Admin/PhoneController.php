<?php

namespace Modules\Pipelines\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Modules\Pipelines\Entities\Phone;
use Modules\Pipelines\Http\Requests\CreatePhoneRequest;
use Modules\Pipelines\Http\Requests\UpdatePhoneRequest;
use Modules\Pipelines\Repositories\PhoneRepository;
use Modules\Core\Http\Controllers\Admin\AdminBaseController;

class PhoneController extends AdminBaseController
{
    /**
     * @var PhoneRepository
     */
    private $phone;

    public function __construct(PhoneRepository $phone)
    {
        parent::__construct();

        $this->phone = $phone;
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        //$phones = $this->phone->all();

        return view('pipelines::admin.phones.index', compact(''));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        return view('pipelines::admin.phones.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  CreatePhoneRequest $request
     * @return Response
     */
    public function store(CreatePhoneRequest $request)
    {
        $this->phone->create($request->all());
        return back()->withInput();
        //return redirect()->route('admin.pipelines.phone.index')
        //    ->withSuccess(trans('core::core.messages.resource created', ['name' => trans('pipelines::phones.title.phones')]));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  Phone $phone
     * @return Response
     */
    public function edit(Phone $phone)
    {
        return view('pipelines::admin.phones.edit', compact('phone'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  Phone $phone
     * @param  UpdatePhoneRequest $request
     * @return Response
     */
    public function update(Phone $phone, UpdatePhoneRequest $request)
    {
        $this->phone->update($phone, $request->all());

        return redirect()->route('admin.pipelines.company.edit', ['company' => $phone->company_id])
            ->withSuccess(trans('core::core.messages.resource updated', ['name' => trans('pipelines::phones.title.phones')]));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  Phone $phone
     * @return Response
     */
    public function destroy(Phone $phone)
    {
        $company_id = $phone->company_id;
        $this->phone->destroy($phone);

        return redirect()->route('admin.pipelines.company.edit', ['company' => $company_id])
        ->withSuccess(trans('core::core.messages.resource updated', ['name' => trans('pipelines::phones.title.phones')]));

        return redirect()->route('admin.pipelines.phone.index')
            ->withSuccess(trans('core::core.messages.resource deleted', ['name' => trans('pipelines::phones.title.phones')]));
    }
}
