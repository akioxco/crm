<?php

namespace Modules\Pipelines\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Modules\Pipelines\Entities\Email;
use Modules\Pipelines\Http\Requests\CreateEmailRequest;
use Modules\Pipelines\Http\Requests\UpdateEmailRequest;
use Modules\Pipelines\Repositories\EmailRepository;
use Modules\Core\Http\Controllers\Admin\AdminBaseController;

class EmailController extends AdminBaseController
{
    /**
     * @var EmailRepository
     */
    private $email;

    public function __construct(EmailRepository $email)
    {
        parent::__construct();

        $this->email = $email;
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        //$emails = $this->email->all();

        return view('pipelines::admin.emails.index', compact(''));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        return view('pipelines::admin.emails.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  CreateEmailRequest $request
     * @return Response
     */
    public function store(CreateEmailRequest $request)
    {
        $this->email->create($request->all());
        return back()->withInput();
        return redirect()->route('admin.pipelines.email.index')
            ->withSuccess(trans('core::core.messages.resource created', ['name' => trans('pipelines::emails.title.emails')]));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  Email $email
     * @return Response
     */
    public function edit(Email $email)
    {
        return view('pipelines::admin.emails.edit', compact('email'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  Email $email
     * @param  UpdateEmailRequest $request
     * @return Response
     */
    public function update(Email $email, UpdateEmailRequest $request)
    {
        $this->email->update($email, $request->all());
    
        return redirect()->route('admin.pipelines.company.edit', ['company' => $email->company_id])
            ->withSuccess(trans('core::core.messages.resource updated', ['name' => trans('pipelines::emails.title.emails')]));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  Email $email
     * @return Response
     */
    public function destroy(Email $email)
    {
        $this->email->destroy($email);
        return back()->withInput();
        return redirect()->route('admin.pipelines.email.index')
            ->withSuccess(trans('core::core.messages.resource deleted', ['name' => trans('pipelines::emails.title.emails')]));
    }
}
