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
	<div class="home">
		<div class="nav">
			<div class="name"><%=nickname%></div>
			<div class="idiograph">
				个性签名：他很懒啥也没写 <a class="anavi2" href="#">编辑</a>
			</div>
			<div class="upload">
				<a class="anavi2" href="/blog/user/write.jsp">写博文</a>
			</div>
		</div>

		<div class="article">
			<div class="title">博文</div>

			<%
				Article article = new Article();
				List<ArticleInfo> list = article.getListBySomeone(username);
				if (list == null || list.size() < 1) {
					out.print("暂时没有写过文章");
				} else {
					for (ArticleInfo a : list) {
			%>
			<div class="content">
				<div class="t">
					<a href="/blog/public/read.jsp?id=<%=a.getId()%>"><%=a.getTitle()%></a>
				</div>
				<div class="z">
					分类：<%=a.getClassname()%>&nbsp;&nbsp;|&nbsp;&nbsp;<%=a.getTime()%></div>
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
