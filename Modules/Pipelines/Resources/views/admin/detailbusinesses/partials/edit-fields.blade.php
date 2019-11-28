<div class="box-body">
    <p>
    <div class="form-group">
            {!! Form::label('business_id', 'Negocio *') !!}
            {!! Form::select('business_id', [], null, ['class' => 'form-control', 'placeholder' => 'Ingrese Fuente...']) !!}
        </div>

        <div class="form-group">
            {!! Form::label('product_id', 'Producto *') !!}
            {!! Form::select('product_id', [], null, ['class' => 'form-control', 'placeholder' => 'Ingrese Fuente...']) !!}
        </div>


        <div class="form-group">
            {!! Form::label('quantity', 'Cantidad *') !!}
            {!! Form::number('quantity', null, ['class' => 'form-control', 'placeholder' => 'Ingrese Fuente...']) !!}
        </div>


        <div class="form-group">
            {!! Form::label('value', 'Valor *') !!}
            {!! Form::number('value', null, ['class' => 'form-control', 'placeholder' => 'Ingrese Fuente...']) !!}
        </div>
    </p>
</div>
