<?php if (isset($contactList)): ?>
            <div class="box box-primary">
                <div class="box-header">
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <div class="table-responsive">
                        <table class="data-table table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>Contacto</th>
                                <th>Apellidos</th>
                                <th>Email</th>
                                <th>{{ trans('core::core.table.created at') }}</th>
                                <th data-sortable="false">{{ trans('core::core.table.actions') }}</th>
                            </tr>
                            </thead>
                            <tbody>
                          
                            <?php foreach ($contactList as $contact): ?>
                            <tr>
                                <td>
                                    {{ $contact->name }}
                                </td>
                                <td>
                                    {{ $contact->last_name }}
                                </td>
                                <td>
                                    {{ $contact->email }}
                                </td>
                                <td>
                                    <a href="{{ route('admin.pipelines.contact.edit', [$contact->id]) }}">
                                        {{ $contact->created_at }}
                                    </a>
                                </td>
                                <td>
                                    <div class="btn-group">
                                        <a href="{{ route('admin.pipelines.contact.edit', [$contact->id]) }}" class="btn btn-default btn-flat"><i class="fa fa-pencil"></i></a>
                                       <!-- <button class="btn btn-danger btn-flat" data-toggle="modal" data-target="#modal-delete-confirmation" data-action-target="{{ route('admin.pipelines.contact.destroy', [$contact->id]) }}"><i class="fa fa-trash"></i></button> -->
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