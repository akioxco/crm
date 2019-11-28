<div class="box-body">
    <p>
    <div class="form-group">
        {!! Form::label('name', 'Nombre') !!}
        {!! Form::text('name', null, ['class' => 'form-control', 'placeholder' => 'Ingrese Nombre', 'required' => 'required']) !!}
    </div>

    <div class="form-group">
        {!! Form::label('price', 'Precio') !!}
        {!! Form::number('price', null, ['class' => 'form-control','step' => '0.1']) !!}
    </div>
    </p>
</div>
