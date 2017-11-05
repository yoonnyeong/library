<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>menu 항목</title>
<jsp:useBean id="login" class="book.LoginBean" scope="session" />
</head>
<body>
<center>
		<h2>Menu</h2><br>
	<hr><%=login.getUserid() %>님 안녕하세요 :) &nbsp;&nbsp;&nbsp; <a href="session_end.jsp">로그아웃</a><br>
		<%
			if (session.getAttribute("userid").equals("admin")) {
		%>
			<br><a href=Bookslist_admin.jsp>도서관리 화면으로</a> <br><br>
			<a href=Lentlist_admin.jsp>회원 대여 목록 관리</a><br>
			<br> <a href=boardbook_list_admin.jsp>Q & A 게시판</a><br>
			<br> <a href=Bookslist_member.jsp>도서찾기</a>	<br>
		<%
			}
		%>	
		<%
		if(!session.getAttribute("userid").equals("admin")){
		%>
		<hr>
		<br> <a href=Bookslist_member.jsp>도서찾기</a>	<br>
		<br> <a href=Lentlist_member.jsp>대출 내역</a><br>
		<br> <a href=boardbook_list.jsp>Q & A 게시판</a><br>
		<br> <a href=memberout.jsp>탈퇴</a><br>
		
		<%} %>
		
		
		<hr>
		
		
		
	</center>
</body>
</html>