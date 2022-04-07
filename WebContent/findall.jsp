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
<div style="height:500px;width:100%;border:1px solid;" align="center">
<fieldset style="height:490px;">
		<legend><a href="index.jsp">首页</a>>><a href="FindAllServlet?num=1&id=">供应商信息管理</a></legend>
		<div style="margin:20px"><!--查找 -->
		<form method="post" action="FindAllServlet?num=1">
			<input type="text" name="id" placeholder="请输入要查询的客户的id" value="" >
			<input type="submit" value="查找">
		</form>
		</div>
		<div style="margin:20px auto;">
			<form method="post" action="FindServlet">
			<table style="width:80%;" border="1" cellspacing="0">
				<tr>
					<td >
						<input type="text" name="f_id" class="text" placeholder="请输入客户编号">
					</td>
					<td >
						<input type="text" name="f_name" class="text" placeholder="请输入客户名称">
					</td>
					<td >
						<input type="text" name="f_phone" class="text" placeholder="请输入联系方式">
					</td>
					<td >
						<input type="text" name="f_lev" class="text" placeholder="请输入优先等级">
					</td>
					<td align="center">
						<input type="submit" value="插入"  name="btn1"> 
					</td>
				</tr>
			</table>
			</form>
		</div>
		<div align="center" style="margin:30px auto;height:260px;"><!--数据  -->
			<%  Page p = (Page)request.getAttribute("page"); 
				List list = p.getList();
				if(list.size()!=0)
				{
			%>
			<table style="width:80%;" border="1" cellspacing="0">
				<tr>
					<td >
						客户编号：
					</td>
					<td>
						客户名称：
					</td>
					<td>
						联系方式：
					</td>
					<td>
						优先等级：
					</td>
					<td>
					</td>
				</tr>
			<%
				for(Object o:list)
				{
					if(o!=null&&o instanceof Data)
					{
						Data data=(Data)o;
			%>
				<form action="UpdateServlet" method="post"> 
					<tr >
						<td width="16%" border="1">
							<input type="text" name="id" value="<%=data.getId() %>" readonly="readonly" class="text">
						</td>
						<td>
							<input type="text" name="name" value="<%=data.getName() %>" class="text">
						</td>
						<td>
							<input type="text" name="phone" value="<%=data.getPhone() %>" class="text">
						</td>
						<td>
							<input type="text" name="lev" value="<%=data.getLev() %>" class="text">
						</td>
						<td align="center">
							<input type="submit" value="修改" name="btn">
							<input type="submit" value="删除" name="btn">
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
	<td colspan="5" style="text-align:center">
	${MSG}
	</td>
	</tr>
</table>
		</div>
		<div style="text-align:center;margin:65px 0 auto auto"><!-- 页数 -->
			第<%=p.getNow() %>页/共<%=p.getSum() %>页
			<a href="FindAllServlet?num=1&id=<%=request.getParameter("id") %>">首页</a>
			<a href="FindAllServlet?num=<%=p.getPre() %>&id=<%=request.getParameter("id") %>">上一页</a>
			<%for(int i=p.getsPage();i<=p.getePage();i++){ %>
				<a href="FindAllServlet?num=<%=i %>&id="><%=i %></a>
			<%} %>
			<a href="FindAllServlet?num=<%=p.getNext() %>&id=<%=request.getParameter("id") %>">下一页</a>
			<a href="FindAllServlet?num=<%=p.getSum() %>&id=<%=request.getParameter("id") %>">尾页</a>
		</div>
</fieldset>
</div>
<%@include file="bottom.jsp" %>
</body>
</html>