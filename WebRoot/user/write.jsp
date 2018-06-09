<%@page import="model.ClassInfo"%>
<%@page import="dal.Class"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>写文章</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="/blog/css/write.css">
<link rel="stylesheet" type="text/css" href="/blog/css/common.css">

<script type="text/javascript" src="blog/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="blog/ckeditor/config.js"></script>
<script type="text/javascript">
	CKEDITOR.replace('content');
</script>
</head>
<%
	String username = (String) session.getAttribute("username");
	if (username == null) {
		request.setAttribute("msg", "您还没有登录");
		request.getRequestDispatcher("blog/public/index.jsp");
		return;
	}
%>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="write">
		<form action="Write" method="post">
			<div class="title">
				<p>标题：</p>
				<input id="title" type="text" name="title">
			</div>
			<div class="content">
				<p>内容：</p>
				<br />
				<textarea name="content" id="content"> </textarea>
			</div>
			<input class="sub" name="sub" type="submit" value="提交"> 
			<select class="select" name="classid">
				<%
					Class cls = new Class();
					List<ClassInfo> list = cls.getList();
					for (ClassInfo cinfo : list) {
				%>

				<option value="<%=cinfo.getId()%>">
					<%=cinfo.getName()%>
				</option>
				<%
					}
				%>
			</select>
		</form>
	</div>
	<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
