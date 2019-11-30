@extends('layouts.master')

@section('content-header')
    <h1>
        {{ trans('pipelines::companies.title.edit company') }}
    </h1>
    <ol class="breadcrumb">
        <li><a href="{{ route('dashboard.index') }}"><i class="fa fa-dashboard"></i> {{ trans('core::core.breadcrumb.home') }}</a></li>
        <li><a href="{{ route('admin.pipelines.company.index') }}">{{ trans('pipelines::companies.title.companies') }}</a></li>
        <li class="active">{{ trans('pipelines::companies.title.edit company') }}</li>
    </ol>
@stop

@section('content')
    {!! Form::model($company, ['route' => ['admin.pipelines.company.update', $company->id], 'method' => 'put']) !!}
    <div class="row">
        <div class="col-md-12">
            <div class="nav-tabs-custom">
                @include('partials.form-tab-headers')
                <div class="tab-content">
                    <?php $i = 0; ?>
                    @foreach (LaravelLocalization::getSupportedLocales() as $locale => $language)
                        <?php $i++; ?>
                        <div class="tab-pane {{ locale() == $locale ? 'active' : '' }}" id="tab_{{ $i }}">
                            @include('pipelines::admin.companies.partials.edit-fields', ['lang' => $locale])
                        </div>
                    @endforeach

                    <div class="box-footer">
                        <button type="submit" class="btn btn-primary btn-flat">{{ trans('core::core.button.update') }}</button>
                        <a class="btn btn-danger pull-right btn-flat" href="{{ route('admin.pipelines.company.index')}}"><i class="fa fa-times"></i> {{ trans('core::core.button.cancel') }}</a>
                    </div>
                </div>
            </div> {{-- end nav-tabs-custom --}}
        </div>
    </div>
    {!! Form::close() !!}

    @include('pipelines::admin.companies.partials.emails', ['lang' => $locale])
    @include('pipelines::admin.companies.partials.phones', ['lang' => $locale])

    <div class="row">


        @if(isset($company->contacts))
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-12">
                    <div class="box box-primary">
                        <div class="box-header">
                            Contactos
                        </div>
                        <div class="box-body">
                        
                        <table class="data-table table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Apellidos</th>
                                <th>Email</th>
                                <th>Negocio</th>
                                <th>{{ trans('core::core.table.created at') }}</th>
                                <th data-sortable="false">{{ trans('core::core.table.actions') }}</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php if (isset($company->contacts)): ?>
                            <?php foreach ($company->contacts as $contact): ?>
                            <tr>
                                <td>
                                    <a href="{{ route('admin.pipelines.contact.edit', [$contact->id]) }}">
                                        {{ $contact->name }}
                                    </a>
                                </td>
                                <td>
                                    {{ $contact->last_name }}
                                </td>
                                <td>
                                    {{ $contact->email }}
                                </td>
                                <td>
                                    {{ isset($contact->company_id) ? $contact->company->name : '-' }}
                                </td>
                                <td>
                                    {{ $contact->created_at }}
                                </td>
                                <td>
                                    <div class="btn-group">
                                        <a href="{{ route('admin.pipelines.contact.edit', [$contact->id]) }}" class="btn btn-default btn-flat"><i class="fa fa-pencil"></i></a>
                                    </div>
                                </td>
                            </tr>
                            <?php endforeach; ?>
                            <?php endif; ?>
                            </tbody>
                        </table>



                        </div>
                    </div>
                </div>
            </div>
        </div>
        @endif


        




    </div>

@stop


@section('footer')
    <a data-toggle="modal" data-target="#keyboardShortcutsModal"><i class="fa fa-keyboard-o"></i></a> &nbsp;
@stop
@section('shortcuts')
    <dl class="dl-horizontal">
        <dt><code>b</code></dt>
        <dd>{{ trans('core::core.back to index') }}</dd>
    </dl>
@stop

@push('js-stack')
    <script type="text/javascript">
        $( document ).ready(function() {
            $(document).keypressAction({
                actions: [
                    { key: 'b', route: "<?= route('admin.pipelines.company.index') ?>" }
                ]
            });
        });
    </script>
    <script>
        $( document ).ready(function() {
            $('input[type="checkbox"].flat-blue, input[type="radio"].flat-blue').iCheck({
                checkboxClass: 'icheckbox_flat-blue',
                radioClass: 'iradio_flat-blue'
            });
        });
    </script>
@endpush
