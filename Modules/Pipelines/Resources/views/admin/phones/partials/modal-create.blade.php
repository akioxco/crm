<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#phonesModal">
<i class="fa fa-pencil"></i> {{ trans('pipelines::phones.button.create phone') }}
</button>

<!-- Modal -->
<div class="modal fade" id="phonesModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Crear Teléfono</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      {!! Form::open(['route' => ['admin.pipelines.phone.store'], 'method' => 'post']) !!}
        <div class="row">
            <div class="col-md-12">
                <div class="nav-tabs-custom">
                    @include('partials.form-tab-headers')
                    <div class="tab-content">
                        <?php $i = 0; ?>
                        @foreach (LaravelLocalization::getSupportedLocales() as $locale => $language)
                            <?php $i++; ?>
                            <div class="tab-pane {{ locale() == $locale ? 'active' : '' }}" id="tab_{{ $i }}">
                                @include('pipelines::admin.phones.partials.create-fields', ['lang' => $locale])
                            </div>
                        @endforeach
                        <div class="box-footer">
                            <button type="submit" class="btn btn-primary btn-flat">{{ trans('core::core.button.create') }}</button>
                        </div>
                    </div>
                </div> {{-- end nav-tabs-custom --}}
            </div>
        </div>
        {!! Form::close() !!}
      </div>
    </div>
  </div>
</div>