@extends('layout.espace-prive.layout')
@section('title')
تحرير مطلب وثيقة إدارية
@endsection
@section('nompage')
تحرير مطلب وثيقة إدارية
@endsection
@section('content')
@php
$listTypeDocs=App\TypeDoc::all();
@endphp
    <div class="col-12">
        <div class="col-lg-12 col-md-12" style="margin-bottom: 10px;">
        <a type="button" class="btn btn-success" href="{{ route("citoyen.demandedocs") }}"><i
                class="fa fa-angle-double-right"></i> قائمة المطالب</a>
        </div>

        <div class="card card-primary">
            <div class="card-header">
                <h3 class="card-title">الرجاء تعمير الحقول الإجبارية</h3>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <form action="" enctype="multipart/form-data" method="post">
                @csrf
                @foreach (['danger', 'warning', 'success', 'info'] as $key)
                @if(Session::has($key))
                <div class="alert alert-success alert-dismissible" style="margin-top: 10px;">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <h5><i class="icon fa fa-check"></i> نجاح العملية!</h5>
                    {{ Session::get($key) }}
                </div>
                @endif
                @endforeach
@if($errors->any())
<div class="alert alert-warning alert-dismissible">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
    <h5><i class="icon fa fa-warning"></i> تنبيه!</h5>
    @foreach ($errors->all() as $error)
    <p>{{$error}}</p>
    @endforeach
</div>
@endif
                
                <div class="card-body">
                    <div class="form-group">
                        <label> الوثيقة الإدارية: *</label>

                        <select class="form-control select2" style="width: 100%;" id="type_docs_id" name="type_docs_id" required>
                            @foreach ($listTypeDocs as $typeDoc)
                                <option  value="{{ $typeDoc->id }}">{{ $typeDoc->libelle }}</option>
                            @endforeach
                            
                           </select>
                    </div>
                    <div class="form-group">
                        <label> اللغة:</label>
                    
                        <select class="form-control select2" style="width: 100%;" id="langue" name="langue">
                            <option value="ar">العربية</option>
                    <option value="fr">الفرنسية</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label> طريقة الاستلام:</label>
                    
                        <select class="form-control select2" style="width: 100%;" id="type_envoi" name="type_envoi" required>
                            <option value="0">عن طريق البريد</option>
                            <option value="1">عن طريق البريد الالكتروني</option>
                            <option value="2">عن طريق الوزارة</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="description">التفاصيل </label>
                        <textarea id="description" name="description" class="form-control" style="height: 300px" placeholder="اكتب نص المطلب هنا"></textarea>
                    </div>
                </div>
                <!-- /.card-body -->
        
                <div class="card-footer">
                    <button type="submit" class="btn btn-primary">ارسال</button>
                </div>
            </form>
        </div>
    </div>
    <!-- /.col -->
    <script>
        CKEDITOR.replace('description');
    </script>
@endsection
