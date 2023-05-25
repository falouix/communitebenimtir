@extends('layout.espace-prive.layout')
@section('title')
قائمة مطالب النفاذ
@endsection
@section('nompage')
قائمة مطالب النفاذ
@endsection
@section('content')
    <div class="col-12">
        <div class="col-lg-12 col-md-12" style="margin-bottom: 10px;">
        <a type="button" class="btn btn-success" href="{{ route("citoyen.demandeacces.nouveau") }}"><i
                class="fa fa-plus"></i> تحرير مطلب</a>
        </div>
        <!-- /.card -->
        <div class="card">

            <!-- /.card-header -->
            <div class="card-body">
                <table id="tabledemandeacces" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>رمز المطلب</th>
                            <th>الوثيقة</th>
                            <th>الهيكل الاداري المعني</th>
                            <th>التاريخ</th>
                            <th>الوضعية</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($listDemande as $demande)
                            <tr>
                                <td><a href="{{ route("citoyen.demandeacces.consulter",['id' => $demande->id]) }}">{{ $demande->codeDemande }}</a> </td>
                                <td>{{ $demande->NomDocumentDemande }}</td>
                                <td>{{ $demande->ServiceConcerne }}</td>
                                <td>{{ $demande->DateDemande }}</td>
                                <td>
                                    @switch($demande->EtatDemande)
                                    @case(0)
                                    <span class="badge bg-warning">في طور الدراسة</span>
                                    @break
                                    @case(1)
                                    <span class="badge bg-success">مقبول</span>
                                    @break
                                    @case(2)
                                    <span class="badge bg-danger">مرفوض</span>
                                    @break
                                    @endswitch
                                </td>
                               
                                <td>
                                    <a type="button" class="btn btn-primary" href="{{ route("citoyen.demandeacces.consulter",['id' => $demande->id]) }}"><i class="fa fa-eye"></i>
                                        إطلاع</a>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>رمز المطلب</th>
                            <th>الوثيقة</th>
                            <th>الهيكل الاداري المعني</th>
                            <th>التاريخ</th>
                            <th>الوضعية</th>
                            <th></th>
                        </tr>
                    </tfoot>
                </table>
            </div>
            <!-- /.card-body -->
        </div>
        <!-- /.card -->
    </div>
    <!-- /.col -->
    <script >
        $(function() {
                $("#tabledemandeacces").DataTable({
                    "language": {
                        "paginate": {
                            "next": "التالي",
                            "previous": "السابق"
                        }
                    },
                    "info": true,
                    "paging": true,
                    "lengthChange": true,
                    "searching": true,
                    "ordering": true,
                    "autoWidth": true
                });
            });
    </script>
@endsection
