<%@ page import="model.ArticleInfo"%>
<%@ page import="dal.Article"%>
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

<title>分类</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<link rel="stylesheet" type="text/css" href="/blog/css/show.css">
<link rel="stylesheet" type="text/css" href="/blog/css/common.css">
</head>

<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="show">
		<div class="classname">
			<ul class="name">
				<li><a href="ListAllArticle">全部</a></li>
				<li><a href="ListByClass?id=1">现代文学</a></li>
				<li><a href="ListByClass?id=3">近代文学</a></li>
				<li><a href="ListByClass?id=4">当代文学</a></li>
				<li><a href="ListByClass?id=2">古代文学</a></li>
			</ul>
		</div>


		<div class="articleinfo">
			<%
				List<ArticleInfo> artiList = (List<ArticleInfo>) session.getAttribute("article");
				if (artiList == null || artiList.size() < 1) {
					out.print("暂无数据");
				} else {
					for (ArticleInfo article : artiList) {
			%>
			<div class="each">
				<h3>
					<a href="/blog/public/read.jsp?id=<%=article.getId()%>"><%=article.getTitle()%></a>
				</h3>
				<ul class="info">
					<li>作者：<a href="/blog/user/home.jsp?username='article.getUsername()'"><%=article.getUsername()%></a>&nbsp;&nbsp;|
					</li>
					<li>&nbsp;&nbsp;<%=article.getTime()%> &nbsp;&nbsp;|
					</li>
					<li>&nbsp;&nbsp;点击（<%=article.getClick() %>）</li>
				</ul>
			</div>
			<%
				}
				}
			%>
		</div>

		<div class="article_title"></div>
	</div>
	<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
