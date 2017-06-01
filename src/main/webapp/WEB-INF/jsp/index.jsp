<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    %>
    <%@ include file="head.html" %>
    <!-- jQuery -->
    <script type="text/javascript" src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script type="text/javascript" src="js/bootstrap.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script type="text/javascript" src="js/clean-blog.js"></script>
    <script type="text/javascript">
        var r = false;
        // 验证message(留言板)
        function validate_message(object) {
            var author = object.author.value;
            var content = object.content.value;
            var code = object.code.value;

            if (author == null || author == "") {
                alert("昵称不能为空呦");
                return false;
            } else if (content == null || content == "") {
                alert("留言不能为空呦");
                return false;
            } else if (code == null || code == "") {
                alert("验证码不能为空呦");
                return false;
            }
            validateCode(author,content,code);
            if (r) {
                location.reload();
                return true;
            } else {
                alert("验证码错误");
                return false;
            }
        }
        $(function () {  //生成验证码
            $('#kaptchaImage').click(function () {
                $(this).hide().attr('src', '<%=path%>/captcha-image?' + Math.floor(Math.random() * 100)).fadeIn();
            });
        });
        window.onbeforeunload = function () {
            //关闭窗口时自动退出
            if (event.clientX > 360 && event.clientY < 0 || event.altKey) {
                alert(parent.document.location);
            }
        };
        function changeCode() {  //刷新
            $('#kaptchaImage').hide().attr('src', '<%=path%>/captcha-image?' + Math.floor(Math.random() * 100)).fadeIn();
            event.cancelBubble = true;
        }
        function validateCode(name,content,code) {
            var user = {
                name:name,
                content:content,
                code:code
            };

            $.ajax({
                data: user,
                type: "post",
                dataType: 'json',
                url: "message.do",
                async:false,
                error: function (data) {
                    alert("网络错误，请重试" );
                    console.log(data);
                    return false;
                },
                success: function (data) {
                    if (data.msg == 'true') {
                        r = true;
                    } else {
                        r = false;
                    }
                }
            });
        }
    </script>

</head>
<body>
<!-- header 导航栏 -->
<%@ include file="nav.jsp" %>
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
                <div>
                    <h3>Category</h3>
                    <a href="category?category=BlockChain">BlockChain</a><br/>
                    <a href="category?category=Java">Java</a><br/> <a
                        href="category?category=C/C++">C/C++</a><br/> <a
                        href="category?category=Python">Python</a><br/> <a
                        href="category?category=OS">OS</a><br/> <a
                        href="category?category=Mobile">Mobile</a><br/> <a
                        href="category?category=Net">Net</a><br/> <a
                        href="category?category=EveryDay">EveryDay</a><br/> <a
                        href="category?category=Music">Music</a><br/> <a
                        href="category?category=Film">Film</a><br/><!--
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

    <hr/>
    <div class="row">
        <div class="col-lg-2 col-md-2" style="word-break: break-all;">
            <div>
                <div>
                    <h3>留言</h3>

                </div>
            </div>
        </div>
        <!-- 留言提交 -->
        <div class="col-lg-10 col-md-10">
            <form onsubmit="return validate_message(this);">
                <div class="row control-group">
                    <div
                            class="form-group col-xs-12 floating-label-form-group controls">
                        <label>昵称</label>
                        <!-- 未显示 floating-label-form-group 控制-->
                        <input type="text" class="form-control" name="author" id="mesname"
                               placeholder="昵称"/>
                    </div>
                </div>
                <div class="row control-group">

                    <div
                            class="form-group col-xs-12 floating-label-form-group controls">
                        <label>留言</label> <input type="text" class="form-control" id="mescontent"
                                                 name="content" placeholder="留言"/>
                    </div>
                </div>

                <div class="row control-group">

                    <div
                            class="form-group col-xs-12 floating-label-form-group controls">
                        <label>验证码</label> <input name="code" type="text" id="kaptcha" maxlength="4"
                                                  class="form-control"
                                                  placeholder="验证码"/>
                    </div>
                </div>

                <div class="row control-group">

                    <div
                            class="form-group col-xs-12 floating-label-form-group controls">

                        <img src="<%=path%>/captcha-image" id="kaptchaImage"/>
                        <a href="javascript:void(0)" onclick="changeCode()">看不清?换一张</a>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-xs-12">
                        <a href="index">
                            <button type="submit" class="btn btn-default" >COMMIT</button>
                        </a>
                    </div>
                </div>
            </form>

        </div>
    </div>
    <!-- 留言板 -->
    <hr/>
    <div class="row">
        <div class="col-lg-2 col-md-2" style="word-break: break-all;">
            <div>
                <div id='tag-cloud'>
                    <h3>留言板</h3>

                </div>
            </div>
        </div>
        <div class="col-lg-10 col-md-10">

            <br/>
            <c:forEach var="message" items="${messages}">

                <label>${message.author}</label>
                <br/> ${message.content} <br/>
                ${message.date}
                <hr/>

            </c:forEach>

        </div>
    </div>
    <ul class="pager">
        <li class="next"><a href="messages">More Messages &rarr;</a></li>
    </ul>
</div>


<hr/>

<!-- Footer 网页底部 -->
<%@ include file="footer.html" %>


</body>
</html>