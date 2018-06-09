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

<title>注册</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css"
	href="/blog/css/register.css">
<link rel="stylesheet" type="text/css"
	href="/blog/css/common.css">

</head>

<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="register">
		<div class="reg_table">
			<span class="font2">用户注册</span>
			<form action="Register" method="post">
				<table class="regtable">
					<tr>
						<td class="tab_td1">输入账号：</td>
						<td class="tab_td2"><input type="text" name="username"></td>
						<td><span class="spanVal">${msg1}</span></td>
					</tr>
					<tr>
						<td class="tab_td1">输入密码：</td>
						<td><input type="password" name="password"></td>
						<td><span class="spanVal">${msg2}</span></td>
					</tr>
					<tr>
						<td class="tab_td1">重复密码：</td>
						<td><input type="password" name="repassword"></td>
						<td><span class="spanVal">${msg3}</span></td>
					</tr>
					<tr>
						<td class="tab_td1">昵称：</td>
						<td><input type="text" name="nickname"></td>
						<td><span class="spanVal"></span></td>
					</tr>
					<tr>
					<tr>
						<td class="tab_td1">密码保护问题：</td>
						<td><input type="text" name="question"></td>
						<td><span class="spanVal">${msg}</span></td>
					</tr>
					<tr>
						<td class="tab_td1">密码保护回答：</td>
						<td><input type="text" name="answer"></td>
						<td><span class="spanVal">${msg}</span></td>
					</tr>
					<tr>
						<td class="tab_td1"></td>
						<td><input type="submit" value="   注    册      " class="sub" /></td>
						<td></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
