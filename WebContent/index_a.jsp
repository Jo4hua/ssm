<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="database.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.xbox{
		width:80%;
		height:500px;
		background:rgba(255, 255, 255,0.85);
	}
	.box{
		background:url("temp/images/back.jpg") no-repeat;
		background-size:100% 500px;
	}
	.one{
		margin:60px;
		width:60%;
		height:60px;
		border-radius:30px;
	}
	
	.one:hover{
		background:white;
	}
</style>
</head>
<body>
<%@include file="head.jsp"%>
<div style="width:100%;height:500px;" class="box" align="center">
	<div class="xbox" align="center">
	<div>
		<font size="7">欢迎你，<%=(user.getPower()==2)?"超级管理员":"管理员" %>${user.name}</font>
	</div>
		<div class="one">
		<a href="FindAllServlet?num=1&id="><font face="黑体" size="6">供应商信息管理</font></a>
		</div>
		
		<div class="one">
			<%if(user.getPower()==2){ %>
			<a href="AdminServlet?num=1&name="><font face="黑体" size="6">全部用户管理</font></a>
			<%}else{ %>
			<a href="SearchUser?num=1&name="><font face="黑体" size="6">用户信息管理</font></a>
			<%} %>
		</div>
		
		<div class="one">
		<a href="personal.jsp"><font face="黑体" size="6">个人中心</font></a>
		</div>
	</div>
</div>
<%@include file="bottom.jsp"%>
</body>
</html>