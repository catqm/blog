<%@page import="common.DataConverter"%>
<%@page import="model.ClassInfo"%>
<%@page import="dal.Class"%>
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

<title>分类编辑页</title>

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
	int id = DataConverter.toInt(request.getParameter("id"));
	System.out.println(id);
	Class cls =new Class();
	ClassInfo info = new ClassInfo();

	//保存	
	if ("update".equals(action) || "insert".equals(action)) {
		if ("update".equals(action)) {
			info = cls.getClassInfo(id);
			if (info == null) {
				out.println(
						"<script>alert('分类ID有误');window.location.href('/blog/admin/admin_class.jsp');</script>");
			}
			info.setId(id);
		}
		info.setName(request.getParameter("name"));
		
		if ("insert".equals(action)) {
			cls.insert(info);
		}else{
			cls.update(info);
		}
		response.sendRedirect("/blog/admin/admin_class.jsp");
	}

	//编辑
	if ("edit".equals(action)) {
		info = cls.getClassInfo(id);
		pageAction = "update";
	}

	//添加
	if ("add".equals(action)) {
		pageAction = "insert";
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
			<td>&nbsp;&nbsp;&nbsp;您当前位置：分类编辑</td> <br />
			<form method="post" action="/blog/admin/class_edit.jsp?id=<%=info.getId() %>">
				<table bgcolor="#637074" width="100%">
					<tr>
						<td align="center" bgcolor="#FFFFFF">ID</td>
						<td align="center" bgcolor="#FFFFFF"><input type="text"
							name="id" id="id" width="500px"
							value="<%=info.getId()%> " readonly="readonly"> </td>
					</tr>
					<tr>
						<td align="center" bgcolor="#FFFFFF">分类名称</td>
						<td align="center" bgcolor="#FFFFFF"><input type="text"
							name="name" id="name" width="500px"
							value="<%=info.getName()%> " ></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" name="buttton"
							id="button" value="提交" /> <input type="reset" name="buttton2"
							id="button2" value="重置" /> <input type="hidden" name="action"
							id="action" value="<%=pageAction%>" /></td>
					</tr>
				</table>
			</form>
			
		</div>
	</div>
	<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
