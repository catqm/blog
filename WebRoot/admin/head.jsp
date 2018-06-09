<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<link rel="stylesheet" type="text/css" href="/blog/css/head.css">
<link rel="stylesheet" type="text/css" href="/blog/css/common.css">

<script type="text/javascript">

	function changeBG(o) {
		o.style.backgroundColor = "#637074";
	}
	function changeBG2(o) {
		o.style.backgroundColor = "#212227";
	}
</script>

<div class="head">
	<div class="logo">
		<a class="anavi" href="/blog/index.jsp">Literature</a>
	</div>
	<ul class="nav_1">
		<li onmouseover="changeBG(this)" onmouseout="changeBG2(this)"><a
			class="anavi" href="/blog/user/index.jsp">首页</a></li>
		<li onmouseover="changeBG(this)" onmouseout="changeBG2(this)"><a
			class="anavi" href="/blog/user/home.jsp">个人页面</a></li>
		<li onmouseover="changeBG(this)" onmouseout="changeBG2(this)"><a
			class="anavi" href="ListAllArticle">分类</a></li>
		<li onmouseover="changeBG(this)" onmouseout="changeBG2(this)"><a
			class="anavi" href="/blog/admin/bacmage.jsp">管理员</a></li>
		<li onmouseover="changeBG(this)" onmouseout="changeBG2(this)"><a
			class="anavi" href="/blog/public/aboutus.jsp">关于我们</a></li>
	</ul>
	<div class="search">
		<form id="saerch" name="search" method="post" action="Search">
			<input id="search" name="search" autocomplete="off"
				data-provide="typeahead" type="text" style="background: white"
				placeholder="输入关键字以搜索" />
		</form>
	</div>
</div>

