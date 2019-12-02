<?php

namespace Modules\Pipelines\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Modules\Pipelines\Entities\Business;
use Modules\Pipelines\Entities\TypeBusiness;
use Modules\Pipelines\Entities\Company;
use Modules\Pipelines\Entities\Contact;
use Modules\User\Entities\Sentinel\User;
use Modules\Pipelines\Entities\Product;
use Modules\Pipelines\Entities\Pipeline;
use Modules\Pipelines\Http\Requests\CreateBusinessRequest;
use Modules\Pipelines\Http\Requests\UpdateBusinessRequest;
use Modules\Pipelines\Repositories\BusinessRepository;
use Modules\Core\Http\Controllers\Admin\AdminBaseController;
use Modules\Pipelines\Transformers\BusinessTransformer;

class BusinessController extends AdminBaseController
{
    /**
     * @var BusinessRepository
     */
    private $business;

    public function __construct(BusinessRepository $business)
    {
        parent::__construct();

        $this->business = $business;
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        if(auth()->user()->inRole('admin') || auth()->user()->inRole('qualifier')){
            $businesses = Business::all();
        } else {
            $businesses = Business::where('seller_id', auth()->user()->id)->get();
        }

        $businessesJson = json_encode(BusinessTransformer::collection($businesses));
        //return json_encode($businessesJson);
        $pipelines = Pipeline::pluck('name');

        return view('pipelines::admin.businesses.index', compact('businesses', 'pipelines', 'businessesJson'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        $typebusiness = TypeBusiness::pluck('name', 'id');
        $contacts = Contact::pluck('name', 'id');
        $users = User::whereHas('roles', function ($q) {
            $q->where('slug', 'salesman');
        })->pluck('first_name', 'id');
        return view('pipelines::admin.businesses.create', compact('typebusiness', 'contacts', 'users'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  CreateBusinessRequest $request
     * @return Response
     */
    public function store(CreateBusinessRequest $request)
    {
        $this->business->create($request->all());

        return redirect()->route('admin.pipelines.business.index')
            ->withSuccess(trans('core::core.messages.resource created', ['name' => trans('pipelines::businesses.title.businesses')]));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  Business $business
     * @return Response
     */
    public function edit(Business $business)
    {
        $typebusiness = TypeBusiness::pluck('name', 'id');

        $contacts = Contact::pluck('name', 'id');
      
        $contactList = Contact::where('id', $business['contact_id'])->get();

        $companies = Company::where('id', $contactList[0]['company_id'])->get();

        $users = User::whereHas('roles', function ($q) {
            $q->where('slug', 'salesman');
        })->pluck('first_name', 'id');


        $businesses = Business::pluck('name', 'id');
        $products = Product::pluck('name', 'id');
        $pipelines = Pipeline::pluck('name', 'id');

        return view('pipelines::admin.businesses.edit', compact('business', 'typebusiness', 'contacts', 'users', 'businesses', 'products', 'pipelines', 'contactList', 'companies' ));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  Business $business
     * @param  UpdateBusinessRequest $request
     * @return Response
     */
    public function update(Business $business, UpdateBusinessRequest $request)
    {
        $this->business->update($business, $request->all());

        return redirect()->route('admin.pipelines.business.index')
            ->withSuccess(trans('core::core.messages.resource updated', ['name' => trans('pipelines::businesses.title.businesses')]));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  Business $business
     * @return Response
     */
    public function destroy(Business $business)
    {
        $this->business->destroy($business);

        return redirect()->route('admin.pipelines.business.index')
            ->withSuccess(trans('core::core.messages.resource deleted', ['name' => trans('pipelines::businesses.title.businesses')]));
    }
}
