<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="database.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="head.jsp" %>
<div style="height:500px;width:100%;border:1px solid;">
<fieldset style="height:490px;">
		<legend><a href="index.jsp">首页</a>>><a href="AdminServlet?num=1&name=">用户管理界面</a></legend>
		<form method="post" action="AdminServlet?num=1">
			<div  align="center" style="width:100%;margin:20px"><!--查找 -->
				<input type="text" style="width:20%" name="name" placeholder="请输入要查询的用户的用户名" value="" >
				<input type="submit" value="查找">
			</div>
		</form>
			<div style="width:100%;height:260px;" align="center"><!--数据  -->
				<% 	Page p=(Page)request.getAttribute("page");
					List list=p.getList();
					if(list.size()!=0)
					{
				%>
				<table style="width:80%;text-align:center" border="1" cellspacing="0" align="center">
					<tr>
						<td>
							用户名：
						</td>
						<td>
							性别：
						</td>
						<td>
							年龄：
						</td>
						<td>
							地址：
						</td>
						<td>
							权限
						</td>
						<td>
							<font color="grey">*超级管理员可以对用户和管理员进行操作，小心执行操作</font>
						</td>
					</tr>
				<%for(Object o:list)
				{
					if(o!=null&&o instanceof User)
					{
						User u=(User)o;
				%>
				<form action="ChangeUServlet?flag=<%=user.getPower() %>" method="post">
				<tr>
					<td>
						<input type="text" value="<%=u.getName() %>" name="u_name" readonly="readonly" >
					</td>
					<td>
						<%=u.getGender() %>
					</td>
					<td>
						<%=u.getAge() %>
					</td>
					<td>
						<%=u.getLocal() %>
					</td>
					<td>
						<select name="power">
							<option value="<%=u.getPower() %>" selected disabled hidden><%=(u.getPower()==1)?"管理员":"用户"%></option> 
  							<option value ="1">管理员</option>
  							<option value ="0">用户</option>
						</select>
					</td>
					<td align="center">
						<input type="submit" name="btn" value="提交">
						<input type="submit" name="btn" value="删除">
						<input type="reset" value="重置">
					</td>
				</tr>
				</form>
				<%
					}
				}
				}else{
				%>
				<center>未查询到数据</center>
				<%} %>
			<tr >
				<td colspan="6" style="text-align:center">
				${MSG}
				</td>
			</tr>
			</table>
			</div>
			<div style="text-align:center;margin:100px 0 auto auto">
			第<%=p.getNow() %>页/共<%=p.getSum() %>页
			<a href="AdminServlet?num=1&name=<%=request.getParameter("name") %>">首页</a>
			<a href="AdminServlet?num=<%=p.getPre() %>&name=<%=request.getParameter("name") %>">上一页</a>
			<%for(int i=p.getsPage();i<=p.getePage();i++){ %>
				<a href="AdminServlet?num=<%=i %>&name=<%=request.getParameter("name") %>"><%=i %></a>
			<%} %>
			<a href="AdminServlet?num=<%=p.getNext() %>&name=<%=request.getParameter("name") %>">下一页</a>
			<a href="AdminServlet?num=<%=p.getSum() %>&name=<%=request.getParameter("name") %>">尾页</a>
			</div>
</fieldset>
</div>
<%@include file="bottom.jsp" %>
</body>
</html>