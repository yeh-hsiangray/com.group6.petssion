<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="<c:url value='/Sources/plugins/fontawesome-free/css/all.min.css' />">
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<!-- DataTables -->
<link rel="stylesheet"
	href="<c:url value='/Sources/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css' />">
<link rel="stylesheet"
	href="<c:url value='/Sources/plugins/datatables-responsive/css/responsive.bootstrap4.min.css' />">
<link rel="stylesheet"
	href="<c:url value='/Sources/plugins/datatables-buttons/css/buttons.bootstrap4.min.css' />">
<!-- select2 -->
<link rel="stylesheet"
	href="<c:url value='/Sources/plugins/select2/css/select2.min.css' />">
	<link rel="stylesheet"
	href="<c:url value='/Sources/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css' />">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css' />">
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet"
	href="<c:url value='/Sources/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css' />">
<!-- iCheck -->
<link rel="stylesheet"
	href="<c:url value='/Sources/plugins/icheck-bootstrap/icheck-bootstrap.min.css' />">
<!-- JQVMap -->
<link rel="stylesheet"
	href="<c:url value='/Sources/plugins/jqvmap/jqvmap.min.css' />">
<!-- Theme style -->
<link rel="stylesheet"
	href="<c:url value='/Sources/dist/css/adminlte.min.css' />">
<!-- overlayScrollbars -->
<link rel="stylesheet"
	href="<c:url value='/Sources/plugins/overlayScrollbars/css/OverlayScrollbars.min.css' />">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="<c:url value='/Sources/plugins/daterangepicker/daterangepicker.css' />">
<!-- summernote -->
<link rel="stylesheet"
	href="<c:url value='/Sources/plugins/summernote/summernote-bs4.min.css' />">
<link rel="stylesheet"
	href="<c:url value='/Sources/css/linearicons.css' />">

<!-- jQuery -->
<script src="<c:url value='/Sources/plugins/jquery/jquery.min.js' />"></script>
<!-- jQuery UI 1.11.4 -->
<script
	src="<c:url value='/Sources/plugins/jquery-ui/jquery-ui.min.js' />"></script>
<!-- Bootstrap 4 -->
<script
	src="<c:url value='/Sources/plugins/bootstrap/js/bootstrap.bundle.min.js' />"></script>
<!-- DataTables  & Plugins -->
<script
	src="<c:url value='/Sources/plugins/datatables/jquery.dataTables.min.js' />"></script>
<script
	src="<c:url value='/Sources/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js' />"></script>
<script
	src="<c:url value='/Sources/plugins/datatables-responsive/js/dataTables.responsive.min.js' />"></script>
<script
	src="<c:url value='/Sources/plugins/datatables-responsive/js/responsive.bootstrap4.min.js' />"></script>
<script
	src="<c:url value='/Sources/plugins/datatables-buttons/js/dataTables.buttons.min.js' />"></script>
<script
	src="<c:url value='/Sources/plugins/datatables-buttons/js/buttons.bootstrap4.min.js' />"></script>
<script src="<c:url value='/Sources/plugins/jszip/jszip.min.js' />"></script>
<script src="<c:url value='/Sources/plugins/pdfmake/pdfmake.min.js' />"></script>
<script src="<c:url value='/Sources/plugins/pdfmake/vfs_fonts.js' />"></script>
<script
	src="<c:url value='/Sources/plugins/datatables-buttons/js/buttons.html5.min.js' />"></script>
<script
	src="<c:url value='/Sources/plugins/datatables-buttons/js/buttons.print.min.js' />"></script>
<script
	src="<c:url value='/Sources/plugins/datatables-buttons/js/buttons.colVis.min.js' />"></script>
<!-- AdminLTE App -->
<script src="<c:url value='/Sources/dist/js/adminlte.min.js' />"></script>
<!-- select2 -->
<script
	src="<c:url value='/Sources/plugins/select2/js/select2.full.min.js' />"></script>
<!-- AdminLTE for demo purposes -->
<script src="<c:url value='/Sources/dist/js/demo.js' />"></script>
<script src="https://cdn.linearicons.com/free/1.0.0/svgembedder.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
	$.widget.bridge('uibutton', $.ui.button)
</script>

<!-- ChartJS -->
<script src="<c:url value='/Sources/plugins/chart.js/Chart.min.js' />"></script>
<!-- Sparkline -->
<script src="<c:url value='/Sources/plugins/sparklines/sparkline.js' />"></script>
<!-- JQVMap -->
<script
	src="<c:url value='/Sources/plugins/jqvmap/jquery.vmap.min.js' />"></script>
<script
	src="<c:url value='/Sources/plugins/jqvmap/maps/jquery.vmap.usa.js' />"></script>
<!-- jQuery Knob Chart -->
<script
	src="<c:url value='/Sources/plugins/jquery-knob/jquery.knob.min.js' />"></script>
<!-- daterangepicker -->
<script src="<c:url value='/Sources/plugins/moment/moment.min.js' />"></script>
<script
	src="<c:url value='/Sources/plugins/daterangepicker/daterangepicker.js' />"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script
	src="<c:url value='/Sources/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js' />"></script>
<!-- Summernote -->
<script
	src="<c:url value='/Sources/plugins/summernote/summernote-bs4.min.js' />"></script>
<!-- overlayScrollbars -->
<script
	src="<c:url value='/Sources/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js' />"></script>


<!-- CK ediotr Classic-->
<link
	href="<c:url value='/Sources/ckeditor5/build/ckeditor.css" rel="stylesheet' />">
<script src="<c:url value='/Sources/ckeditor5/build/ckeditor.js' />"></script>


<!-- -->
<script>
	$(function() {
		$('.select2').select2()
	});
</script>