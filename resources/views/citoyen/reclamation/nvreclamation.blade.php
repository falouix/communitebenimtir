@extends('layout.espace-prive.layout')
@section('title')
تحرير شكوى
@endsection
@section('nompage')
تحرير شكوى
@endsection
@section('content')
<div class="col-12">
    <div class="col-lg-12 col-md-12" style="margin-bottom: 10px;">
        <a type="button" class="btn btn-success" href="{{ route("citoyen.reclamations") }}"><i
                class="fa fa-angle-double-right"></i> قائمة الشكاوى</a>
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
            <div class="card-body">
                <div class="form-group">
                    <label for="Sujet">موضوع الشكوى *</label>
                    <input type="text" class="form-control" name="Sujet" id="Sujet" placeholder="موضوع الشكوى" required
                        autocomplete="false">
                </div>
                <div class="form-group">
                    <label>الأولوية</label>
                    <select class="form-control select2" style="width: 100%;" id="Priorite" name="Priorite">
                        <option selected="selected" value="haute">عالية</option>
                        <option value="moyenne">متوسطة</option>
                        <option value="faible">عادية</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="Sujet">نص الشكوى *</label>
                    <textarea id="Textmessage" name="Textmessage" class="form-control" style="height: 300px"
                        placeholder="اكتب نص الشكوى هنا" required></textarea>
                </div>
                <div class="form-group">
                    <label for="PiecesJointes">ارسال ملفات</label>
                    <div class="input-group">
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" id="PiecesJointes" name="PiecesJointes[]"
                                multiple>
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
    CKEDITOR.replace('Textmessage');
</script>
@endsection
