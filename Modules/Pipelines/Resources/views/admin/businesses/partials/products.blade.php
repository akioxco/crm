<div class="row">
    <div class="col-md-12">
    <div class="row">
        <div class="col-xs-12">
            <div class="row">
                <div class="btn-group pull-right" style="margin: 0 15px 15px 0;">
                    @include('pipelines::admin.detailbusinesses.partials.modal-create', ['lang' => $locale])
                </div>
            </div>
            <div class="box box-primary">
                <div class="box-header">
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <div class="table-responsive">
                        <table class="data-table table table-bordered table-hover">
                            <thead>
                            <tr>
                                <td>#</td>
                                <td>Producto</td>
                                <td>Cantidad</td>
                                <th>{{ trans('core::core.table.created at') }}</th>
                                <th data-sortable="false">{{ trans('core::core.table.actions') }}</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php if (isset($business->detailbusinesses)): ?>
                            <?php foreach ($business->detailbusinesses as $detailbusiness): ?>
                            <tr>
                                <td>
                                    {{ $detailbusiness->id }}
                                </td>
                                <td>
                                    <a href="{{ route('admin.pipelines.detailbusiness.edit', [$detailbusiness->id]) }}">
                                        {{ $detailbusiness->product->name }}
                                    </a>
                                </td>
                                <td>
                                    {{ $detailbusiness->quantity }}
                                </td>
                                <td>
                                    {{ $detailbusiness->created_at }}
                                </td>
                                <td>
                                    <div class="btn-group">
                                        <a href="{{ route('admin.pipelines.detailbusiness.edit', [$detailbusiness->id]) }}" class="btn btn-default btn-flat"><i class="fa fa-pencil"></i></a>
                                        <button class="btn btn-danger btn-flat" data-toggle="modal" data-target="#modal-delete-confirmation" data-action-target="{{ route('admin.pipelines.detailbusiness.destroy', [$detailbusiness->id]) }}"><i class="fa fa-trash"></i></button>
                                    </div>
                                </td>
                            </tr>
                            <?php endforeach; ?>
                            <?php endif; ?>
                            </tbody>
                        </table>
                        <!-- /.box-body -->
                    </div>
                </div>
                <!-- /.box -->
            </div>
        </div>
    </div>
    @include('core::partials.delete-modal')
    </div>
</div>