
<%@page import="model.UserInfo"%>
<%@page import="dal.User"%>
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

<title>用户管理页</title>
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
			<td>&nbsp;&nbsp;&nbsp;您当前位置：用户管理</td> <br />
			<table bgcolor="#637074">
				<tr>
					<td height="27" align="center" bgcolor="#FFFFFF">用户名</td>
					<td height="27" align="center" bgcolor="#FFFFFF">昵称</td>
					<td height="27" align="center" bgcolor="#FFFFFF">身份</td>
					<td height="27" align="center" bgcolor="#FFFFFF">操作</td>
				</tr>
				<%
					User u = new User();
					List<UserInfo> list = u.getList();
					if (list == null || list.size() < 1) {
						out.print("暂无数据");
					} else {
						for (UserInfo user : list) {
				%>
				<tr>
					<td height="28" align="center" bgcolor="#FFFFFF"><%=user.getUsername()%></td>
					<td height="28" align="center" bgcolor="#FFFFFF"><%=user.getNickname()%></td>
					<td height="28" align="center" bgcolor="#FFFFFF"><%=user.getPower()%></td>
					<td height="28" align="center" bgcolor="#FFFFFF"><a href="/blog/admin/user_edit.jsp?username=<%=user.getUsername() %>&action=edit">编辑</a>
						&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; <a href="/blog/admin/user_delete.jsp?username=<%=user.getUsername() %>">删除</a></td>
				</tr>
				<%
					}
					}
				%>
			</table>
		</div>
	</div>
	<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
