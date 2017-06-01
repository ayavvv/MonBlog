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
			<p>
			<h3>Login</h3>
			<p>(if you want post a blog, please login first.)</p>
			<p>
			<form action="login.do" method="post" id="editorForm"
				onsubmit="return validate_post_blog(this)">
				<div class="row control-group">
					<div
						class="form-group col-xs-12 floating-label-form-group controls">
						<label>UserName</label> <input type="text" class="form-control"
							name="username" placeholder="UserName" />
					</div>
				</div>

				<div class="row control-group">
					<div
						class="form-group col-xs-12 floating-label-form-group controls">
						<label>Password</label> <input type="password"
							class="form-control" name="psswd" placeholder="Password" />
					</div>
				</div>

				
				
				<div>
					<div class="row">
						<div class="form-group col-xs-12">
							<button type="submit" class="btn btn-default">Submit</button>
						</div>

					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- Footer 网页底部 -->
	<%@ include file="footer.html"%>



</body>
</html>