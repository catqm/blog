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

<title>后台管理页</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="/blog/css/register.css">
<link rel="stylesheet" type="text/css" href="/blog/css/common.css">
</head>

<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="register">
		<div class="reg_table">
			<span class="font2">管理员登录</span>
			<form action="AdminLogin" method="post">
				<table class="reg_table">
					<tr>
						<td class="tab_td1">输入用户名：</td>
						<td class="tab_td2"><input type="text" name="username"></td>
					</tr>
					<tr>
						<td class="tab_td1">输入密码：</td>
						<td><input type="password" name="password"></td>
					</tr>

					<tr>
						<td class="tab_td1"></td>
						<td><input type="submit" value="   登      录       "
							class="sub" /></td>
						<td></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
