<?php if (isset($companies)): ?>
            <div class="box box-primary">
                <div class="box-header">
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <div class="table-responsive">
                        <table class="data-table table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>Empresa</th>
                                <th>Email</th>
                                <th>{{ trans('core::core.table.created at') }}</th>
                                <th data-sortable="false">{{ trans('core::core.table.actions') }}</th>
                            </tr>
                            </thead>
                            <tbody>
                         
                            <?php foreach ($companies as $company): ?>
                            <tr>
                                <td>
                                    {{ $company->name }}
                                </td> 
                                <td>
                                    {{ $company->email }}
                                </td> 
                                <td>
                                    <a href="{{ route('admin.pipelines.company.edit', [$company->id]) }}">
                                        {{ $company->created_at }}
                                    </a>
                                </td>
                                <td>
                                    <div class="btn-group">
                                        <a href="{{ route('admin.pipelines.company.edit', [$company->id]) }}" class="btn btn-default btn-flat"><i class="fa fa-pencil"></i></a>
                                    <!--     <button class="btn btn-danger btn-flat" data-toggle="modal" data-target="#modal-delete-confirmation" data-action-target="{{ route('admin.pipelines.company.destroy', [$company->id]) }}"><i class="fa fa-trash"></i></button> -->
                                    </div>
                                </td>
                            </tr>
                            <?php endforeach; ?>
                          
                            </tbody>
                        </table>
                        <!-- /.box-body -->
                    </div>
                </div>
                <!-- /.box -->
            </div>
    @include('core::partials.delete-modal')
<?php endif; ?>