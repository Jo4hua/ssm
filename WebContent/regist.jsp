<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	var confirmMsg;
	var passMsg;
	var usernameMsg;
	var pass;
	var repass;
	var username;
	window.onload=function()
	{
		username=document.getElementById("username");
		pass=document.getElementById("pass");
		repass=document.getElementById("repass");
		confirmMsg=document.getElementById("confirmMsg");
		usernameMsg=document.getElementById("usernameMsg");
		passMsg=document.getElementById("passMsg");
	}
	function checkForm()
	{
		var flag1=checkConfirm();
		var flag2=checkpass();
		var flag3=checkname();
		return flag1 && flag2 && flag3;
	}
	function checkpass()
	{
		var value=pass.value;
		var msg="";
		if(!value)
			msg="密码必须填写";
		passMsg.innerHTML=msg;
		pass.parentNode.parentNode.style.color=msg==""?"black":"red";
		return msg=="";
	}
	function checkname()
	{
		var value=username.value;
		var msg="";
		if(!value)
			msg="用户名必须填写"
		usernameMsg.innerHTML=msg;
		username.parentNode.parentNode.style.color=msg==""?"black":"red";
		return msg=="";
	}
	function checkConfirm(){
		var nv=pass.value;
		var renv=repass.value;
		var msg="";
		if(!renv)
		{
			msg="确认密码必须填写";
		}
		else if(nv!=renv)
		{
			msg="两次密码必须保持一致";
		}
		confirmMsg.innerHTML=msg;
		repass.parentNode.parentNode.style.color=msg==""?"black":"red";
		return msg=="";
	}
</script>
<body>
<%@include file="head.jsp"%>
<div style="wdith:100%;heigth:500px;margin:-18px" align="center">
	<div style="width:80%;height:500px;background:rgb(248,248,255,0.5);">
		<div style="width:80%;margin-left:20px" align="left"><h2>注册</h2></div>
		<form action="regiestServlet" method="post" onsubmit="return checkForm()">
		<div style="width:80%;"align="center" >
			<table cellspacing="30px" style="width:100%">
				<tr>
					<td style="width:12%">
					用户名：
					</td>
					<td style="width:30%">
					<input type="text" id="username" name="name" placeholder="请输入用户名" onkeyup="checkname();">
					</td>
					<td style="width:55%">
						<span id="usernameMsg"></span>&nbsp;
					</td>
				</tr>
				<tr>
					<td>
					性别：
					</td>
					<td>
						<select name="gender">
							<option value="请选择性别" selected disabled hidden>--请选择性别--</option>
							<option value="男">男</option>
							<option value="女">女</option>
							<option value="保密">保密</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						年龄：
					</td>
					<td>
						<input type="text" name="age" placeholder="请输入您的年龄">
					</td>
				</tr>
				<tr>
					<td>
						所在地：
					</td>
					<td>
					<input type="text" name="local" placeholder="请输入所在地">
					</td>
				</tr>
				<tr>
					<td>
						密码：
					</td>
					<td>
						<input type="password" id="pass" name="pass" placeholder="请输入密码" onkeyup="checkpass();">
					</td>
					<td>
						<span id="passMsg"></span>&nbsp;
					</td>
				</tr>
								<tr>
					<td>
						确认密码：
					</td>
					<td>
						<input type="password" id="repass"name="repass" onkeyup="checkConfirm();" placeholder="确认密码">
					</td>
					<td>
						<span id="confirmMsg"></span>&nbsp;
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="注册">
						<input type="reset" value="重置">
					</td>
				</tr>
			</table>
		</div>
		</form>
	</div>
</div>
<%@include file="bottom.jsp" %>
</body>
</html>