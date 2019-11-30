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
    <div class="col-md-8">
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
    <div class="col-md-4">
        <div class="row">

        <div class="col-md-12">
        <div class="small-box bg-green">
            <div class="inner">
              <h3>{{ $business->pipelineBusinesses->last()->pipeline->name }}</h3>
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
              <h3>
                <?php echo \Carbon\Carbon::createFromTimeStamp(strtotime($business->created_at))->diffForHumans() ?>
              </h3>
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
                        <b>VENDEDOR</b> <br>
                        <b>Nombre</b>: {{ isset($business->seller) ? $business->seller->first_name.' '.$business->seller->last_name : '-' }} <br>
                        <b>Email</b>: {{ isset($business->seller) ? $business->seller->email : '-' }} <br>
                    </div>
                </div>
            </div>

            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header">
                        <b>VALOR DEL NEGOCIO</b> <br>
                        ${{ isset($business->value) ? $business->value : '-' }} <br>
                    </div>
                </div>
            </div>

            


        </div>
    </div>
</div>

    <div class="row">
        <div class="col-md-12">
            @include('pipelines::admin.businesses.partials.products', ['lang' => $locale])
        </div>
    </div>


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

    <div class="row">
        <div class="col-md-12">
            @include('pipelines::admin.businesses.partials.pipelines', ['lang' => $locale])
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
