@extends('layout.espace-prive.layout')
@section('title')
قائمة الرسائل
@endsection
@section('nompage')
قائمة الرسائل
@endsection
@section('content')
    <div class="col-12">
        <div class="col-lg-12 col-md-12" style="margin-bottom: 10px;">
        <a type="button" class="btn btn-success" href="{{ route("citoyen.messages.nouveau") }}"><i
                class="fa fa-plus"></i> تحرير رسالة</a>
        </div>
        <!-- /.card -->
        <div class="card">

            <!-- /.card-header -->
            <div class="card-body">
                <table id="tablemessages" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>الموضوع</th>
                            <th>التاريخ</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($listMsg as $Msg)
                            <tr>
                                <td><a href="{{ route("citoyen.messages.consulter",['id' => $Msg->id]) }}">{{ $Msg->Sujet }}</a> </td>
                                <td>{{ $Msg->DateEnvoie }}</td>
                                <td>
                                    <a type="button" class="btn btn-primary" href="{{ route("citoyen.messages.consulter",['id' => $Msg->id]) }}"><i class="fa fa-eye"></i>
                                        إطلاع</a>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>الموضوع</th>
                            <th>التاريخ</th>
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
                $("#tablemessages").DataTable({
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
