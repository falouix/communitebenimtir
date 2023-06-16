@extends('layout.espace-prive.layout')
@section('title')
قائمة مطالب الوثائق الادارية
@endsection
@section('nompage')
قائمة مطالب الوثائق الادارية
@endsection
@section('content')
    <div class="col-12">
        <div class="col-lg-12 col-md-12" style="margin-bottom: 10px;">
        <a type="button" class="btn btn-success" href="{{ route("citoyen.demandedocs.nouveau") }}"><i
                class="fa fa-plus"></i> تحرير مطلب</a>
        </div>
        <!-- /.card -->
        <div class="card">

            <!-- /.card-header -->
            <div class="card-body">
                <table id="tabledemandedocs" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>الوثيقة</th>
                            <th>طريقة الاستلام</th>
                            <th>التاريخ</th>
                            <th>الوضعية</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($listDemande as $demande)
                            <tr>
                                <td>{{ $demande->libelle_type_doc }}</td>
                                <td>
                                    @switch($demande->type_envoi)
                                    @case(0)
                                    عن طريق البريد
                                    @break
                                    @case(1)
                                    عن طريق البريد الالكتروني
                                    @break
                                    @case(2)
                                    عن طريق الوزارة
                                    @break
                                    @endswitch
                                </td>
                                <td>{{ $demande->date_demande }}</td>
                                <td>
                                    @switch($demande->etat)
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
                                    <a type="button" class="btn btn-primary" href="{{ route("citoyen.demandedocs.consulter",['id' => $demande->id]) }}"><i class="fa fa-eye"></i>
                                        إطلاع</a>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>الوثيقة</th>
                            <th>طريقة الاستلام</th>
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
                $("#tabledemandedocs").DataTable({
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
