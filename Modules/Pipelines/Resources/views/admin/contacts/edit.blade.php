@extends('layouts.master')

@section('content-header')
    <h1>
        {{ trans('pipelines::contacts.title.edit contact') }}
    </h1>
    <ol class="breadcrumb">
        <li><a href="{{ route('dashboard.index') }}"><i class="fa fa-dashboard"></i> {{ trans('core::core.breadcrumb.home') }}</a></li>
        <li><a href="{{ route('admin.pipelines.contact.index') }}">{{ trans('pipelines::contacts.title.contacts') }}</a></li>
        <li class="active">{{ trans('pipelines::contacts.title.edit contact') }}</li>
    </ol>
@stop

@section('content')
<div class="row">
    <div class="col-md-12">
    {!! Form::model($contact, ['route' => ['admin.pipelines.contact.update', $contact->id], 'method' => 'put']) !!}
    <div class="row">
        <div class="col-md-12">
            <div class="nav-tabs-custom">
                @include('partials.form-tab-headers')
                <div class="tab-content">
                    <?php $i = 0; ?>
                    @foreach (LaravelLocalization::getSupportedLocales() as $locale => $language)
                        <?php $i++; ?>
                        <div class="tab-pane {{ locale() == $locale ? 'active' : '' }}" id="tab_{{ $i }}">
                            @include('pipelines::admin.contacts.partials.edit-fields', ['lang' => $locale])
                        </div>
                    @endforeach

                    <div class="box-footer">
                        <button type="submit" class="btn btn-primary btn-flat">{{ trans('core::core.button.update') }}</button>
                        <a class="btn btn-danger pull-right btn-flat" href="{{ route('admin.pipelines.contact.index')}}"><i class="fa fa-times"></i> {{ trans('core::core.button.cancel') }}</a>
                    </div>
                </div>
            </div> {{-- end nav-tabs-custom --}}
        </div>
    </div>
    {!! Form::close() !!}
    </div>

    @if(isset($contact->company))
    <div class="col-md-12">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header">
                        <h3>Empresa</h3>
                        <b>Nombre</b> {{$contact->company->name}} <br>
                        <b>Ciudad</b> {{$contact->company->city}} <br>
                        <b>Correo</b> {{$contact->company->email}} <br>
                        <b>Teléfono</b> {{$contact->company->phone}} <br>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @endif
    
    <div class="col-md-12">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header">
                        <h3>Notas</h3>
                        <div class="direct-chat-msg">
                            <div class="direct-chat-info clearfix">
                                <span class="direct-chat-name pull-left">Vendedor</span>
                                <span class="direct-chat-timestamp pull-right">2019-11-28 17:43:48</span>
                            </div>  
                            <div class="direct-chat-text">
                                Esto es una nota
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    @if(isset($contact->seller))
    <div class="col-md-12">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header">
                        <h3>Responsable</h3>
                        <b>Nombre</b> {{$contact->seller->first_name}} {{$contact->seller->last_name}}<br>
                        <b>Email</b> {{$contact->seller->email}}<br>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @endif

    @if(isset($contact->businesses))
    <div class="col-md-12">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header">
                        <h3>Negocio</h3>
                        

                        <table class="data-table table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Nombre</th>
                                <th>Pipeline</th>
                                <th>Vendedor</th>
                                <th>Valor</th>
                                <th data-sortable="false">{{ trans('core::core.table.actions') }}</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php if (isset($contact->businesses)): ?>
                            <?php foreach ($contact->businesses as $business): ?>
                            <tr>
                                <td>
                                    {{ $business->id }}
                                </td>
                                <td>
                                    <a href="{{ route('admin.pipelines.business.edit', [$business->id]) }}">
                                        {{ $business->name }}
                                    </a>
                                </td>
                                <td>
                                    <span class="badge badge-primary" style="background-color:  {{ $business->pipelineBusinesses->last()->pipeline->color }};">
                                    {{ $business->pipelineBusinesses->last()->pipeline->name }}
                                    </span>
                                </td>
                                <td>
                                    <span class="badge badge-success">
                                        {{ isset($business->seller) ? $business->seller->first_name : '-' }}
                                    </span>
                                </td>
                                <td>
                                    ${{ $business->value }}
                                </td>
                                <td width="100">
                                    <div class="btn-group">
                                        <a href="{{ route('admin.pipelines.business.edit', [$business->id]) }}" class="btn btn-default btn-flat"><i class="fa fa-pencil"></i></a>
                                        
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
                    { key: 'b', route: "<?= route('admin.pipelines.contact.index') ?>" }
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
