<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<!-- Navigation -->
<nav class="navbar navbar-default navbar-custom navbar-fixed-top">
<div class="container-fluid">
	<!-- Brand and toggle get grouped for better mobile display -->
	<div class="navbar-header page-scroll">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target="#bs-example-navbar-collapse-1">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="index">Home</a>
	</div>

	<!-- Collect the nav links, forms, and other content for toggling -->
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav navbar-left">
			<li><a href="blog?p=0">All Blogs</a></li>
			<li><a href="messages">Message Board</a></li>
			<%if(session.getAttribute("username")!=null){%>
			<li><a href="post?p=0">Post</a></li>
		
		<%}%>
			
			<li><a href="contact">Contact Me</a></li>
			<li><a href="me">About Me</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
		<%if(session.getAttribute("username")==null){%>
			<li><a href="login">LOGIN</a></li>
		</ul>
		<%}else{%>
			<li><a>WELCOME, &nbsp;<%out.print(session.getAttribute("username")); %></a></li>
		<%}%>
		</ul>
	</div>
</div>
<!-- /.container --> </nav>