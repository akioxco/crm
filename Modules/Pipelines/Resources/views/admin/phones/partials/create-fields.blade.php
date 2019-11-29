<div class="box-body">
    <p>
        <div class="form-group">
            {!! Form::label('phone', 'Teléfono') !!}
            {!! Form::number('phone', null, ['class' => 'form-control', 'placeholder' => 'Ingrese Teléfono', 'required' => 'required']) !!}
        </div>
        <div class="form-group" style="display:none">
            {!! Form::text('company_id', $company->id) !!}
        </div>
    </p>
</div>
