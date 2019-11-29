<div class="box-body">
    
    <div class="row">
        <div class="col-md-8">
            
            <div class="form-group">
                {!! Form::label('name', 'Nombre *') !!}
                {!! Form::text('name', null, ['class' => 'form-control', 'placeholder' => 'Ingrese Nombre', 'required' => 'required']) !!}
            </div>
            <div class="form-group">
                {!! Form::label('last_name', 'Apellidos *') !!}
                {!! Form::text('last_name', null, ['class' => 'form-control', 'placeholder' => 'Ingrese Apellidos', 'required' => 'required']) !!}
            </div>
            <div class="form-group">
                {!! Form::label('email', 'E-mail *') !!}
                {!! Form::email('email', null, ['class' => 'form-control', 'placeholder' => 'Ingrese Email', 'required' => 'required']) !!}
            </div>
            <div class="form-group">
                {!! Form::label('number_wa', 'Número de WA') !!}
                {!! Form::number('number_wa', null, ['class' => 'form-control', 'placeholder' => 'Ingrese Número de WA']) !!}
            </div>
            <div class="form-group">
                {!! Form::label('phone', 'Teléfono *') !!}
                {!! Form::number('phone', null, ['class' => 'form-control', 'placeholder' => 'Ingrese Teléfono', 'required' => 'required']) !!}
            </div>

            <div class="form-group">
                {!! Form::label('company_id', 'Empresa') !!}
                {!! Form::select('company_id', $companies, null, ['class' => 'form-control', 'placeholder' => 'Ingrese Empresa...']) !!}
            </div>

    
        </div>
        <div class="col-md-4">
        
            <div class="form-group">
                {!! Form::label('web', 'Sitio Web') !!}
                {!! Form::text('web', null, ['class' => 'form-control', 'placeholder' => 'Ingrese Sitio Web']) !!}
            </div>
            <div class="form-group">
                {!! Form::label('city', 'Ciudad *') !!}
                {!! Form::text('city', null, ['class' => 'form-control', 'placeholder' => 'Ingrese Ciudad', 'required' => 'required']) !!}
            </div>
            <div class="form-group">
                {!! Form::label('country_id', 'País *') !!}
                {!! Form::select('country_id', $countries, null, ['class' => 'form-control', 'placeholder' => 'Ingrese País...']) !!}
            </div>
            <div class="form-group">
                {!! Form::label('source_id', 'Fuente de oportunidad *') !!}
                {!! Form::select('source_id', $sources, null, ['class' => 'form-control', 'placeholder' => 'Ingrese Fuente...']) !!}
            </div>

            @if(auth()->user()->inRole('admin') || auth()->user()->inRole('qualifier') )
            <div class="form-group">
                {!! Form::label('seller_id', 'Responsable *') !!}
                {!! Form::select('seller_id', $users, null, ['class' => 'form-control', 'placeholder' => 'Ingrese Responsable...']) !!}
            </div>
            @else
            <div class="form-group" style="display:none">
                {!! Form::label('seller_id', 'Responsable *') !!}
                {!! Form::select('seller_id', [], auth()->user()->id, ['class' => 'form-control', 'placeholder' => 'Ingrese Responsable...']) !!}
            </div>
            @endif
            


            <div class="form-group" style="display:none">
                {!! Form::text('added_by', auth()->user()->id) !!}
            </div>


        </div>
    </div>

    

    
    

</div>
