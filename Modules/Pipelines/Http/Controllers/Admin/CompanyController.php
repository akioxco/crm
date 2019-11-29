<?php

namespace Modules\Pipelines\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Modules\Pipelines\Entities\Company;

use Modules\Pipelines\Entities\Country;
use Modules\Pipelines\Entities\Source;
use Modules\User\Entities\Sentinel\User;

use Modules\Pipelines\Http\Requests\CreateCompanyRequest;
use Modules\Pipelines\Http\Requests\UpdateCompanyRequest;
use Modules\Pipelines\Repositories\CompanyRepository;
use Modules\Core\Http\Controllers\Admin\AdminBaseController;

class CompanyController extends AdminBaseController
{
    /**
     * @var CompanyRepository
     */
    private $company;

    public function __construct(CompanyRepository $company)
    {
        parent::__construct();

        $this->company = $company;
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {

        if(auth()->user()->inRole('admin') || auth()->user()->inRole('qualifier')){
            $companies = Company::all();
        } else {
            $companies = Company::where('seller_id', auth()->user()->id)->get();
        }

        return view('pipelines::admin.companies.index', compact('companies'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        $countries = Country::pluck('name', 'id');
        $sources = Source::pluck('name', 'id');
        $users = User::whereHas('roles', function ($q) {
            $q->where('slug', 'salesman');
        })->pluck('first_name', 'id');

        return view('pipelines::admin.companies.create', compact('countries', 'sources', 'users'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  CreateCompanyRequest $request
     * @return Response
     */
    public function store(CreateCompanyRequest $request)
    {
        $this->company->create($request->all());

        return redirect()->route('admin.pipelines.company.index')
            ->withSuccess(trans('core::core.messages.resource created', ['name' => trans('pipelines::companies.title.companies')]));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  Company $company
     * @return Response
     */
    public function edit(Company $company)
    {
        $countries = Country::pluck('name', 'id');
        $sources = Source::pluck('name', 'id');
        $users = User::whereHas('roles', function ($q) {
            $q->where('slug', 'salesman');
        })->pluck('first_name', 'id');

        return view('pipelines::admin.companies.edit', compact('company', 'countries', 'sources', 'users'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  Company $company
     * @param  UpdateCompanyRequest $request
     * @return Response
     */
    public function update(Company $company, UpdateCompanyRequest $request)
    {
        $this->company->update($company, $request->all());

        return redirect()->route('admin.pipelines.company.index')
            ->withSuccess(trans('core::core.messages.resource updated', ['name' => trans('pipelines::companies.title.companies')]));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  Company $company
     * @return Response
     */
    public function destroy(Company $company)
    {
        $this->company->destroy($company);

        return redirect()->route('admin.pipelines.company.index')
            ->withSuccess(trans('core::core.messages.resource deleted', ['name' => trans('pipelines::companies.title.companies')]));
    }
}
