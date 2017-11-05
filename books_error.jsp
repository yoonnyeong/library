<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  isErrorPage="true"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
</head>
<body>
<center>
<H2>도서 관리 에러</H2>
<HR>
<table cellpadding=5 width=400>
<tr width=100% bgcolor="pink"><td>
상품 관리 처리중 에러가 발생 했습니다.<BR>
관리자에게 문의해 주세요..<BR>
빠른시일내 복구하겠습니다.
<HR>
에러내용 : <%= exception%>
<HR>

</td>
</tr>
</table>
</center>
</body>
</html>