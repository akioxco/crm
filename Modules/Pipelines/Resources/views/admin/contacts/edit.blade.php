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


    <div class="col-md-4">

         <nav>
            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                <a class="nav-item nav-link el-tabs__item is-top" id="nav-tab" data-toggle="tab" href="#" role="tab" aria-controls="nav-contact" aria-selected="false">
                    
                </a>
            </div>
        </nav>

        <div class="row">

        <div class="col-md-12">
            <div class="small-box bg-green">
                <div class="inner">
                    <h2> {{$contact->name}}  {{$contact->last_name}} </h2>
                    <p> Nombre del contacto</p>
                </div>
                <div class="icon">
                    <i class="ion ion-stats-bars"></i>
                </div>
            </div>
        </div>

        <div class="col-md-12"> 
            <div class="small-box bg-aqua">
                    <div class="inner">
                        <h2>
                            <?php echo \Carbon\Carbon::createFromTimeStamp(strtotime($contact->created_at))->diffForHumans() ?>
                        </h2>
                        <p> Contacto creado </p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-bag"></i>
                    </div>
            </div>
        </div>
      


            @if(isset($contact->name))
                <div class="col-md-12">
                    <div class="box box-primary">
                        <div class="box-header">
                            <h3>Datos del contacto</h3>
                            <b>Nombre</b> {{$contact->name}} <br>
                            <b>Apellidos</b> {{$contact->last_name}} <br>
                            <b>Correo</b> {{$contact->email}} <br>
                            <b>Teléfono</b> {{$contact->phone}} <br> 
                        </div>
                    </div>
                </div>
            @endif

            @if(isset($contact->company))
                    <div class="col-md-12">
                        <div class="box box-primary">
                            <div class="box-header">
                                <h3>Empresa</h3>
                                <b>Nombre</b> {{$contact->company->name}} <br>
                                <b>País</b> {{$contact->company->country->name}} <br>
                                <b>Ciudad</b> {{$contact->company->city}} <br>
                                <b>Correo</b> {{$contact->company->email}} <br>
                                <b>Teléfono</b> {{$contact->company->phone}} <br>
                                <a href="{{ route('admin.pipelines.company.edit', [$contact->company->id]) }}" class="btn btn-default btn-flat"><i class="fa fa-pencil"></i></a>
                            </div>
                        </div>
                    </div>
            @endif

            @if(isset($contact->seller))
                    <div class="col-md-12">
                        <div class="box box-primary">
                            <div class="box-header">
                                <h3>Responsable</h3>
                                <b>Nombre</b> {{$contact->seller->first_name}} {{$contact->seller->last_name}}<br>
                                <b>Email</b> {{$contact->seller->email}}<br>
                                <!-- <a href="{{ route('admin.user.user.edit', [$contact->seller->id]) }}" class="btn btn-default btn-flat"><i class="fa fa-pencil"></i></a> -->
                            </div>
                        </div>
                    </div>
            @endif

        </div>


    </div>


    <div class="col-md-8">

        <nav>
            <div class="nav nav-tabs" id="nav-tab" role="tablist">

                <a class="nav-item nav-link el-tabs__item is-top" id="nav-update-tab" data-toggle="tab" href="#nav-update" role="tab" aria-controls="nav-update" aria-selected="false">
                    Actualizar datos del contacto
                </a>

                <a class="nav-item nav-link active el-tabs__item is-top is-active" id="nav-notas-tab" data-toggle="tab" href="#nav-notas" role="tab" aria-controls="nav-notas" aria-selected="true">
                   Notas
                </a>
                <a class="nav-item nav-link el-tabs__item is-top" id="nav-negocio-tab" data-toggle="tab" href="#nav-negocio" role="tab" aria-controls="nav-negocio" aria-selected="false">
                    Negocios 
                </a>
            </div>
        </nav>
        <div class="tab-content" id="nav-tabContent">


            <div class="tab-pane fade" id="nav-update" role="tabpanel" aria-labelledby="nav-update-tab">   
              
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

  

            <div class="tab-pane fade active in" id="nav-notas" role="tabpanel" aria-labelledby="nav-notas-tab"> 

                     <div class="row">
                        <div class="col-md-12">
                            <div class="box box-primary">
                                <div class="box-header">
                                    

                                    <div>
                                        {!! Form::open(['route' => ['admin.pipelines.note.store'], 'method' => 'post']) !!}
                                            @editor('note')
                                            <div style="display:none">
                                                {!! Form::number('contact_id', $contact->id) !!}
                                            </div>
                                            <br>
                                            <button type="submit" class="btn btn-primary btn-flat pull-right">{{ trans('core::core.button.create') }}</button>
                                            <br>
                                        {!! Form::close() !!}
                                    </div>
                                    <br>


                                        @if(isset($contact->notes))
                                        @foreach($contact->notes as $note)
                                        <div class="direct-chat-msg">
                                            <div class="direct-chat-info clearfix">
                                                <span class="direct-chat-name pull-left">{{$note->seller->first_name}} {{$note->seller->last_name}}</span>
                                                <span class="direct-chat-timestamp pull-right">{{$note->created_at}}</span>
                                            </div>  
                                            <div class="direct-chat-text" style="margin:0px 0 0 0px">
                                                {!!  $note->note  !!}
                                            </div>
                                        </div>
                                        @endforeach
                                        @endif


                                </div>
                            </div>
                        </div>
                    </div>
            </div>

            <div class="tab-pane fade" id="nav-negocio" role="tabpanel" aria-labelledby="nav-negocio-tab"> 
            
            @if(isset($contact->businesses))
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
            @endif

</div>



   
    </div>       

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


