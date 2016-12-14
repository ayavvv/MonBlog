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
	<!-- jsp:include page="header.html" flush="false" 这种方式有问题，还不知道为什么 -->

	<!-- Page Header -->
	<!-- Set your background image for this header on the line below. -->
	<header class="intro-header"
		style="background-image: url('img/home-bg.jpg')">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
					<div class="site-heading">
						<h1>MonBlog</h1>
						<hr class="small">
						<span class="subheading">A Blog by Théo</span>
					</div>
				</div>
			</div>
		</div>
	</header>



	<!-- Main Content -->
	<div class="container">
		<div class="row">
			<!--
          添加style="word-break:break-all;"为了解决BootStrap中div内容如果是英文的话，无法自动换行
          参考连接：http://www.jb51.net/css/22839.html
      -->
			<!-- 标签云 -->
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

			<div class="col-lg-10 col-md-10">

				<c:forEach var="blog" items="${blogs}">
					<div class="post-preview">
						<a href="blog?p=${blog.id}">
							<h2 class="post-title">${blog.title}</h2>
						</a>
						<p class="post-preview">${blog.preview}</p>
						<p class="post-meta">
							Posted by <a href="#">${blog.author}</a> on ${blog.date}
						</p>
					</div>
					<hr>
				</c:forEach>

				<!-- Pager -->
				<ul class="pager">
					<li class="next"><a href="blog?p=0">More Blogs &rarr;</a></li>
				</ul>
			</div>
		</div>

		<hr />
		<div class="row">
			<div class="col-lg-2 col-md-2" style="word-break: break-all;">
				<div>
					<div id='tag-cloud'>
						<h3>留言</h3>

					</div>
				</div>
			</div>
			<!-- 留言提交 -->
			<div class="col-lg-10 col-md-10">
				<form action="message" method="post"
					onsubmit="return validate_message(this)">
					<div class="row control-group">
						<div
							class="form-group col-xs-12 floating-label-form-group controls">
							<label>昵称</label>
							<!-- 未显示 floating-label-form-group 控制-->
							<input type="text" class="form-control" name="author"
								placeholder="昵称" />
						</div>
					</div>
					<div class="row control-group">
						<div
							class="form-group col-xs-12 floating-label-form-group controls">
							<label>留言</label> <input type="text" class="form-control"
								name="content" placeholder="留言" />
						</div>
					</div>
					<div class="row">
						<div class="form-group col-xs-12">
							<a href="index"><button type="submit" class="btn btn-default">COMMIT</button></a>
						</div>
					</div>
				</form>

			</div>
		</div>
		<!-- 留言板 -->
		<hr />
		<div class="row">
			<div class="col-lg-2 col-md-2" style="word-break: break-all;">
				<div>
					<div id='tag-cloud'>
						<h3>留言板</h3>

					</div>
				</div>
			</div>
			<div class="col-lg-10 col-md-10">

				<br />
				<c:forEach var="message" items="${messages}">

					<label>${message.author}</label>
					<br /> ${message.content} <br />
					${message.date}
					<hr />

				</c:forEach>

			</div>
		</div>
		<ul class="pager">
			<li class="next"><a href="messages">More Messages &rarr;</a></li>
		</ul>
	</div>


	<hr />

	<!-- Footer 网页底部 -->
	<%@ include file="footer.html"%>

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="js/clean-blog.js"></script>

</body>
</html>