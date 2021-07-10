<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="../source/../source/img/fav.png">
<!-- Author Meta -->
<meta name="author" content="DixonLiao">
<!-- Meta Description -->
<meta name="description" content="a blog about pets from Petssion.com">
<!-- Meta Keyword -->
<meta name="keywords" content="blog, pet, petssion">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>後台：寵物專欄</title>

<!--imports-->
<%@include file="../../commons/backend_imports.jsp"%>
</head>
<body
	class="hold-transition sidebar-mini layout-fixed layout-footer-fixed">

	<!--header -->
	<%@include file="../../commons/backend_header.jsp"%>

	<!-- sidebar start -->
	<%@include file="../../commons/backend_sidebar.jsp"%>
	<!-- sidebar end -->

	<!-- Main content Start-->
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>寵物專欄</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right" style="font-size: 26px;">
							<li class="breadcrumb-item"><a href="#">首頁</a></li>
							<li class="breadcrumb-item active">新增修改</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>

		<!-- Main content -->

		<!-- Table List-->
		<section class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<form method="POST" id="editorForm" style="width: 100%"
									action="<c:url value="/backend/blog/Article/edit"/>">

									<!-- article物件有編號就是修改 -->
									<input type="hidden" value="${singleArticle.id}" name="id" />

									<table class="tb-edit" id=""
										style="border: 0px; font-size: 26px; margin: 6px">
										<!-- 1 -->
										<tbody>
											<tr>
												<td class="td-edit-1">標題</td>
												<td class="td-edit-2"><a><input name="title"
														placeholder="請在此輸入標題" class="form-control" required="required"
														style="width: 100%; border-radius: 5px;" value="${singleArticle.title}"></a></td>
											</tr>

											<!-- 2 -->
											<tr>
												<td class="td-edit-1">作者</td>
												<td class="td-edit-2"><a><input name="author" value="${singleArticle.author}"
														placeholder="請在此輸入作者名稱" class="form-control" required="required"
														style="width: 100%; border-radius: 5px;"></a></td>
											</tr>

											<!-- 3 -->
											<tr>
												<td class="td-edit-1">標籤</td>
												<td class="td-edit-2">
													<div class="form-group">
														<select class="select2" id="multi-selector"
															name="tag_type" multiple="multiple"
															data-placeholder="選擇4個標籤" style="width: 100%;">
															<option value="人類好友">人類好友</option>
															<option value="友善環境">友善環境</option>
															<option value="寵物協尋">寵物協尋</option>
															<option value="寵物心理學">寵物心理學</option>
															<option value="寵物新知">寵物新知</option>
															<option value="寵物用品">寵物用品</option>
															<option value="寵物結紮">寵物結紮</option>
															<option value="寵物美容">寵物美容</option>
															<option value="寵物衛教">寵物衛教</option>
															<option value="寵物貓狗">寵物貓狗</option>
															<option value="寵物趣聞">寵物趣聞</option>
															<option value="寵物電器">寵物電器</option>
															<option value="寵物食品">寵物食品</option>
															<option value="心情貼文">心情貼文</option>
															<option value="新增">新增</option>
														</select>
													</div>
												</td>
											</tr>
											<!-- 4 -->

											<tr>
												<td class="td-edit-1">圖片</td>
												<td class="td-edit-2"
													style="height: 200px; border-style: dash; border-color: grey;">
													<div class="photo_submit-container">
														<!-- img1 -->
														<input type="hidden" id="img1" value="${singleArticle.img1}"> <label
															class="photo_submit js-photo_submit1" target="img1">
															<input class="photo_submit-input js-photo_submit-input"
															type="file" accept="image/*"> <span
															class="photo_submit-plus"></span> <span
															class="photo_submit-uploadLabel">上傳圖片</span> <span
															class="photo_submit-delete"></span>
														</label>
														<!-- img2 -->
														<!-- img3  -->
														<input type="hidden" id="img2" value="${singleArticle.img2}"> <label
															class="photo_submit js-photo_submit2" target="img2">
															<input class="photo_submit-input js-photo_submit-input"
															type="file" accept="image/*"> <span
															class="photo_submit-plus"></span> <span
															class="photo_submit-uploadLabel">上傳圖片</span> <span
															class="photo_submit-delete"></span>
														</label>
														<!-- img3  -->
														<input type="hidden" id="img3" value="${singleArticle.img3}"> <label
															class="photo_submit js-photo_submit3" target="img3">
															<input class="photo_submit-input js-photo_submit-input"
															type="file" accept="image/*"> <span
															class="photo_submit-plus"></span> <span
															class="photo_submit-uploadLabel">上傳圖片</span> <span
															class="photo_submit-delete"></span>
														</label>
													</div>
												</td>
											</tr>
											<!-- 5 -->
											<tr>
												<td class="td-edit-1">內容</td>
												<!-- ckeditor / content -->
												<td class="td-edit-2"><textarea id="editor"
														style="border-radius: 5px;">${singleArticle.contents}</textarea></td>
											</tr>
											<tr style="height: 50px;">
												<td colspan="2" class="rightEnd"><!-- <a
													class="btn btn-info btn-sm btn-preview-1"> <i
														class="fas fa-pencil-alt"> </i> 預覽
												</a> --> <a class="btn btn-info btn-sm btn-submit-1"> <i
														class="fas fa-pencil-alt"> </i> <input
														class="btn btn-info btn-sm btn-submit-2" type="submit"
														id="form-submit" value=" 送出" onclick="javascript:location.href=<c:url value='/backend/blog/index' />">
												</a></td>
											</tr>
										</tbody>
									</table>

								</form>
							</div>
						</div>
						<!-- /.card -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- Table List -->
	</div>
	<!-- Main content End-->



	<!--footer -->
	<%@include file="../../commons/backend_footer.jsp"%>

 	<!-- multiselector -->
	<!--<script>
	function multi-selector(){	
	var value = $("#multi-selector option:selected");
	var text = tag.text();
	var intIndex =0
	for(var i=0;i<text.length;i++){
	text.options[i].selected = true;
	$("tag"+intIndex+1).val($("#multi-selector")[intIndex]
	intIndex+=1
	}
	return true;
	}
	</script> -->

	<!-- ajax -->
	<script>
  $(function () {
/*     //Initialize Select2 Elements
 */    $('.select2').select2();
 		$('#form-submit').click(function(e){
 			 e.preventDefault();
 			 var id=$("input[name=id]").val();
 			 var title=$("input[name=title]").val();
 			 var author=$('input[name=author]').val();
 			 var contents=editor.getData();
 			 var tag1=$("#multi-selector").val().length>0?$("#multi-selector").val()[0]:"";
 			 var tag2=$("#multi-selector").val().length>1?$("#multi-selector").val()[1]:"";
 			 var tag3=$("#multi-selector").val().length>2?$("#multi-selector").val()[2]:"";
 			 var tag4=$("#multi-selector").val().length>3?$("#multi-selector").val()[3]:"";
 			 var img1=$('#img1').val();
 			 var img2=$('#img2').val();
 			 var img3=$('#img3').val();
 			 var data={'id':id,'title':title,'author':author,'contents':contents,'tag1':tag1,'tag2':tag2,'tag3':tag3,'tag4':tag4,'img1':img1,'img2':img2,'img3':img3};
 			$.ajax({
 				url : "<c:url value='/backend/blog/api/Article/edit'/>",
 				method : 'POST',
 			    data: JSON.stringify(data),
 			    contentType: 'application/json; charset=utf-8',
 				dataType : 'JSON',
 				success : function(result) {
 					console.log(result);
 					$("input[name=id]").val(result.id);
 					window.location.replace("<c:url value='/backend/blog/index' />");
 				},
 				error(xhr,status,error)	{
 					console.log(xhr+":"+status+":"+error);
 				}
 			});
            

 		})

 		$(".photo_submit").each(function(){
 			var _this=$(this);
 			var _target=_this.attr("target");
 			var _input=_this.find('input:first');
 			if($("#"+_target).val()!=""){
 				_this.attr('style', 'background-image: url('+$("#"+_target).val()+');');
 				_this.addClass('photo_submit--image');
 				_input.attr('disabled', 'disabled');
 				var deleteBtn=_this.find('.photo_submit-delete');
 				deleteBtn.click(function() {
 		            _this.removeAttr('style');
 		            _this.removeClass('photo_submit--image');
 		            $("#"+_target).val('');
 		            setTimeout(() => {
 		            	_input.removeAttr('disabled', 'disabled');
 		            }, 200);
 		        });
 			}
 		})
 		$("#multi-selector").val(['${singleArticle.tag1}','${singleArticle.tag2}','${singleArticle.tag3}','${singleArticle.tag4}']).trigger("change");
  });
</script>


	<!-- photo upload & preview -->
	<script>
	class PhotoSubmission {
	    constructor() {
	        const inputs = document.querySelectorAll('.js-photo_submit-input');
	        const label = document.querySelectorAll('.photo_submit');
	        for (var i = 0; i < inputs.length; i++) {
	            inputs[i].addEventListener('change', this.uploadImage);
	        }
	         for (var i = 0; i < label.length; i++) {
	            label[i].addEventListener('dragover', this.dropoverImage);
	            label[i].addEventListener('drop', this.dropImage);
	        }
	    }
	    dropoverImage(e){
	         e.preventDefault()
	    }
	    dropImage(e){
	        e.stopPropagation()
	        e.preventDefault()
	        const uploadBtn = e.target;
	        const fileInput = uploadBtn.childNodes[1]
	        const deleteBtn = uploadBtn.childNodes[7];
	       
	        const reader = new FileReader();

	         reader.onload = function(e) {
	            uploadBtn.setAttribute('style', `background-image: url('\${e.target.result}');`);
	            uploadBtn.classList.add('photo_submit--image');
	            fileInput.setAttribute('disabled', 'disabled');
	            var target=uploadBtn.getAttribute("target");
	            $("#"+target).val(e.target.result);
	            
	        };
	        //console.log(e.dataTransfer.getData("image/*"));
	        //console.log(e.dataTransfer.files[0]);
	        reader.readAsDataURL(e.dataTransfer.files[0]);
	        deleteBtn.addEventListener('click', () => {
	            uploadBtn.removeAttribute('style');
	            uploadBtn.classList.remove('photo_submit--image');
	            var target=uploadBtn.getAttribute("target");
	            $("#"+target).val('');
	            setTimeout(() => {
	                fileInput.removeAttribute('disabled', 'disabled');
	            }, 200);
	        });
	    }
	    uploadImage(e) {
	        const fileInput = e.target;
	        const uploadBtn = fileInput.parentNode;
	        const deleteBtn = uploadBtn.childNodes[7];

	        const reader = new FileReader();

	        reader.onload = function(e) {
	            uploadBtn.setAttribute('style', `background-image: url('\${e.target.result}');`);
	            uploadBtn.classList.add('photo_submit--image');
	            fileInput.setAttribute('disabled', 'disabled');
	            var target=uploadBtn.getAttribute("target");
	            $("#"+target).val(e.target.result);
	        };

	        reader.readAsDataURL(e.target.files[0]);

	        deleteBtn.addEventListener('click', () => {
	            uploadBtn.removeAttribute('style');
	            uploadBtn.classList.remove('photo_submit--image');
	            var target=uploadBtn.getAttribute("target");
	            $("#"+target).val('');
	            setTimeout(() => {
	                fileInput.removeAttribute('disabled', 'disabled');
	            }, 200);
	        });
	    }
	};

	new PhotoSubmission;
</script>

	<!-- CK ediotr Classic-->
	<script>
	let editor;
ClassicEditor
.create( document.querySelector( '#editor' ), {
 toolbar: [ 'undo','redo','|','heading', '|', 'bold', 'italic','underline','|','fontcolor','FontBackgroundColor','|','link', 'Table','TableToolbar','bulletedList', 'numberedList', 'blockQuote','|','ExportPdf','ExportWord' ],
 
} ).then( newEditor => {
    editor = newEditor;
} )
.catch( error => {
 console.log( error );
} );
</script>

</body>

</html>