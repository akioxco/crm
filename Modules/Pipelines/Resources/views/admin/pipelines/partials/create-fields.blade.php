<div class="box-body">
    <p>
    <div class="form-group">
        {!! Form::label('name', 'Nombre') !!}
        {!! Form::text('name', null, ['class' => 'form-control', 'placeholder' => 'Ingrese Nombre', 'required' => 'required']) !!}
    </div>
    <div class="form-group">
        {!! Form::label('color', 'Color') !!}
        {!! Form::color('color', null, ['class' => 'form-control', 'placeholder' => 'Ingrese Color', 'required' => 'required']) !!}
    </div>
    </p>
</div>
