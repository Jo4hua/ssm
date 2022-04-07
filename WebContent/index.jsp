<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="head.jsp"%>
<%if(user==null){ %>
<script type="text/javascript">
	alert("您还未登录!");
	window.location.href="login.jsp";
</script>
<%}else{%>
<%if(user.getPower()!=0){ %>
<script type="text/javascript">
	window.location.href="index_a.jsp";
</script>
<%}else{ %>
<script type="text/javascript">
	window.location.href="message.jsp";
</script>
<%}%>
<%}%>
</body>
</html>