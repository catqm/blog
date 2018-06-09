<%@page import="dal.Article"%>
<%@page import="model.ArticleInfo"%>
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

<title>首页</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->


<link rel="stylesheet" type="text/css" href="/blog/css/index.css">
<link rel="stylesheet" type="text/css" href="/blog/css/common.css">

</head>
<%
	String username = (String) session.getAttribute("username");
	String nickname = (String) session.getAttribute("nickname");
	if (username == null) {
		request.setAttribute("msg", "您还没有登录");
		request.getRequestDispatcher("blog/public/index.jsp");
		return;
	}
%>

<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="index">

		<div class="reg_login">
			<form action="Login" method="post">
				<div class="logForm">
					<b><a class="anavi2" href="/blog/user/home.jsp"><%=nickname%></a>,您好！</b>
				</div>
			</form>
			<div class="reg">
				<span class="font1"><%=nickname%></span><br /> <a class="anavi2"
					href="/blog/user/write.jsp">写博文</a>
			</div>
		</div>
		<div class="list">
			<div class="hot">
				<div class="title">热门</div>
				<%
					Article article = new Article();
					List<ArticleInfo> list1 = article.getHot();
					if (list1 == null || list1.size() < 1) {
						out.print("无数据");
					} else {
						for (ArticleInfo a : list1) {
				%>
				<div class="content">
					<div class="t">
						<a href="/blog/public/read.jsp?id=<%=a.getId()%>"><%=a.getTitle()%></a>
					</div>
					<div class="z">
						作者：<a href="/blog/public/home.jsp?username=<%=a.getUsername()%>"><%=a.getUsername()%></a>
						&nbsp;&nbsp;|&nbsp;&nbsp;<%=a.getTime()%>&nbsp;&nbsp;|&nbsp;&nbsp;点击（<%=a.getClick()%>）
					</div>
				</div>
				<%
					}
					}
				%>
			</div>

			<div class="new">
				<div class="title">最新</div>
				<%
					List<ArticleInfo> list = article.getNew();
					if (list == null || list.size() < 1) {
						out.print("无数据");
					} else {
						for (ArticleInfo b : list) {
				%>
				<div class="content">
					<div class="t">
						<a href="/blog/public/read.jsp?id=<%=b.getId()%>"><%=b.getTitle()%></a>
					</div>
					<div class="z">
						作者：<a href="/blog/public/home.jsp?username=<%=b.getUsername()%>"><%=b.getUsername()%></a>
						&nbsp;&nbsp;|&nbsp;&nbsp;<%=b.getTime()%>&nbsp;&nbsp;|&nbsp;&nbsp;点击（<%=b.getClick()%>）
					</div>
				</div>

				<%
					}
					}
				%>
			</div>
		</div>
	</div>
	<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
