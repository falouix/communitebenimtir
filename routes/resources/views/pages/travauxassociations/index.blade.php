@extends('layout.layout')
@section('meta')
<meta name="description" content="">
<meta name="keywords" content="">
@endsection
@section('title')
{{ __('routes.Home') }}
@endsection

@section('menu')
@include('layout.partials.menu', ['frontMenu' => $frontMenu])
@endsection

<!-- Section content : Actualités, Evenements, Chiffres clés etc.. -->
@section('content')

<div class="page-header bg-dark">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <!-- Page Header Wrapper -->
                <div class="page-header-wrapper">
                    <!-- Title & Sub Title -->
                    <h3 class="title">ِ{{ __('libelle.ListEvenement') }}</h3>
                    <ol class="breadcrumb">
                        <li><a href="#">{{ __('routes.Home') }}</a></li>
                        <li class="active">ِ{{ __('libelle.ListEvenement') }}</li>
                    </ol><!-- Breadcrumb -->
                </div><!-- Page Header Wrapper -->
            </div><!-- Coloumn -->
        </div><!-- Row -->
    </div><!-- Container -->
</div>
<section class="element-animation-section bg-grey">
    <div class="container">
        <div class="row">
            <!-- List row -->
            <ul class="row">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>{{ __('libelle.col_NomAsso') }}</th>
                            <th>{{ __('libelle.col_TitreTravailAsso') }}</th>
                            <th>{{ __('libelle.col_DatePubTravailAsso') }}</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($listTravaux as $travail)
                        <tr>
                            <td> {{ $travail->nomAssociation }}</td>
                            <td>{{ $travail->$titre }}</td>
                            <td>{{ $travail->date_publication }}</td>
                            <td><a class="btn sm-green-btn" @if ($travail->lienDocument == null ||
                                    $travail->lienDocument ==
                                    '')) href="#" @else href="{{  voyager::image($travail->lienDocument) }}"
                                    @endif target="_blank"><i class="uni-file-download">
                                        {{ __('libelle.Télécharger') }}</i></a></td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </ul><!-- List row -->
            <div class="row">
                <center> {!! $listTravaux->links("pagination::bootstrap-4") !!} </center>
            </div>
        </div>
    </div>
</section>
@include('layout.partials.footer')
@endsection
