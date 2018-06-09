<%@page import="model.CommentInfo"%>
<%@page import="dal.Comment"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>评论管理页</title>
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<link rel="stylesheet" type="text/css" href="/blog/css/manage.css">
<link rel="stylesheet" type="text/css" href="/blog/css/common.css">
</head>
<%
	request.setCharacterEncoding("utf-8");
	Comment com = new Comment();
	int aid = Integer.parseInt(request.getParameter("aid"));
	List<CommentInfo> list= com.getListByArticleId(aid);
 %>

<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="all">
		<table class="left">
			<td width="88%">功能菜单</td>
			<tr>
				<td width="82%"><a href="/blog/admin/admin_class.jsp">分类管理</a></td>
			</tr>
			<tr>
				<td width="82%"><a href="/blog/admin/admin_article.jsp">文章管理</a></td>
			</tr>
			<tr>
				<td width="82%"><a href="/blog/admin/admin_user.jsp">用户管理</a></td>
			</tr>
		</table>
		<div class="right">
			<td>&nbsp;&nbsp;&nbsp;您当前位置：评论管理</td> <br />
			<table bgcolor="#637074">
				<tr>
					<td height="27" align="center" bgcolor="#FFFFFF">评论内容</td>
					<td height="27" align="center" bgcolor="#FFFFFF">评论人</td>
					<td height="27" align="center" bgcolor="#FFFFFF">操作</td>
				</tr>
				<%
						for (CommentInfo info : list) {
				%>
				<tr>
					<td height="28" align="center" bgcolor="#FFFFFF"><%=info.getContent() %></td>
					<td height="28" align="center" bgcolor="#FFFFFF"><%=info.getUsername() %></td>
					<td height="28" align="center" bgcolor="#FFFFFF">
						<a href="/blog/admin/comment_delete.jsp?id=<%=info.getId() %>&aid=<%=info.getAid()%>">删除</a>
					</td>
				</tr>

				<%
					}
				%>
			</table>
		</div>
	</div>
	<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
