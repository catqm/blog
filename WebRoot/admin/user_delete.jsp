<%@page import="dal.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	User user = new User();
	int result = 0;
	result = user.delete(request.getParameter("username"));
	if(result==1){
		out.println("<script>alert('用户删除成功');</script>");
	}else{
		out.println("<script>alert('用户删除失败');</script>");
	}
	//response.sendRedirect("/blog/admin/admin_user.jsp");
 %>