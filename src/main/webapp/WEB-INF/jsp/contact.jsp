<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="head.html"%>
	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="js/clean-blog.js"></script>
</head>
<body>
	<!-- header 导航栏 -->
	<%@ include file="nav.jsp"%>
	<!-- Page Header -->
	<!-- Set your background image for this header on the line below. -->
	<header class="intro-header"
		style="background-image: url('img/about-bg.jpg')">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
					<div class="text-center">
						<h1>MonBlog</h1>
						<hr class="small">
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- Main Content -->
	<div class="container">
		<div class="row">

			<div class="col-lg-10 col-md-10 ">
				<p>Want to get in touch with me? Fill out the form below to send
					me a message and I will try to get back to you within 24 hours!</p>
				<!-- Contact Form - Enter your email address on line 19 of the mail/contact_me.php file to make this form work. -->
				<!-- WARNING: Some web hosts do not allow emails to be sent through forms to common mail hosts like Gmail or Yahoo. It's recommended that you use a private domain email address! -->
				<!-- NOTE: To use the contact form, your site must be on a live web host with PHP! The form will not work locally! -->
				<form name="sentMessage" id="contactForm" novalidate>
					<div class="row control-group">
						<div
							class="form-group col-xs-12 floating-label-form-group controls">
							<label>Name</label>
							<textarea type="text" class="form-control" placeholder="Name"
								id="name" required
								data-validation-required-message="Please enter your name."></textarea>
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<div class="row control-group">
						<div
							class="form-group col-xs-12 floating-label-form-group controls">
							<label>Email Address</label>
							<textarea type="email" class="form-control"
								placeholder="Email Address" id="email" required
								data-validation-required-message="Please enter your email address."></textarea>
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<div class="row control-group">
						<div
							class="form-group col-xs-12 floating-label-form-group controls">
							<label>Phone Number</label>
							<textarea type="tel" class="form-control"
								placeholder="Phone Number" id="phone" required
								data-validation-required-message="Please enter your phone number."></textarea>
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<div class="row control-group">
						<div
							class="form-group col-xs-12 floating-label-form-group controls">
							<label>Message</label>
							<textarea rows="5" class="form-control" placeholder="Message"
								id="message" required
								data-validation-required-message="Please enter a message."></textarea>
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<br>
					<div id="success"></div>
					<div class="row">
						<div class="form-group col-xs-12">
							<button type="submit" class="btn btn-default">Send</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<hr>
	<!-- Footer 网页底部 -->
	<%@ include file="footer.html"%>



</body>

</html>
