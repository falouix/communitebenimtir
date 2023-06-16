@extends('layout.espace-prive.layout')
@section('title')
الصفحة الرئيسية
@endsection
@section('nompage')
الصفحة الرئيسية
@endsection
@section('content')
@if(Auth::guard('citoyen')->user()->TypeCompte =='CITOYEN')
<div class="col-12 col-sm-6 col-md-3">
    <div class="info-box mb-3 bg-success">
        <span class="info-box-icon"><i class="fa fa-exclamation-triangle"></i></span>

        <div class="info-box-content">
            <a href="{{ route("citoyen.reclamations") }}">
                <span class="info-box-text">الشكاوى</span>
                <span class="info-box-number">{{ $nbReclamationOuvert }} مفتوح | {{ $nbReclamationFerme }} مغلق</span>
            </a>
        </div>
        <!-- /.info-box-content -->
    </div>
</div>
<!-- /.col -->
<div class="col-12 col-sm-6 col-md-3">
    <div class="info-box mb-3 bg-warning">
        <span class="info-box-icon"><i class="fa fa-eye"></i></span>

        <div class="info-box-content">
            <a href="{{ route("citoyen.demandeacces") }}">
                <span class="info-box-text">مطالب النفاذ</span>
                <span class="info-box-number">{{ $nbDemandeAccesEncours }} في طور الدراسة |{{ $nbDemandeAccesAccepte}}
                    مقبول |{{$nbDemandeAccesRefuse}} مرفوض</span>
            </a>
        </div>
        <!-- /.info-box-content -->
    </div>
    <!-- /.info-box -->
</div>
<!-- /.col -->
@else
<!-- fix for small devices only -->
<div class="clearfix hidden-md-up"></div>

<div class="col-12 col-sm-6 col-md-3">
    <div class="info-box mb-3 bg-info-gradient">
        <span class="info-box-icon"><i class="fa fa-file"></i></span>
        <div class="info-box-content">
            <a href="{{ route("citoyen.demandedocs") }}" style="color: white;">
                <span class="info-box-text">مطالب الوثائق الادارية</span>
                <span class="info-box-number">{{ $nbDemandeDocEncours }} في طور الدراسة | {{ $nbDemandeDocAccepte }}
                    مقبول | {{ $nbDemandeDocRefuse }} مرفوض</span>
            </a>
        </div>
        <!-- /.info-box-content -->
    </div>
    <!-- /.info-box -->
</div>
<!-- /.col -->
<div class="col-12 col-sm-6 col-md-3">
    <div class="info-box mb-3 bg-primary-gradient">
        <span class="info-box-icon"><i class="fa fa-envelope"></i></span>
        <div class="info-box-content">
            <a href="{{ route("citoyen.messages") }}" style="color: white;">
                <span class="info-box-text">الرسائل</span>
                <span class="info-box-number">5 رسائل جديدة</span>
            </a>
        </div>
        <!-- /.info-box-content -->
    </div>
    <!-- /.info-box -->
</div>
@endif
@endsection
