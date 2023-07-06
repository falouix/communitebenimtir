@extends('layout.espace-prive.layout-connexion')
@section('title')
تسجيل الدخول
@endsection
@section('content')
<div class="card-body login-card-body">
    <p class="login-box-msg">تسجيل الدخول لفضاء المواطن</p>
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
        @if(session()->has('message'))
        <div class="alert alert-success">
            {{ session()->get('message') }}
        </div>
        @endif
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
        <div class="input-group mb-3">
            <input type="password" class="form-control" placeholder="كلمة السر" name="password" required
                autocomplete="off">
            @if ($errors->has('password'))
            <span class="invalid-feedback">
                <strong></strong>
            </span>
            @endif
            <div class="input-group-append">
                <span class="fa fa-lock input-group-text"></span>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-12">
                <div class="captcha">
                    <span>{!! captcha_img('flat') !!}</span>
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
                <button type="submit" class="btn btn-success btn-block btn-flat">دخول</button>
            </div>
            <!-- /.col -->
        </div>
    </form>

    <div class="social-auth-links text-center mb-3">
        <p>- أو -</p>
        <a href="{{ route('citoyen.register') }}" class="btn btn-block btn-primary">
            إنشاء حساب
        </a>
    </div>
    <!-- /.social-auth-links -->

    <p class="mb-1">
        <a href="{{ route('citoyen.motDePasseOubliee') }}">نسيت كلمة المرور ؟</a>
    </p>
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