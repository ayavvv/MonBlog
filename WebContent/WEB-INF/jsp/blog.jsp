<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="head.html"%>


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

	<!-- blog 正文部分 -->

	<article>
		<div class="container">
			<div class="row">
				<div class="col-lg-2 col-md-2" style="word-break: break-all;">
					<div>
						<div id='tag-cloud'>
							<h3>Category</h3>
							<a href="category?category=Java">Java</a><br /> <a
							href="category?category=C/C++">C/C++</a><br /> <a
							href="category?category=Python">Python</a><br /> <a
							href="category?category=OS">OS</a><br /> <a
							href="category?category=Mobile">Mobile</a><br /> <a
							href="category?category=Net">Net</a><br /> <a
							href="category?category=EveryDay">EveryDay</a><br /> <a
							href="category?category=Music">Music</a><br /> <a
							href="category?category=Film">Film</a><br /><!--
            <form class="navbar-form navbar-left" role="search">
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Search">
              </div>
              <button type="submit" class="btn btn-default">Submit</button>
            </form> -->
						</div>
					</div>
				</div>
				<div class="col-lg-8  col-md-10 ">
					<h2 class="text-center">${blog.title}</h2>
					<p>${blog.text}</p>

					<hr />
					<p class="post-meta text-center">
						Posted by <a href="#">${blog.author}</a> on ${blog.date}
					</p>
					
					<%if(session.getAttribute("username")!=null){%>
					<ul class="pager">
						<li class="next"><a href="post?p=${blog.id}">Edit</a></li>


						<li class="next"><a href="delete?p=${blog.id}">Delete</a></li>
					</ul>
					<%} %>
					<ul class="pager">
						<li class="next"><a href="blog?p=0">More Blogs &rarr;</a></li>
					</ul>
				</div>

			</div>
		</div>
	</article>

	<!-- Footer 网页底部 -->
	<%@ include file="footer.html"%>

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="js/clean-blog.min.js"></script>

</body>
</html>
