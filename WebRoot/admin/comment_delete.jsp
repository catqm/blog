<%@page import="dal.Comment"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	Comment comment = new Comment();
	int result = 0;
	result = comment.delete(Integer.parseInt(request.getParameter("id")));
	if(result==1){
		out.println("<script>alert('博文评论删除成功');window.location.href('/blog/admin/admin_comment.jsp?aid="+request.getParameter("aid")+"');</script>");
	}else{
		out.println("<script>alert('博文评论删除失败');window.location.href('/blog/admin/admin_comment.jsp?aid="+request.getParameter("aid")+"');</script>");
	}
%>