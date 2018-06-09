<%@page import="model.ClassInfo"%>
<%@page import="dal.Class"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>分类管理页</title>

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
			<td>&nbsp;&nbsp;&nbsp;您当前位置：分类管理</td> <br />
			<table bgcolor="#637074">
				<tr>
					<td height="27" align="center" bgcolor="#FFFFFF">ID</td>
					<td height="27" align="center" bgcolor="#FFFFFF">分类名称</td>
					<td height="27" align="center" bgcolor="#FFFFFF">操作</td>
				</tr>
				<%
					request.setCharacterEncoding("utf-8");
					Class cls = new Class();
					List<ClassInfo> list = cls.getList();
					for (ClassInfo info : list) {
				%>
				<tr>
					<td height="28" align="center" bgcolor="#FFFFFF"><%=info.getId()%></td>
					<td height="28" align="center" bgcolor="#FFFFFF"><%=info.getName()%></td>
					<td height="28" align="center" bgcolor="#FFFFFF">
						<a href="/blog/admin/class_edit.jsp?id=<%=info.getId()%>&action=edit">编辑</a>
						&nbsp;&nbsp;|&nbsp;&nbsp; 
						<a href="/blog/admin/class_delete.jsp?id=<%=info.getId() %>">删除</a>
					</td>
				</tr>

				<%
					}
				%>
			</table>
			
			<a href="/blog/admin/class_add.jsp?action=add">添加</a>
		</div>
	</div>
	<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
