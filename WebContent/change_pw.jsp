<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var confirmMsg;
	var pass;
	var repass;
	window.onload=function()
	{
		pass=document.getElementById("new");
		repass=document.getElementById("renew");
		confirmMsg=document.getElementById("confirmMsg");
	}
	function checkForm()
	{
		var flag=checkConfirm();
		return flag;
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
		<legend><a href="index.jsp">首页</a>>><a href="personal.jsp">个人中心</a>>><a href="change_pw.jsp">修改密码</a></legend>
		<div class="left">
			<div class="box" style="margin:100px  200px auto auto;width:100%;text-align:center">
			<a class="l_a" href="personal.jsp">个人信息</a>
			</div>
			<div class="box" style="margin:200px  100px auto auto;width:100%;text-align:center">
			<a class="l_a" href="change_pw.jsp">修改密码</a>
			</div>
		</div>
		<div class="right" align="center">
			<div style="height:250px;width:80%;background:rgb(202,225,245,0.5);">
				<div style="width:80%" align="left">
					<div style="padding:30px">
					<form action="PasswdServlet" method="post" onsubmit="return checkForm()">
						<table cellpadding="10px" >
							<tr>
								<td>
									<font face="楷体" size="4">输入旧密码:</font>
								</td>
								<td>
									<input type="password" id="old" name="old" placeholder="输入旧密码">
								</td>
							</tr>
							<tr>
								<td>
									<font face="楷体" size="4">输入新密码:</font>
								</td>
								<td>
									<input type="password" id="new" name="new" placeholder="输入新密码">
								</td>
							</tr>
							<tr>
								<td>
									<font face="楷体" size="4">确认新密码:</font>
								</td>
								<td>
									<input type="password" id="renew" name="renew" placeholder="确认新密码" onkeyup="checkConfirm();">
								</td>
								<td>
									<span id="confirmMsg"></span>&nbsp;
								</td>
							</tr>
							<tr>
								<td align="center" colspan="2">
									<input type="submit" value="确认">
								</td>
							</tr>
							<tr>
								<td>
								${Msg}
								</td>
							</tr>
						</table>
						</form>
					</div>
				</div>
			</div>
				<font color="grey">*修改密码时请注意保护隐私</font>
		</div>
</fieldset>
</div>
<%@include file="bottom.jsp" %>
</body>
</html>