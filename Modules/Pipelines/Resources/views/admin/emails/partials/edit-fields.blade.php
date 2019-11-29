<div class="box-body">
    <p>
    <div class="form-group">
            {!! Form::label('email', 'Email') !!}
            {!! Form::email('email', null, ['class' => 'form-control', 'placeholder' => 'Ingrese Email', 'required' => 'required']) !!}
        </div>
        <div class="form-group" style="display:none">
            {!! Form::text('company_id') !!}
        </div>
    </p>
</div>
