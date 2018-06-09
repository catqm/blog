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

<title>关于我们</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="/blog/css/aboutus.css">
<link rel="stylesheet" type="text/css" href="/blog/css/common.css">
</head>

<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="about">
		<h1>关于我们</h1>
		<p>
			本网站旨在构建一个读书交流平台，以供读者分享自己的独到见解。其内容涉及：古典文学、现代文学（那四个）方面。<br>本网站将向着共享化、全面化、专业化发展，全心打造最专业的读书分享类博客，
			给读者提供一个发表自己观点，同时还能发现他人见解的独到之处的平台。
		</p>
		<h4>未来展望</h4>
		<p>希望在你我共同的努力下，将独树一帜打造成一个帮助人们创作，传播和发现文化、文学内容，鼓励人们阅读的领先社交媒体平台。</p>
		<h4>法律声明</h4>
		<p>本站仅为用户提供本人原创作品的上传空间服务，请各位用户务必上传自己的原创作品，请勿侵犯他人的知识产权及相关权利。</p>
		<p>本站不会对用户上传的作品内容作任何形式的编辑修改，一切法律责任由上传人承担。</p>
		<p>如果阁下是某一作品的著作权人和/或依法可以行使信息网络传播权的权利人，且您认为本站上用户上传内容侵犯了您对该等作品的信息网络传播权，请阁下务必书面通知本公司，阁下应对书面通知陈述之真实性负责。</p>
		<p>
			本站将根据相关法律规定采取措施删除相关内容。<br>
		</p>
		<p>如果您对我们的网站有宝贵的建议可联系我们：</p>
		<p>email:literature@163.com</p>
	</div>
	<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
