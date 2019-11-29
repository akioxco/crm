<?php

namespace Modules\Pipelines\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Modules\Pipelines\Entities\Contact;
use Modules\Pipelines\Entities\Company;
use Modules\Pipelines\Http\Requests\CreateContactRequest;
use Modules\Pipelines\Http\Requests\UpdateContactRequest;
use Modules\Pipelines\Repositories\ContactRepository;
use Modules\Core\Http\Controllers\Admin\AdminBaseController;
use Modules\Pipelines\Entities\Country;
use Modules\Pipelines\Entities\Source;
use Modules\User\Entities\Sentinel\User;

use Modules\Pipelines\Entities\Business;
use Modules\Pipelines\Entities\PipelineBusiness;

class ContactController extends AdminBaseController
{
    /**
     * @var ContactRepository
     */
    private $contact;

    public function __construct(ContactRepository $contact)
    {
        parent::__construct();

        $this->contact = $contact;
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        

        if(auth()->user()->inRole('admin') || auth()->user()->inRole('qualifier')){
            $contacts = Contact::all();
        } else {
            $contacts = Contact::where('seller_id', auth()->user()->id)->get();
        }

        return view('pipelines::admin.contacts.index', compact('contacts'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        $companies = Company::pluck('name', 'id');
        $countries = Country::pluck('name', 'id');
        $sources = Source::pluck('name', 'id');
        $users = User::pluck('first_name', 'id');

        return view('pipelines::admin.contacts.create', compact('companies', 'countries', 'sources', 'users'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  CreateContactRequest $request
     * @return Response
     */
    public function store(CreateContactRequest $request)
    {
        $contact = $this->contact->create($request->all());

        $business = Business::create([
            'name' => $request['name'].' '.$request['last_name'],
            'contact_id' => $contact->id,
            'seller_id' => isset($request['seller_id']) ? $request['seller_id'] : null,
        ]);

        PipelineBusiness::create([
            'business_id' => $business->id,
            'pipeline_id' => 1 // sin contactar 
        ]);

        return redirect()->route('admin.pipelines.contact.index')
            ->withSuccess(trans('core::core.messages.resource created', ['name' => trans('pipelines::contacts.title.contacts')]));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  Contact $contact
     * @return Response
     */
    public function edit(Contact $contact)
    {
        $companies = Company::pluck('name', 'id');
        $countries = Country::pluck('name', 'id');
        $sources = Source::pluck('name', 'id');
        $users = User::pluck('first_name', 'id');

        return view('pipelines::admin.contacts.edit', compact('contact', 'companies', 'countries', 'sources', 'users'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  Contact $contact
     * @param  UpdateContactRequest $request
     * @return Response
     */
    public function update(Contact $contact, UpdateContactRequest $request)
    {
        $this->contact->update($contact, $request->all());

        return redirect()->route('admin.pipelines.contact.index')
            ->withSuccess(trans('core::core.messages.resource updated', ['name' => trans('pipelines::contacts.title.contacts')]));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  Contact $contact
     * @return Response
     */
    public function destroy(Contact $contact)
    {
        $this->contact->destroy($contact);

        return redirect()->route('admin.pipelines.contact.index')
            ->withSuccess(trans('core::core.messages.resource deleted', ['name' => trans('pipelines::contacts.title.contacts')]));
    }
}
