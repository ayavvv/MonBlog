<%@ page contentType="text/html;charset=UTF-8" language="java"
	import="java.util.*" import="com.buaa.springmvc.dao.Blog"%>
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
			<h3>Do you want wirte a blog in here, let's start it!</h3>
			<p>
			<form action="post.do" method="post" id="editorForm"
				onsubmit="return validate_post_blog(this)">
				<div class="row control-group">
					<div
						class="form-group col-xs-12 floating-label-form-group controls">
						<label>blog标题</label>
						<!-- 未显示 floating-label-form-group 控制-->
						<input type="text" class="form-control" name="editorTitle"
							value="${blog.title}" placeholder="blog标题" />
					</div>
				</div>

				<div class="row control-group">
					<div
						class="form-group col-xs-12 floating-label-form-group controls">
						<label>blog作者</label> <input type="text" class="form-control"
							name="editorAuthor" value="${blog.author}" placeholder="blog作者" />
					</div>
				</div>

				<div class="row control-group">
					<div
						class="form-group col-xs-12 floating-label-form-group controls">
						<label>blog简介</label> <input type="text" class="form-control"
							name="editorPreview" value="${blog.preview}" placeholder="blog简介" />
					</div>
				</div>

				<div class="row">
					<%
						Blog blog = (Blog) request.getAttribute("blog");
						String cat;
						if (blog != null) {
							cat = (blog.getCategory());
						} else {
							cat = "";
						}
						int p = 0;
						if (blog != null) {
							p = blog.getId();
						}

						System.out.println(p);
					%>
					<input type="hidden" name="p" value="<%out.print(p);%>" />
					<div class="form-group col-xs-12">
						<select name="editorCategory" class="btn btn-default"
							value="${blog.category}">
							<option value="null">blog种类</option>
							<option value="BlockChain" <%if (cat.equals("BlockChain")) {%>
								selected <%}%>>BlockChain</option>
							<option value="Java" <%if (cat.equals("Java")) {%> selected <%}%>>Java</option>
							<option value="C/C++" <%if (cat.equals("C/C++")) {%> selected
								<%}%>>C/C++</option>
							<option value="Python" <%if (cat.equals("Python")) {%> selected
								<%}%>>Python</option>
							<option value="OS" <%if (cat.equals("OS")) {%> selected <%}%>>OS</option>
							<option value="Mobile" <%if (cat.equals("Mobile")) {%> selected
								<%}%>>Mobile</option>
							<option value="Net" <%if (cat.equals("Net")) {%> selected <%}%>>Net</option>
							<option value="EveryDay" <%if (cat.equals("EveryDay")) {%>
								selected <%}%>>EveryDay</option>
							<option value="Music" <%if (cat.equals("Music")) {%> selected
								<%}%>>Music</option>
							<option value="Film" <%if (cat.equals("Film")) {%> selected <%}%>>Film</option>
						</select>

					</div>
				</div>
				<hr />


				<div>
					<div>
						<!-- 
						<textarea name="editorValue" id="myEditor">Please write your blog here</textarea>
						
						
						<script type="text/javascript" src="ueditor/ueditor.config.js"></script>
						<script type="text/javascript" src="ueditor/ueditor.all.js"></script>
						<link rel="stylesheet" type="text/css"
							href="ueditor/themes/iframe.css" />

						<script type="text/javascript" charset="utf-8">
							var editor = new baidu.editor.ui.Editor();
							editor.render("myEditor");
						</script> -->
						<%@ include file="ppp.jsp"%>
						<hr />



						<div class="row">
							<div class="form-group col-xs-12">
								<button type="submit" class="btn btn-default">Submit</button>
							</div>
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
