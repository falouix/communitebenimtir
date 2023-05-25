@extends('layout.espace-prive.layout')
@section('title')
مطلب نفاذ - {{ $demande->codeDemande }}
@endsection
@section('nompage')
مطلب نفاذ - {{ $demande->codeDemande }}
@endsection
@section('content')
    <div class="col-12">
        <div class="col-lg-12 col-md-12" style="margin-bottom: 10px;">
        <a type="button" class="btn btn-success" href="{{ route("citoyen.demandeacces") }}"><i
                class="fa fa-angle-double-right"></i> قائمة المطالب</a>
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
                    <div class="form-group col-lg-4 col-md-4">
                        <label for="codeDemande">رمز المطلب</label>
                        <input type="text" class="form-control" name="codeDemande" id="codeDemande" disabled autocomplete="false" value="{{ $demande->codeDemande }}">
                    </div>
                    <div class="form-group col-lg-4 col-md-4">
                        <label for="EtatDemande">وضعية المطلب</label>
                        <input type="text" class="form-control" name="EtatDemande" id="EtatDemande"  disabled
                            autocomplete="false" 
                            @switch($demande->EtatDemande)
                                    @case(0)
                                       value="في طور الدراسة"
                                    @break
                                    @case(1)
                                        value="مقبول"
                                    @break
                                    @case(2)
                                       value="مرفوض"
                                    @break
                                    @endswitch
                                    >
                    </div>
                    <div class="form-group col-lg-4 col-md-4">
                        <label for="DateDemande">التاريخ</label>
                        <input type="text" class="form-control" name="DateDemande" id="DateDemande"  disabled
                            autocomplete="false" value="{{ $demande->DateDemande }}">
                    </div>
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
                                        <input type="text" class="form-control" name="NomDocumentDemande" id="NomDocumentDemande"
                                              autocomplete="false" value="{{ $demande->NomDocumentDemande }}" disabled>
                                    </div>
                                </td>
                                <td>
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="ServiceConcerne" id="ServiceConcerne"
                                             autocomplete="false" value="{{ $demande->ServiceConcerne }}" disabled>
                                    </div>
                                </td>
                                <td>
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="ReferenceDocs" id="ReferenceDocs"
                                            value="{{ $demande->ReferenceDocs }}" autocomplete="false" disabled>
                                    </div>
                                </td>
                    
                            </tr>
                        </tbody>
                    </table>
                    <div class="form-group col-lg-12 col-md-12">
                        <label>الصورة المطلوبة للنفاذ إلى الوثيقة الإدارية:</label>
                        <input type="text" class="form-control" name="FormeAcce" id="FormeAcce" autocomplete="false"
                            value="{{ $demande->FormeAcce }}" disabled>
                    </div>
                    @isset($demande->Info)
<div class="form-group col-lg-12 col-md-12">
    <label for="Info">نص المطلب :</label>
    {!! $demande->Info !!}
</div>
                    @endisset
                    
                    </div>
                </div>
                <!-- /.card-body -->
        
                <div class="card-footer" style="background: white;">
                    <ul class="mailbox-attachments clearfix">
                        @isset($demande->PiecesJointes)
                            @foreach(json_decode($demande->PiecesJointes, true) as $fichier)
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
        @foreach ($ReponsesDemandeAcce as $reponse)
        
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
    @if ($demande->EtatDemande==0)
        <div class="card card-primary">
            <div class="card-header">
                <h3 class="card-title">تحرير اجابة</h3>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <form action="" enctype="multipart/form-data" method="post">
                @csrf
                <div class="card-body">
                    <input type="hidden" value="{{ $demande->id }}" name="Id_demandeacces">
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
