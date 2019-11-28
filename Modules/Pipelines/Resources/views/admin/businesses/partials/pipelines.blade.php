<div class="row">
    <div class="col-md-12">
    
    <div class="row">
        <div class="col-xs-12">
            <div class="row">
                <div class="btn-group pull-right" style="margin: 0 15px 15px 0;">
                @include('pipelines::admin.pipelinebusinesses.partials.modal-create', ['lang' => $locale])
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
                                <th>#</th>
                                <th>Pipeline</th>
                                <th>Comentario</th>
                                <th>Fecha</th>
                                <th>{{ trans('core::core.table.created at') }}</th>
                                <th data-sortable="false">{{ trans('core::core.table.actions') }}</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php if (isset($business->pipelinebusinesses)): ?>
                            <?php foreach ($business->pipelinebusinesses as $pipelinebusiness): ?>
                            <tr>
                                <td>
                                    {{ $pipelinebusiness->id }}
                                </td>
                                <td>
                                    {{ $pipelinebusiness->pipeline->name }}
                                </td>
                                <td>
                                    {{ $pipelinebusiness->description ? $pipelinebusiness->description : '-' }}
                                </td>
                                <td>
                                    {{ $pipelinebusiness->date }}
                                </td>
                                <td>
                                    <a href="{{ route('admin.pipelines.pipelinebusiness.edit', [$pipelinebusiness->id]) }}">
                                        {{ $pipelinebusiness->created_at }}
                                    </a>
                                </td>
                                <td>
                                    <div class="btn-group">
                                        <a href="{{ route('admin.pipelines.pipelinebusiness.edit', [$pipelinebusiness->id]) }}" class="btn btn-default btn-flat"><i class="fa fa-pencil"></i></a>
                                        <button class="btn btn-danger btn-flat" data-toggle="modal" data-target="#modal-delete-confirmation" data-action-target="{{ route('admin.pipelines.pipelinebusiness.destroy', [$pipelinebusiness->id]) }}"><i class="fa fa-trash"></i></button>
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