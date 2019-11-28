<div class="box-body">
    <p>
    <div class="form-group">
            {!! Form::label('business_id', 'Negocio *') !!}
            {!! Form::select('business_id', [], null, ['class' => 'form-control', 'placeholder' => 'Ingrese Fuente...']) !!}
        </div>

        <div class="form-group">
            {!! Form::label('pipeline_id', 'Pipeline *') !!}
            {!! Form::select('pipeline_id', [], null, ['class' => 'form-control', 'placeholder' => 'Ingrese Fuente...']) !!}
        </div>

        <div class="form-group">
            {!! Form::label('description', 'Descripcion *') !!}
            {!! Form::text('description', null, ['class' => 'form-control', 'placeholder' => 'Ingrese Fuente...']) !!}
        </div>

        <div class="form-group">
            {!! Form::label('date', 'Fecha *') !!}
            {!! Form::date('date', null, ['class' => 'form-control', 'placeholder' => 'Ingrese Fuente...']) !!}
        </div>
    </p>
</div>
