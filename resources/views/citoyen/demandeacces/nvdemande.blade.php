@extends('layout.espace-prive.layout')
@section('title')
تحرير مطلب نفاذ
@endsection
@section('nompage')
تحرير مطلب نفاذ
@endsection
@section('content')
    <div class="col-12">
        <div class="col-lg-12 col-md-12" style="margin-bottom: 10px;">
        <a type="button" class="btn btn-success" href="{{ route("citoyen.demandeacces") }}"><i
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
                    <h3> الوثيقة الإدارية المطلوب النفاذ إليها:</h3>
                    <table class="table table-bordered">
                        <tbody>
                            <tr>
                                <th style="width: 40%">الوثيقة</th>
                                <th style="width: 40%">الهيكل الاداري المعني</th>
                                <th style="width: 20%">المرجع (إن وُجد) </th>
                            </tr>
                            <tr>
                                <td>
                                    <div class="form-group">
                                    <input type="text" class="form-control" name="NomDocumentDemande" id="NomDocumentDemande" placeholder="اكتب اسم الوثيقة" required
                                        autocomplete="false">
                                </div>
                            </td>
                                <td>
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="ServiceConcerne" id="ServiceConcerne" placeholder="اكتب الهيكل الاداري المعني" required
                                            autocomplete="false">
                                    </div>
                                </td>
                                <td>
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="ReferenceDocs" id="ReferenceDocs" placeholder="اكتب مرجع الوثيقة ان وجد" 
                                            autocomplete="false">
                                    </div>
                                </td>
                                
                            </tr>
                        </tbody>
                    </table>
                    <div class="form-group">
                        <label>الصورة المطلوبة للنفاذ إلى الوثيقة الإدارية:</label>
                        <select class="form-control select2" style="width: 100%;" id="FormeAcce" name="FormeAcce">
                            <option selected="selected" value="الاطلاع على الوثيقة على عين المكان">الاطلاع على الوثيقة على عين المكان</option>
                            <option value="الحصول على نسخة ورقية">الحصول على نسخة ورقية</option>
                            <option value="الحصول على نسخة إلكرتونية">الحصول على نسخة إلكرتونية</option>
                            <option value="الحصول على نسخة مرقونة للعبارات المسجلة في شكل سمعي أو بصري">الحصول على نسخة مرقونة للعبارات المسجلة في شكل سمعي أو بصري</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="Sujet">نص المطلب </label>
                        <textarea id="Info" name="Info" class="form-control" style="height: 300px" placeholder="اكتب نص المطلب هنا" required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="PiecesJointes">ارسال ملفات</label>
                        <div class="input-group">
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="PiecesJointes" name="PiecesJointes[]" multiple>
                                <label class="custom-file-label" for="exampleInputFile">اختيار ملفات</label>
                            </div>
                        </div>
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
        CKEDITOR.replace('Info');
    </script>
@endsection
