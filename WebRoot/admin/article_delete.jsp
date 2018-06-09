<%@page import="common.DataConverter"%>
<%@page import="dal.Article"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	Article article = new Article();
	int result = 0;
	result = article.delete(DataConverter.toInt(request.getParameter("id")));
	if(result==1){
		out.println("<script>alert('博文删除成功');</script>");
	}else{
		out.println("<script>alert('博文删除失败');</script>");
	}
	//response.sendRedirect("/blog/admin/admin_article.jsp");
%>