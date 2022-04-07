<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.left{
		background:blue;
		width:70%;
		float:left;
		height:500px;
	}
	.right{
		width:30%;
		float:left;
		height:500px;
	}
</style>
</head>
<body>
<%@include file="head.jsp" %>
<div class="left">
<img  src="temp/images/wallhaven.jpg" width="100%" height="500px">
</div>
<div class="right">
<fieldset style="height:480px;">
	<legend><font size="4" face="楷体">用户登录界面</font></legend>
	<div align="center">
	<form action="Loginservlet" method="post">
	<table style="align:center;" cellspacing="70px">
		<tr>
			<td>
				<img src="temp/images/user.png" height="15px" width="15px"><font color="grey">用户名：</font>
				<input type="text" name="name"><br >${errorMsg}
			</td>
		</tr>
		<tr>
			<td>
				<img src="temp/images/passwd.png" height="15px" width="15px">&nbsp;<font color="grey">密&nbsp;&nbsp;码：</font>
				<input type="password" name="passwd">
			</td>
		</tr>
		<tr>
			<td align="center">
				<input type="submit" value="登陆">
				&nbsp;&nbsp;
				<input type="reset" value="重置"> 
			</td>
		</tr>
		<tr>
		<td align="right">
		<font color="red">${Msg }</font>&nbsp;<a href="regist.jsp">免费注册</a>
		</td>
		</tr>
	</table>
	</form>
	</div>
</fieldset>
</div>
<%@include file="bottom.jsp" %>
</body>
</html>