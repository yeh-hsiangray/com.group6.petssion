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
<!-- Author Meta -->
<meta name="author" content="">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>聯絡我們</title>

<!--imports-->
<%@include file="../../commons/frontend_imports.jsp"%>
</head>
<body>

	<!--header -->
	<%@include file="../../commons/frontend_header.jsp"%>

	<!-- start banner Area -->
	<section class="banner-area relative about-banner" id="home">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center案">
				<div class="about-content col-lg-12">
					<h1 class="text-white">-聯絡我們</h1>
					<p class="text-white link-nav">
						<a href="">首頁 </a> <span class="lnr lnr-arrow-right"></span> <a
							href="contact.html"> 聯絡我們</a>
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->


	<!-- Start contact-page Area -->
	<section class="contact-page-area section-gap">
		<div class="container">
			<div class="row">
				<div class="map-wrap" style="width: 100%; height: 445px;" id="map"></div>
				<div class="col-lg-4 d-flex flex-column address-wrap">
					<div class="single-contact-address d-flex flex-row">
						<div class="icon">
							<span class="lnr lnr-home"></span>
						</div>
						<div class="contact-details">
							<h5>台灣/台北市</h5>
							<p>信義路三段153號3樓</p>
						</div>
					</div>
					<div class="single-contact-address d-flex flex-row">
						<div class="icon">
							<span class="lnr lnr-phone-handset"></span>
						</div>
						<div class="contact-details">
							<h5>02-6631-8168</h5>
							<p>週一至週五 早上九點至下午六點</p>
						</div>
					</div>
					<div class="single-contact-address d-flex flex-row">
						<div class="icon">
							<span class="lnr lnr-envelope"></span>
						</div>
						<div class="contact-details">
							<h5>petssion.match@gmail.com</h5>
							<p>歡迎來信詢問網站相關問題</p>
						</div>
					</div>
				</div>
				<div class="col-lg-8">
					<form class="form-area contact-form text-right" id="form">
						<div class="row">
							<div class="col-lg-6 form-group">
								<input name="to_name" placeholder="請輸入您的姓名"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = '請輸入您的姓名'" id="to_name"
									class="common-input mb-20 form-control" required="required"
									type="text"> <input name="reply_to"
									placeholder="請輸入電子信箱" id="reply_to"
									pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{1,63}$"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = '輸入電子信箱'"
									class="common-input mb-20 form-control" required="required"
									type="email"> <input name="subject" placeholder="請輸入主旨"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = '請輸入主旨'"
									class="common-input mb-20 form-control" required="required"
									type="text">
							</div>
							<div class="col-lg-6 form-group">
								<textarea class="common-textarea form-control" name="message"
									id="message" placeholder="請輸入您的意見或者問題"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = '請輸入您的意見或者問題'" required="required"></textarea>
							</div>
							<div class="col-lg-12">
								<div class="alert-msg" style="text-align: left;"></div>
								<input type="text" name="from_name" id="from_name"
									value="Petssion" style="display:none;"> <input type="submit" class="genric-btn genric-btn primary" id="button11"
									value="送出留言" style="float: right; height:58px;">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>

	<!--footer -->
	<%@include file="../../commons/frontend_footer.jsp"%>
	<!-- smtp e-mail  -->
	<script src="https://smtpjs.com/v3/smtp.js">
	</script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/emailjs-com@3/dist/email.min.js"></script>
	<script type="text/javascript">
		emailjs.init('user_2pZbyEKfarivT01S6H5MG')
	</script>
	<script>
	const btn = document.getElementById('button11');

	document.getElementById('form')
	 .addEventListener('submit', function(event) {
	   event.preventDefault();

	   btn.value = 'Sending...';

	   const serviceID = 'default_service';
	   const templateID = 'template_cqzkucc';

	   emailjs.sendForm(serviceID, templateID, this)
	    .then(() => {
	      btn.value = 'Send Email';
	      alert('Sent!');
	    }, (err) => {
	      btn.value = 'Send Email';
	      alert(JSON.stringify(err));
	    });
	});
	</script>
</body>

</html>