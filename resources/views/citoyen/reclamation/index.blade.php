@extends('layout.espace-prive.layout')
@section('title')
قائمة الشكاوى
@endsection
@section('nompage')
قائمة الشكاوى
@endsection
@section('content')
    <div class="col-12">
        <div class="col-lg-12 col-md-12" style="margin-bottom: 10px;">
        <a type="button" class="btn btn-success" href="{{ route("citoyen.reclamations.nouveau") }}"><i
                class="fa fa-plus"></i> تحرير شكوى</a>
        </div>
        <!-- /.card -->
        <div class="card">

            <!-- /.card-header -->
            <div class="card-body">
                <table id="tablereclamation" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>رمز الشكوى</th>
                            <th>الموضوع</th>
                            <th>التاريخ</th>
                            <th>الوضعية</th>
                            <th>الأولوية</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($listReclamation as $reclamation)
                            <tr>
                                <td><a href="{{ route("citoyen.reclamations.consulter",['id' => $reclamation->id]) }}">{{ $reclamation->CodeReclamation }}</a> </td>
                                <td>{{ $reclamation->Sujet }}</td>
                                <td>{{ $reclamation->DateReclamation }}</td>
                                <td> @if($reclamation->Etat==0) <span class="badge bg-success">مفتوحة</span> @else <span class="badge bg-danger">مغلقة</span> @endif</td>
                                <td>
                                    @switch($reclamation->Priorite)
                                    @case("haute")
                                        عالية
                                    @break
                                    @case("moyenne")
                                        متوسطة
                                    @break
                                    @case("faible")
                                        عادية
                                    @break
                                    @endswitch
                                </td>
                                <td>
                                    <a type="button" class="btn btn-primary" href="{{ route("citoyen.reclamations.consulter",['id' => $reclamation->id]) }}"><i class="fa fa-eye"></i>
                                        إطلاع</a>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>رمز الشكوى</th>
                            <th>الموضوع</th>
                            <th>التاريخ</th>
                            <th>الوضعية</th>
                            <th>الأولوية</th>
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
                $("#tablereclamation").DataTable({
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
