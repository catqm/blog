<%@page import="dal.Class"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	Class cls = new Class();
	int result = 0;
	result = cls.delete(Integer.parseInt(request.getParameter("id")));
	if(result==1){
		out.println("<script>alert('分类删除成功');</script>");
	}else{
		out.println("<script>alert('分类删除失败');</script>");
	}
	//response.sendRedirect("/blog/admin/admin_class.jsp");
%>
