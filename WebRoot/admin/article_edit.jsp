<%@page import="common.Utility"%>
<%@page import="model.ArticleInfo"%>
<%@page import="dal.Article"%>
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

<title>文章编辑页</title>

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
	int id = Integer.parseInt(request.getParameter("id"));
	Article article = new Article();
	ArticleInfo info = new ArticleInfo();

	//保存
	if ("update".equals(action) || "insert".equals(action)) {
		if ("update".equals(action)) {
			info = article.getArticleInfo(id);
			if (info == null) {
				out.println(
						"<script>alert('博文ID有误');window.location.href('/blog/admin/admin_user.jsp');</script>");
			}
			info.setId(id);
		}
		info.setTitle(request.getParameter("title"));
		info.setClassid(Integer.parseInt(request.getParameter("id")));
		info.setContent(request.getParameter("content"));
		if ("insert".equals(action)) {
			info.setTime(Utility.getNowDateTime());
			article.insert(info);
		}else{
			article.update(info);
		}
		response.sendRedirect("/blog/admin/admin_article.jsp");
	}

	//编辑
	if ("edit".equals(action)) {
		info = article.getArticleInfo(id);
		pageAction = "update";
	}
	
	//添加
	if("add".equals(action)){
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
			<td>&nbsp;&nbsp;&nbsp;您当前位置：文章编辑</td> <br />
			<form method="post" action="/blog/admin/article_edit.jsp?id=<%=info.getId()%>">
				<table bgcolor="#637074" width="100%">
					<tr>
						<td align="center" bgcolor="#FFFFFF">标题</td>
						<td align="center" bgcolor="#FFFFFF"><input type="text"
							name="title" id="title" width="500px"
							value="<%=info.getTitle()%>"></td>
					</tr>
					<tr>
						<td align="center" bgcolor="#FFFFFF">文章类别</td>
						<td align="center" bgcolor="#FFFFFF"><select name="class">
								<%
									Class cls = new Class();
									List<ClassInfo> list = cls.getList();
									for (ClassInfo cinfo : list) {
								%>

								<option value="<%=cinfo.getId()%>"
									<%if (cinfo.getId() == info.getClassid())
					out.print("selcted");%>>
									<%=cinfo.getName()%>
								</option>

								<%
									}
								%>
						</select></td>
					</tr>
					<tr>
						<td align="center" bgcolor="#FFFFFF">文章内容</td>
						<td align="center" bgcolor="#FFFFFF">
							<textarea name="content" id="content" rows="20" cols="100">
								<%=info.getContent()%>
							</textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" name="buttton"
							id="button" value="提交" /> <input type="reset" name="buttton2"
							id="button2" value="重置" /> <input type="hidden" name="action"
							id="action" value="<%=pageAction%>" />
						</td>
					</tr>

				</table>
			</form>
		</div>
	</div>
	<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
