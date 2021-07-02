<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet"
    href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<c:url value='/Sources/plugins/fontawesome-free/css/all.min.css' />">
  <!-- DataTables -->
  <link rel="stylesheet" href="<c:url value='/Sources/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css' />">
  <link rel="stylesheet" href="<c:url value='/Sources/plugins/datatables-responsive/css/responsive.bootstrap4.min.css' />">
  <link rel="stylesheet" href="<c:url value='/Sources/plugins/datatables-buttons/css/buttons.bootstrap4.min.css' />">
  <!-- Theme style -->
  <link rel="stylesheet" href="<c:url value='/Sources/dist/css/adminlte.min.css' />">
  
    <!-- jQuery -->
  <script src="<c:url value='/Sources/plugins/jquery/jquery.min.js' />"></script>
  <!-- Bootstrap 4 -->
  <script src="<c:url value='/Sources/plugins/bootstrap/js/bootstrap.bundle.min.js' />"></script>
  <!-- DataTables  & Plugins -->
  <script src="<c:url value='/Sources/plugins/datatables/jquery.dataTables.min.js' />"></script>
  <script src="<c:url value='/Sources/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js' />"></script>
  <script src="<c:url value='/Sources/plugins/datatables-responsive/js/dataTables.responsive.min.js' />"></script>
  <script src="<c:url value='/Sources/plugins/datatables-buttons/js/dataTables.buttons.min.js' />"></script>
  <script src="<c:url value='/Sources/plugins/datatables-buttons/js/buttons.bootstrap4.min.js' />"></script>
<script
	src="<c:url value='/Sources/plugins/jszip/jszip.min.js"></script>
  <script src="<c:url value='/Sources/plugins/pdfmake/pdfmake.min.js"></script>
  <script src="<c:url value='/Sources/plugins/pdfmake/vfs_fonts.js"></script>
  <script src="<c:url value='/Sources/plugins/datatables-buttons/js/buttons.html5.min.js' />"></script>
  <script src="<c:url value='/Sources/plugins/datatables-buttons/js/buttons.print.min.js' />"></script>
  <script src="<c:url value='/Sources/plugins/datatables-buttons/js/buttons.colVis.min.js' />"></script>
  <!-- AdminLTE App -->
  <script src="<c:url value='/Sources/dist/js/adminlte.min.js' />"></script>
  <!-- AdminLTE for demo purposes -->
  <script src="<c:url value='/Sources/dist/js/demo.js' />"></script>
  <!-- Page specific script -->
  <script>
    $(function () {
      $("#example1").DataTable({
        "responsive": true, "lengthChange": false, "autoWidth": true,
        "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
      }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');

      $('#example2').DataTable({
        "paging": true,
        "lengthChange": false,
        "searching": false,
        "ordering": true,
        "info": true,
        "autoWidth": false,
        "responsive": true,
      });
    });
  </script>