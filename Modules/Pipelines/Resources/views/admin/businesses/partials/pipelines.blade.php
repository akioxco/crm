<div class="row">
    <div class="col-md-12">
    
    <div class="row">
        <div class="col-xs-12">

            
            <div class="box box-primary">
                <div class="box-header">

                <div class="row">
                <div class="btn-group pull-right" style="margin: 0 15px 15px 0;">
                @include('pipelines::admin.pipelinebusinesses.partials.modal-create', ['lang' => $locale])
                </div>
            </div>
                </div>


            <div class="row">
                <div class="col-md-12">
                    <ul class="timeline">
                        <?php if (isset($business->pipelinebusinesses)): ?>
                        <?php foreach ($business->pipelinebusinesses as $pipelinebusiness): ?>
                        <li>
                            <i class="fa fa-clock-o bg-gray bg-yellow"></i>
                            <div class="timeline-item">
                                <span class="time"><i class="fa fa-clock-o"></i> {{ $pipelinebusiness->created_at }}</span>
                                <h3 class="timeline-header"> <a href="#"   class="badge badge-primary" style="background-color:  {{$pipelinebusiness->pipeline->color }};"   >{{ $pipelinebusiness->pipeline->name }} </a></h3>
                                <div class="timeline-body">
                                    {{ $pipelinebusiness->description ? $pipelinebusiness->description : '' }} <br>
                                    {{ $pipelinebusiness->date }}
                                </div>
                                <div class="timeline-footer">
                                </div>
                            </div>
                        </li>
                        <?php endforeach; ?>
                        <?php endif; ?>
                    </ul>
                </div>        
            </div>

                
                
            </div>
        </div>
    </div>
    @include('core::partials.delete-modal')


    </div>
</div>