<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.left{
		float:left;
		background:rgb(0,0,0);
		width:10%;
		height:475px;
		color:white;
	}
	.right{
		float:left;
		width:90%;
		height:475px;
	}
	.l_a:link{
		color:white;
		text-decoration:none;
	}
	.l_a:visited{
		text-decoration:none;
		color:white
	}
	.l_a:hover{
		text-decoration:none;
		color:black;
	}
	.box:hover{
		background:white;
	}
</style>
</head>
<body>
<%@include file="head.jsp" %>
<div style="height:500px;width:100%;border:1px solid;" >
<fieldset style="height:490px;">
		<legend><a href="index.jsp">首页</a>>><a href="personal.jsp">个人中心</a>>><a href="personal.jsp">个人信息</a></legend>
		<div class="left">
			<div class="box" style="margin:100px  200px auto auto;width:100%;text-align:center">
			<a class="l_a" href="personal.jsp">个人信息</a>
			</div>
			<div class="box" style="margin:200px  100px auto auto;width:100%;text-align:center">
			<a class="l_a" href="change_pw.jsp">修改密码</a>
			</div>
		</div>
		<div class="right" align="center">
			<div style="height:470px;width:80%;background:rgb(202,225,245,0.5);">
			<div style="width:100px;height:100px;border-radius:60px;margin:0px 0px 0 60px;">
				<%if(user.getPath()!=null){%>
				<a href="changeH.jsp"><img title="点此更换头像" style="border-radius:60px;" src="<%=user.getPath()%>" width="100" height="100"></a>
				<%} %>
			</div>
			<div style="margin:20px 20px 10px auto" align="center">
				<form action="SaveServlet" method="post">
					<table cellspacing="40px" style="text-align:right;width:40%" align="center"> 
						<tr>
							<td >
								用户名：
								<input type="text" value="<%=user.getName() %>" name="name" readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<td>
								性别：
								<input type="text" value="<%=user.getGender() %>" name="gender" />
							</td>
						</tr>
						<tr>
							<td>
								年龄：
								<input type="text" value="<%=user.getAge() %>" name="age" />
							</td>
						</tr>
						<tr>
							<td>
								所在地：
								<input type="text" value="<%=user.getLocal() %>" name="local" />
							</td>
						</tr>
					</table>
					<div style="margin:10px 10px 10px 60px"align="center">
							<input type="submit" value="保存">
							<input type="reset" value="重置"><br >
							${Msg}
					</div>
				</form>
			</div>
		</div>
		</div>
</fieldset>
</div>
<%@include file="bottom.jsp" %>
</body>
</html>