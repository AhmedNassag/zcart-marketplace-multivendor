<div class="modal-dialog modal-sm">
  <div class="modal-content">
    {!! Form::open(['route' => 'admin.setting.key.generate', 'class' => 'ajax-form', 'data-toggle' => 'validator']) !!}
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
      {{ trans('app.form.form') }}
    </div>
    <div class="modal-body">
      @if (config('app.demo') == true)
        <div class="alert alert-warning">
          {{ trans('messages.demo_restriction') }}
        </div>
      @else
        <div class="form-group">
          {!! Form::label('do_action', trans('app.form.type_regenerate_key')) !!}
          {!! Form::text('do_action', null, ['class' => 'form-control', 'required']) !!}
          <div class="help-block with-errors">{!! trans('app.form.type_regenerate_key_exact') !!}</div>
        </div>

        <div class="form-group">
          {!! Form::label('password', trans('app.form.confirm_acc_password')) !!}
          {!! Form::password('password', ['class' => 'form-control', 'id' => 'password', 'placeholder' => trans('app.placeholder.password'), 'data-minlength' => '6', 'required']) !!}
          <div class="help-block with-errors"></div>
        </div>
      @endif

      <p class="text-danger"><i class="fa fa-exclamation-triangle"></i> {!! trans('messages.confirm_regenerate_key') !!}</p>
    </div>
    <div class="modal-footer">
      @unless (config('app.demo') == true)
        {!! Form::submit(trans('app.generate_app_key'), ['class' => 'btn btn-flat btn-new confirm']) !!}
      @endunless
    </div>
    {!! Form::close() !!}
  </div> <!-- / .modal-content -->
</div> <!-- / .modal-dialog -->
