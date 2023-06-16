@extends('layout.espace-prive.layout')
@section('title')
مطلب وثيقة إدارية
@endsection
@section('nompage')
مطلب وثيقة إدارية
@endsection
@section('content')
    <div class="col-12">
        <div class="col-lg-12 col-md-12" style="margin-bottom: 10px;">
        <a type="button" class="btn btn-success" href="{{ route("citoyen.demandedocs") }}"><i
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
                    <div class="form-group col-lg-6 col-md-6">
                        <label for="codeDemande">الوثيقة الإدارية المطلوبة</label>
                        <input type="text" class="form-control" name="type_docs_id" id="type_docs_id" disabled autocomplete="false" value="{{ $demande->libelle_type_doc }}">
                    </div>
                    <div class="form-group col-lg-6 col-md-6">
                        <label for="DateDemande">التاريخ</label>
                        <input type="text" class="form-control" name="DateDemande" id="DateDemande" disabled autocomplete="false"
                            value="{{ $demande->date_demande }}">
                    </div>
                    <div class="form-group col-lg-4 col-md-4">
                        <label for="langue">اللغة</label>
                        <input type="text" class="form-control" name="langue" id="langue" disabled autocomplete="false"
                            @switch($demande->langue)
                                    @case("ar")
                                       value="العربية"
                                    @break
                                    @case("fr")
                                        value="الفرنسية"
                                    @break
                                    @endswitch
                                    >
                    </div>
                    <div class="form-group col-lg-4 col-md-4">
                        <label for="EtatDemande">طريقة الاستلام</label>
                        <input type="text" class="form-control" name="type_envoi" id="type_envoi"  disabled
                            autocomplete="false" 
                            @switch($demande->type_envoi)
                                    @case(0)
                                       value="عن طريق البريد"
                                    @break
                                    @case(1)
                                        value="عن طريق البريد الالكتروني"
                                    @break
                                    @case(2)
                                       value="عن طريق الوزارة"
                                    @break
                                    @endswitch
                                    >
                    </div>
                    <div class="form-group col-lg-4 col-md-4">
                        <label for="EtatDemande">وضعية المطلب</label>
                        <input type="text" class="form-control" name="EtatDemande" id="EtatDemande" disabled autocomplete="false"
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
                    @isset($demande->description)
                    <div class="form-group col-lg-12 col-md-12">
                        <label for="Info">نص المطلب :</label>
                        {!! $demande->description !!}
                    </div>
                    @endisset
                    @if($demande->EtatDemande==2)
                    @isset($demande->raison_refus)
                    <div class="form-group col-lg-12 col-md-12">
                        <label for="Info">سبب الرفض :</label>
                        {!! $demande->raison_refus !!}
                    </div>
                    @endisset
                    @endif
                    </div>
                </div>
                <!-- /.card-body -->

            
        </div>
    </div>
    <!-- /.col -->
    <script>
        CKEDITOR.replace('TextReponse');
    </script>
@endsection
