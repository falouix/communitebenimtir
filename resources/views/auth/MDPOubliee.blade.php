@extends('layout.espace-prive.layout-connexion')
@section('title')
تحيين كلمة المرور
@endsection
@section('content')
<div class="card-body login-card-body">
    <p class="login-box-msg">تحيين كلمة المرور</p>

    <form method="POST" action="">
        @csrf
        @if($errors->any())
        <div class="alert alert-warning alert-dismissible">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            <h5><i class="icon fa fa-warning"></i> تنبيه!</h5>
            @foreach ($errors->all() as $error)
            <p>{{$error}}</p>
            @endforeach
        </div>
        @endif
        @foreach (['danger', 'warning', 'success', 'info'] as $key)
        @if(Session::has($key))
        <div class="alert alert-success alert-dismissible" style="margin-top: 10px;">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            <h5><i class="icon fa fa-check"></i> نجاح العملية!</h5>
            {{ Session::get($key) }}
        </div>
        @endif
        @endforeach
        <div class="input-group mb-3">
            <input type="email" class="form-control" placeholder="البريد الالكتروني" name="email" required autofocus
                autocomplete="off">
            @if ($errors->has('email'))
            <span class="invalid-feedback">
                <strong></strong>
            </span>
            @endif
            <input type="hidden" name="remember" autocomplete="off">
            <div class="input-group-append">
                <span class="fa fa-envelope input-group-text"></span>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-12">
                <div class="captcha">
                    <span>{!! Captcha::img('flat') !!}</span>
                    <button type="button" class="btn btn-success"><i class="fa fa-refresh" id="refresh"></i></button>
                </div>
            </div>
            <div class="form-group col-md-12">
                <input id="captcha" type="text" class="form-control" placeholder="ادخل الرمز" name="captcha"
                    autocomplete="off" required>
            </div>
        </div>
        <div class="row">
            <!-- /.col -->
            <div class="col-12">
                <button type="submit" class="btn btn-success btn-block btn-flat">ارسال</button>
            </div>
            <!-- /.col -->
        </div>
    </form>
    <div class="social-auth-links text-center mb-3">
        <p>- أو -</p>
        <a href="{{ route('citoyen.login') }}" class="btn btn-block btn-primary">
            تسجيل الدخول
        </a>
    </div>
    <!-- /.social-auth-links -->
</div>

<!-- /.login-card-body -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> <!-- jQuery CDN -->
<script type="text/javascript">
    $('#refresh').click(function(){
  $.ajax({
     type:'GET',
     url:'{{$public_url}}/refreshcaptcha',
     success:function(data){
        $(".captcha span").html(data.captcha);
     }
  });
});
</script>
@endsection