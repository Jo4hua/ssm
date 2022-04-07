<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="database.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.headdiv{
		width:100%;
	}
	.headtable{
		width:100%;
	}
	a:link{
		text-decoration:none;
	}
	a:visited{
		text-decoration:none;
		color:black;
	}
	a:hover{
		text-decoration:none;
	}
	.a{
		color:black;
	}
	.a:hover{
		background:rgb(88,87,86);
	}
</style>
</head>
<body>
<%
	User user=(User)request.getSession().getAttribute("user");
%>
<div class="headdiv">
	<table class="headtable">
		<tr>
			<td style="text-align:left">
			<div class="a" style="width:20%">
				<a href="index.jsp">
				<img alt="主页" src="temp/images/home.png" height="23"/>主页
				</a>
			</div>
			</td>
			<td style="text-align:right;margin:-4px">
				<%if(user!=null){ %>
				<a class="a" href="personal.jsp"><img style="border-radius:60px;" src="<%=user.getPath()%>" width="23" height="23"></a>
				&nbsp;&nbsp;
				${user.name}&nbsp;&nbsp;<a class="a" href="LogoutServlet">注销</a>
				<%} else{%>
				<a class="a" href="login.jsp">未登录</a>
				<%} %>
			</td>
		</tr>
	</table>
	<hr >
</div>
</body>
</html>