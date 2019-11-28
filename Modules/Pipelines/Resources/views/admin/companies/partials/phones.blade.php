<div class="row">
    <div class="btn-group pull-right" style="margin: 0 15px 15px 0;">
        @include('pipelines::admin.phones.partials.modal-create', ['lang' => $locale])
    </div>
</div>


<div class="row">
    <div class="col-md-12">
        <div class="nav-tabs-custom">
            <div class="tab-content">
                <div class="box-body">
                    <div class="table-responsive">
                    <table class="data-table table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>Teléfono</th>
                                <th data-sortable="false">{{ trans('core::core.table.actions') }}</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php if (isset($company->phones)): ?>
                            <?php foreach ($company->phones as $phone): ?>
                            <tr>
                                <td>
                                    <a href="{{ route('admin.pipelines.phone.edit', [$phone->id]) }}">
                                        {{ $phone->phone }}
                                    </a>
                                </td>
                                <td>
                                    <div class="btn-group">
                                        <a href="{{ route('admin.pipelines.phone.edit', [$phone->id]) }}" class="btn btn-default btn-flat"><i class="fa fa-pencil"></i></a>
                                        <button class="btn btn-danger btn-flat" data-toggle="modal" data-target="#modal-delete-confirmation" data-action-target="{{ route('admin.pipelines.phone.destroy', [$phone->id]) }}"><i class="fa fa-trash"></i></button>
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
    @include('core::partials.delete-modal')
</div>