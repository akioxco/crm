<div class="box-body">
    
    <div class="row">
        <div class="form-group col-md-4">
            {!! Form::label('name', 'Nombre *') !!}
            {!! Form::text('name', null, ['class' => 'form-control', 'placeholder' => 'Ingrese Nombre', 'required' => 'required']) !!}
        </div>
        <div class="form-group col-md-4">
            {!! Form::label('city', 'Ciudad *') !!}
            {!! Form::text('city', null, ['class' => 'form-control', 'placeholder' => 'Ingrese Ciudad', 'required' => 'required']) !!}
        </div>
        <div class="form-group col-md-4">
            {!! Form::label('country_id', 'País *') !!}
            {!! Form::select('country_id', $countries, null, ['class' => 'form-control', 'placeholder' => 'Ingrese País...']) !!}
        </div>
    </div>
    
    <div class="row">
        <div class="form-group col-md-8">
            {!! Form::label('web', 'Sitio Web') !!}
            {!! Form::text('web', null, ['class' => 'form-control', 'placeholder' => 'Ingrese Sitio Web']) !!}
        </div>
        <div class="form-group col-md-4">
            {!! Form::label('source_id', 'Fuente de oportunidad *') !!}
            {!! Form::select('source_id', $sources, null, ['class' => 'form-control', 'placeholder' => 'Ingrese Fuente...']) !!}
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-8">
            {!! Form::label('seller_id', 'Responsable *') !!}
            {!! Form::select('seller_id', $users, null, ['class' => 'form-control', 'placeholder' => 'Ingrese Responsable...']) !!}
        </div>
        <div class="form-group col-md-4">
            {!! Form::label('type_id', 'Tipo de Id') !!}
            {!! Form::text('type_id', null, ['class' => 'form-control', 'placeholder' => 'Ingrese Tipo de Id']) !!}
        </div>
    </div>

    <div class="row">
        
        <div class="form-group col-md-8">
            {!! Form::label('identification', 'Identificacion') !!}
            {!! Form::text('identification', null, ['class' => 'form-control', 'placeholder' => 'Ingrese Identificacion']) !!}
        </div>
        <div class="form-group col-md-4">
            {!! Form::label('subdomain', 'Subdominio') !!}
            {!! Form::text('subdomain', null, ['class' => 'form-control', 'placeholder' => 'Ingrese Subdominio']) !!}
        </div>
    </div>

    <div class="row">
    
        <div class="form-group col-md-8">
            {!! Form::label('email', 'Email *') !!}
            {!! Form::email('email', null, ['class' => 'form-control', 'placeholder' => 'Ingrese Email', 'required' => 'required']) !!}
        </div>
        <div class="form-group col-md-4">
            {!! Form::label('phone', 'Teléfono *') !!}
            {!! Form::number('phone', null, ['class' => 'form-control', 'placeholder' => 'Ingrese Teléfono', 'required' => 'required']) !!}
        </div>
    </div>

</div>
