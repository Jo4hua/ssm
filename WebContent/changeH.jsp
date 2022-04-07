<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="head.jsp" %>
<div style="height:500px" align="center">
<form action="UploadServletOne" method="post" enctype="multipart/form-data">
	<input type="file" name="part">
	<input type="submit" value="上传头像">
</form>
</div>
<%@include file="bottom.jsp" %>
</body>
</html>