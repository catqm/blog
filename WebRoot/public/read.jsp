<%@page import="dal.Comment"%>
<%@page import="model.CommentInfo"%>
<%@page import="model.ArticleInfo"%>
<%@page import="dal.Article"%>
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

<title>浏览文章</title>

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
<script type="text/javascript" src="blog/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="blog/ckeditor/config.js"></script>
<script type="text/javascript">
	CKEDITOR.replace('content');
</script>
</head>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	Article article = new Article();
	ArticleInfo info = article.getArticleInfo(id);
	Comment comment = new Comment();
	List<CommentInfo> com = comment.getListByArticleId(info.getId());
	info.setClick(info.getClick()+1);
	article.updateClick(info);
%>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="read">
		<div class="title">
			<h1><%=info.getTitle()%></h1>
			<ul class="info">
				<li>作者：<a href="#"><%=info.getUsername()%></a> &nbsp;&nbsp;|
				</li>
				<li>&nbsp;&nbsp;分类：<a href="#"><%=info.getClassname()%></a>
					&nbsp;&nbsp;|
				</li>
				<li>&nbsp;&nbsp;<%=info.getTime()%> &nbsp;&nbsp;|
				</li>
				<li>&nbsp;&nbsp;评论(<%=com.size()%>)&nbsp;&nbsp;|
				</li>
				<li>&nbsp;&nbsp;点击(<%=info.getClick() %>)</li>
			</ul>
		</div>
		<div class="content">
			<p><%=info.getContent()%></p>
		</div>

		<div class="comment">
			<h2>
				<b>评论:</b>
			</h2>
			<%
				if (com == null || com.size() < 1) {
					out.print("暂无评论");
				} else {
					for (CommentInfo c : com) {
			%>
			<div class="com">
				<div class="name"><%=c.getUsername()%>：
				</div>
				<div class="word"><%=c.getContent()%></div>
			</div>

			<%
				}
				}
			%>
			<div class="text">
				<form id="comment" name="comment" method="post"
					action="InputComment?id=<%=info.getId()%>">
					<textarea name="content" id="content"></textarea>
					<input class="sub" name="sub" type="submit" value="提交">
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
