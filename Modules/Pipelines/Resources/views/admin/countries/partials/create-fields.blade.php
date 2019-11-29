<div class="box-body">
    <p>
    <div class="form-group">
        {!! Form::label('name', 'Nombre') !!}
        {!! Form::text('name', null, ['class' => 'form-control', 'placeholder' => 'Ingrese Nombre', 'required' => 'required']) !!}
    </div>	
    <div class="form-group">
        {!! Form::label('iso', 'ISO') !!}
        {!! Form::text('iso', null, ['class' => 'form-control', 'placeholder' => 'Ingrese ISO', 'required' => 'required']) !!}
    </div>	
    </p>
</div>
