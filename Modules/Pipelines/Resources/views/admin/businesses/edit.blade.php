@extends('layouts.master')

@section('content-header')
    <h1>
        Informacion del Negocio <b>{{$business->name}}</b>
    </h1>
    <ol class="breadcrumb">
        <li><a href="{{ route('dashboard.index') }}"><i class="fa fa-dashboard"></i> {{ trans('core::core.breadcrumb.home') }}</a></li>
        <li><a href="{{ route('admin.pipelines.business.index') }}">{{ trans('pipelines::businesses.title.businesses') }}</a></li>
        <li class="active">{{ trans('pipelines::businesses.title.edit business') }}</li>
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
                    <h2>{{ $business->pipelineBusinesses->last()->pipeline->name }}</h2>
                    <p>Pipeline Actual</p>
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
                    <?php echo \Carbon\Carbon::createFromTimeStamp(strtotime($business->created_at))->diffForHumans() ?>
                </h2>
                <p>Antiguedad del Negocio</p>
                </div>
                <div class="icon">
                <i class="ion ion-bag"></i>
                </div>
                </div>
            </div>

                 <div class="col-md-12">
                        <div class="box box-primary">
                            <div class="box-header">
                            <h4>Valor del negocio  </h4>
                            <b> ${{ isset($business->value) ? $business->value : '-' }} </b> <br>
                            </div>
                        </div>
                    </div>
                    

                    <div class="col-md-12">
                        <div class="box box-primary">
                            <div class="box-header">
                               <h4>Vendedor</h4>
                                <b>Nombre</b>: {{ isset($business->seller) ? $business->seller->first_name.' '.$business->seller->last_name : '-' }} <br>
                                <b>Email</b>: {{ isset($business->seller) ? $business->seller->email : '-' }} <br>
                            </div>
                        </div>
                    </div>



                    @if(isset($business->contact))
                    <div class="col-md-12">
                        <div class="box box-primary">
                            <div class="box-header">
                                <h4>Contacto</h4>
                                <b>Nombre</b> {{$business->contact->name}} <br>
                                <b>Ciudad</b> {{$business->contact->last_name}} <br>
                                <b>Correo</b> {{$business->contact->email}} <br>
                                 <b>Teléfono</b> {{$business->contact->phone}} <br> 
                               <!-- <a href="{{ route('admin.pipelines.contact.edit', [$business->contact->id]) }}" class="btn btn-default btn-flat"><i class="fa fa-pencil"></i></a>-->
                            </div>
                        </div>
                    </div>
                    @endif


                    @if(isset($business->contact->company))
                    <div class="col-md-12">
                        <div class="box box-primary">
                            <div class="box-header">
                                <h4>Empresa</h4>
                                <b>Nombre</b> {{$business->contact->company->name}} <br>
                                <b>País</b> {{$business->contact->company->country->name}} <br>
                                <b>Ciudad</b> {{$business->contact->company->city}} <br>
                                <b>Correo</b> {{$business->contact->company->email}} <br>
                                <b>Teléfono</b> {{$business->contact->company->phone}} <br>
                               <!-- <a href="{{ route('admin.pipelines.company.edit', [$business->contact->company->id]) }}" class="btn btn-default btn-flat"><i class="fa fa-pencil"></i></a>-->
                            </div>
                        </div>
                    </div>
                    @endif


            </div>
    </div>

    <div class="col-md-8">
        <nav>
        <div class="nav nav-tabs" id="nav-tab" role="tablist">

            <a class="nav-item nav-link active el-tabs__item is-top" id="nav-update-tab" data-toggle="tab" href="#nav-update" role="tab" aria-controls="nav-update" aria-selected="false">
                Actualizar Negocio
            </a>

            <a class="nav-item nav-link active el-tabs__item is-top is-active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">
                Agregar Productos
            </a>
            <a class="nav-item nav-link el-tabs__item is-top" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">
                Información 
            </a>
        </div>
        </nav>
        <div class="tab-content" id="nav-tabContent">


            <div class="tab-pane fade" id="nav-update" role="tabpanel" aria-labelledby="nav-update-tab">         
                <div class="row">
                    <div class="col-md-12">
                    {!! Form::model($business, ['route' => ['admin.pipelines.business.update', $business->id], 'method' => 'put']) !!}
                    <div class="row">
                        <div class="col-md-12">
                            <div class="nav-tabs-custom box box-primary">
                                @include('partials.form-tab-headers')
                                <div class="tab-content">
                                    <?php $i = 0; ?>
                                    @foreach (LaravelLocalization::getSupportedLocales() as $locale => $language)
                                        <?php $i++; ?>
                                        <div class="tab-pane {{ locale() == $locale ? 'active' : '' }}" id="tab_{{ $i }}">
                                            @include('pipelines::admin.businesses.partials.edit-fields', ['lang' => $locale])
                                        </div>
                                    @endforeach

                                    <div class="box-footer">
                                        <button type="submit" class="btn btn-primary btn-flat">{{ trans('core::core.button.update') }}</button>
                                    
                                    </div>
                                </div>
                            </div> {{-- end nav-tabs-custom --}}
                        </div>
                    </div>
                    {!! Form::close() !!}
                    </div>
                </div>
            </div>

            <div class="tab-pane fade active in" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">         
                <div class="row">
                    <div class="col-md-12">
                        @include('pipelines::admin.businesses.partials.products', ['lang' => $locale])
                    </div>
                   
                </div>
            </div>
            <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab"> 


                <div class="row">
                    <div class="col-md-12">
                        @include('pipelines::admin.businesses.partials.contacts', ['lang' => $locale])
                    </div>
                </div>
            
                <div class="row">
                    <div class="col-md-12">
                        @include('pipelines::admin.businesses.partials.companies', ['lang' => $locale])
                    </div>
                </div>


            </div>

    </div>




    <div class="el-tabs el-tabs--top">
        <div class="el-tabs__header is-top">
            <div class="el-tabs__nav-wrap is-top">
                <div class="el-tabs__nav-scroll">
                    <div role="tablist" class="el-tabs__nav" style="transform: translateX(0px);">
                        <div class="el-tabs__active-bar is-top" style="width: 33px; transform: translateX(0px);"></div>
                        <div id="tab-0" aria-controls="pane-0" role="tab" tabindex="0" class="el-tabs__item is-top is-active" aria-selected="true">
                            <span class=""> Datos de actividades </span>
                        </div>
                    </div>
                </div>
                <div class="resize-triggers">
                    <div class="expand-trigger">
                        <div style="width: 623px; height: 0;"></div>
                    </div>
                    <div class="contract-trigger"></div>
                </div>
            </div>
        </div>
        <div class="el-tabs__content">
            <div role="tabpanel" id="pane-0" aria-labelledby="tab-0" class="el-tab-pane" style="">
                        @include('pipelines::admin.businesses.partials.pipelines', ['lang' => $locale])
            </div>
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
                    { key: 'b', route: "<?= route('admin.pipelines.business.index') ?>" }
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



