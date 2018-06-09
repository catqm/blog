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

<title>个人主页</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="/blog/css/home.css">
<link rel="stylesheet" type="text/css" href="/blog/css/common.css">
</head>
<%
	String username = request.getParameter("username");

	Article article = new Article();
	List<ArticleInfo> list = article.getListBySomeone(username);
%>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="home">
		<div class="nav">
			<div class="name"><%=username%></div>
			<div class="idiograph">个性签名：他很懒啥也没写</div>

		</div>

		<div class="article">
			<div class="title">博文</div>

			<%
				if (list == null || list.size() < 1) {
					out.print("暂时没有写过文章");
				} else {
					for (ArticleInfo a : list) {
			%>
			<div class="content">
				<div class="t">
					<a href="/blog/public/read.jsp?id=<%=a.getId()%>"><%=a.getTitle()%></a>
				</div>
				<div class="z">分类：<%=a.getClassname()%>&nbsp;&nbsp;|&nbsp;&nbsp;<%=a.getTime()%></div>
			</div>

			<%
				}
				}
			%>
		</div>

	</div>
	<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
