<div class="box-body">
<p>
    <div class="form-group">
        {!! Form::label('note', 'Nombre') !!}
        {!! Form::text('note', null, ['class' => 'form-control', 'placeholder' => 'Ingrese Nota', 'required' => 'required']) !!}
    </div>	


    <div class="form-group">
        {!! Form::hidden('contat_id', null, ['class' => 'form-control', 'value' => '', 'required' => 'required']) !!}
    </div>	


    </p>
</div>
