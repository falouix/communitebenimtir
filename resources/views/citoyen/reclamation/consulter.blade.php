@extends('layout.espace-prive.layout')
@section('title')
شكوى - {{ $reclamation->CodeReclamation }}
@endsection
@section('nompage')
شكوى - {{ $reclamation->CodeReclamation }}
@endsection
@section('content')
    <div class="col-12">
        <div class="col-lg-12 col-md-12" style="margin-bottom: 10px;">
        <a type="button" class="btn btn-success" href="{{ route("citoyen.reclamations") }}"><i
                class="fa fa-angle-double-right"></i> قائمة الشكاوى</a>
        </div>

        <div class="card card-primary">
            <!-- /.card-header -->
            <!-- form start -->
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
                    <div class="row">
                    <div class="form-group col-lg-2 col-md-2">
                        <label for="CodeReclamation">رمز الشكوى</label>
                        <input type="text" class="form-control" name="CodeReclamation" id="CodeReclamation" disabled autocomplete="false" value="{{ $reclamation->CodeReclamation }}">
                    </div>
                    <div class="form-group col-lg-4 col-md-4">
                        <label for="Sujet">موضوع الشكوى</label>
                        <input type="text" class="form-control" name="Sujet" id="Sujet"  disabled
                            autocomplete="false" value="{{ $reclamation->Sujet }}">
                    </div>
                    <div class="form-group col-lg-4 col-md-4">
                        <label for="DateReclamation">التاريخ</label>
                        <input type="text" class="form-control" name="DateReclamation" id="DateReclamation"  disabled
                            autocomplete="false" value="{{ $reclamation->DateReclamation }}">
                    </div>
                    <div class="form-group col-lg-2 col-md-2">
                        <label for="DateReclamation">الأولوية</label>
                        <input type="text" class="form-control" name="Priorite" id="Priorite" disabled autocomplete="false"
                            @switch($reclamation->Priorite)
                                    @case("haute")
                                       value="عالية"
                                    @break
                                    @case("moyenne")
                                        value="متوسطة"
                                    @break
                                    @case("faible")
                                       value="عادية"
                                    @break
                                    @endswitch>
                    </div>
                    <div class="form-group col-lg-12 col-md-12">
                        <label for="Sujet">نص الشكوى :</label>
                        {!! $reclamation->Textmessage !!}
                    </div>
                    
                    </div>
                </div>
                <!-- /.card-body -->
        
                <div class="card-footer" style="background: white;">
                    <ul class="mailbox-attachments clearfix">
                        @isset($reclamation->PiecesJointes)
                            @foreach(json_decode($reclamation->PiecesJointes, true) as $fichier)
                            @php
                                $split = explode("/", $fichier);
                            @endphp
                            <li>
                                <span class="mailbox-attachment-icon"><i class="fa fa-file"></i></span>
                            
                                <div class="mailbox-attachment-info">
                                    <a href="/citoyen/download?file={{ $fichier }}" class="mailbox-attachment-name" target="_blank"><i class="fa fa-paperclip"></i>{{ $split[count($split)-1] }}</a>
                                </div>
                            </li>
                            @endforeach
                        @endisset
                       
                        
                    </ul>
                </div>

            
        </div>
        @foreach ($ReponsesReclamation as $reponse)
        
        <div class="card card-primary card-outline">
            <!-- /.card-header -->
            <div class="card-body p-0">
                <div class="mailbox-read-info">
                    <h5>{{ $reponse->Expediteur }} 
                    <span class="mailbox-read-time float-left">{{ $reponse->DateReponse }}</span>
                    </h5>
                </div>
                <!-- /.mailbox-read-info -->
                <div class="mailbox-read-message">
                    {!! $reponse->TextReponse !!}
                </div>
                <!-- /.mailbox-read-message -->
            </div>
            <!-- /.card-body -->
            <div class="card-footer bg-white">
                <ul class="mailbox-attachments clearfix">
                    @isset($reponse->PiecesJointes)
                    @foreach(json_decode($reponse->PiecesJointes, true) as $fichier)
                    @php
                    $split = explode("/", $fichier);
                    @endphp
                    <li>
                        <span class="mailbox-attachment-icon"><i class="fa fa-file"></i></span>
                    
                        <div class="mailbox-attachment-info">
                            <a href="/citoyen/download?file={{ $fichier }}" class="mailbox-attachment-name" target="_blank"><i
                                    class="fa fa-paperclip"></i>{{ $split[count($split)-1] }}</a>
                        </div>
                    </li>
                    @endforeach
                    @endisset
                </ul>
            </div>
        </div>
        <!-- /. box -->
        @endforeach
    @if ($reclamation->Etat==0)
        <div class="card card-primary">
            <div class="card-header">
                <h3 class="card-title">تحرير اجابة</h3>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <form action="" enctype="multipart/form-data" method="post">
                @csrf
                <div class="card-body">
                    <input type="hidden" value="{{ $reclamation->id }}" name="Id_reclamation">
                    <div class="form-group">
                        <label for="Sujet">نص الإجابة </label>
                        <textarea id="TextReponse" name="TextReponse" class="form-control" style="height: 300px"
                            placeholder="اكتب نص الإجابة هنا" required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="PiecesJointes">ارسال ملفات</label>
                        <div class="input-group">
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="PiecesJointes" name="PiecesJointes[]" multiple>
                                <label class="custom-file-label" for="PiecesJointes">اختيار ملفات</label>
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
    @endif
        
    </div>
    <!-- /.col -->
    <script>
        CKEDITOR.replace('TextReponse');
    </script>
@endsection
