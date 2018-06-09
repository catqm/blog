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

<title>文章效果展示</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="/blog/css/read.css">
<link rel="stylesheet" type="text/css" href="/blog/css/common.css">

</head>
<%
	String nickname = (String) session.getAttribute("nickname");
	String username = (String) session.getAttribute("username");
	if (username == null) {
		request.setAttribute("msg", "您还没有登录");
		request.getRequestDispatcher("blog/public/index.jsp");
		return;
	}
%>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="read">
		<div class="title">
			<h1>${title}</h1>
			<ul class="info">
				<li>作者：<a href="#">${nickname}</a> &nbsp;&nbsp;|
				</li>
				<li>&nbsp;&nbsp;分类：<a href="#">${classname}</a> &nbsp;&nbsp;|
				</li>
				<li>&nbsp;&nbsp;${time} &nbsp;&nbsp;|</li>
				<li>&nbsp;&nbsp;评论(0) &nbsp;&nbsp;|</li>
				<li>&nbsp;&nbsp;点击(1)</li>
			</ul>
		</div>
		<div class="content">
			<p>${content}</p>
		</div>

	</div>
	<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
