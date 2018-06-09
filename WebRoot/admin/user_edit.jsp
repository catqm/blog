<%@page import="model.UserInfo"%>
<%@page import="dal.User"%>
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

<title>用户编辑页</title>

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
	String action = request.getParameter("action");
	String pageAction = "";
	String username = request.getParameter("username");
	UserInfo info = new UserInfo();
	User user = new User();

	//保存
	if ("update".equals(action)) {
		info = user.getUser(username);
		if (info == null) {
			out.println("<script>alert('用户ID有误');window.location.href('/blog/admin/admin_user.jsp');</script>");
		}
		info.setUsername(username);
		info.setNickname(request.getParameter("nickname"));
		info.setPower(request.getParameter("power"));
		if ("update".equals(action)) {
			user.update(info);
		}
		response.sendRedirect("/blog/admin/admin_user.jsp");
	}

	//编辑
	if ("edit".equals(action)) {
		info = user.getUser(username);
		pageAction = "update";
	}
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
			<td>&nbsp;&nbsp;&nbsp;您当前位置：用户编辑</td> <br />
			<form method="post" action="/blog/admin/user_edit.jsp">
				<table bgcolor="#637074">
					<tr>
						<td align="center" bgcolor="#FFFFFF">用户名</td>
						<td align="center" bgcolor="#FFFFFF"><input type="text"
							name="username" id="username" width="500px"
							value="<%=info.getUsername()%>" readonly="readonly"></td>
					</tr>
					<tr>
						<td align="center" bgcolor="#FFFFFF">昵称</td>
						<td align="center" bgcolor="#FFFFFF"><input type="text"
							name="nickname" id="nickname" width="500px"
							value="<%=info.getNickname()%>"></td>
					</tr>
					<tr>
						<td align="center" bgcolor="#FFFFFF">身份</td>
						<td align="center" bgcolor="#FFFFFF"><select name="power">
								<option value="admin">管理员</option>
								<option value="user">一般用户</option>
						</select></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" name="buttton"
							id="button" value="提交" /> <input type="reset" name="buttton2"
							id="button2" value="重置" /> <input type="hidden" name="action"
							id="action" value="<%=pageAction%>" /> <input type="hidden"
							name="username" id="username" value="<%=info.getUsername()%>" />
						</td>
					</tr>

				</table>
			</form>
		</div>
	</div>
	<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
