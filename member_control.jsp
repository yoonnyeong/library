<%@ page language="java" contentType="text/html; charset=EUC-KR" errorPage="member_error.jsp"
    pageEncoding="EUC-KR"  import="book.*, java.util.ArrayList"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>control 페이지</title>
</head>
<body>

<jsp:useBean id="mb" class="book.MemberBean" scope="session"/>
<jsp:useBean id="member" class="book.Member" scope="session"/>
<%
	String action = request.getParameter("action");
	
	
	if(action.equals("delete")) {
		String userid= (String)session.getAttribute("username");
		
		if(mb.deleteDB(userid)) {
			response.sendRedirect("login_form.html");
		}
		else
			throw new Exception("DB 삭제오류");
	}
	else if(action.equals("login")) {
			response.sendRedirect("login_form.html");
		
	}
	
	else {
		out.println("<script>alert('action 파라미터를 확인해 주세요!!!')</script>");
	}		

%>
</body>
</html>