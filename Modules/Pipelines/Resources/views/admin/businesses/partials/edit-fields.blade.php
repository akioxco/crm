<div class="box-body">
    <p>
        <div class="form-group">
            {!! Form::label('name', 'Nombre *') !!}
            {!! Form::text('name', null, ['class' => 'form-control', 'placeholder' => 'Ingrese Nombre', 'required' => 'required']) !!}
        </div>

        <div class="form-group">
                {!! Form::label('type_id', 'Tipo') !!}
                {!! Form::select('type_id', $typebusiness, null, ['class' => 'form-control', 'placeholder' => 'Ingrese Tipo...']) !!}
            </div>

            <div class="form-group">
                {!! Form::label('contact_id', 'Contacto') !!}
                {!! Form::select('contact_id', $contacts, null, ['class' => 'form-control', 'placeholder' => 'Ingrese Contacto...']) !!}
            </div>

            
            @if(auth()->user()->inRole('admin') || auth()->user()->inRole('qualifier') )
            <div class="form-group">
                {!! Form::label('seller_id', 'Responsable *') !!}
                {!! Form::select('seller_id', $users, null, ['class' => 'form-control', 'placeholder' => 'Ingrese Responsable...']) !!}
            </div>
            @else
            <div class="form-group" style="display:none">
                {!! Form::label('seller_id', 'Responsable *') !!}
                {!! Form::select('seller_id', $users, auth()->user()->id, ['class' => 'form-control', 'placeholder' => 'Ingrese Responsable...']) !!}
            </div>
            @endif


    </p>
</div>
