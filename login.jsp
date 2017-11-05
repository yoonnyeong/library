<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8R">
<title>로그인</title>
</head>

<jsp:useBean id="login" class="book.LoginBean" scope="session" />
<jsp:setProperty name="login" property="*" />
<body>
<hr>
<%
	if(!login.checkUser()) {
%>
<script>
	alert("로그인 실패!! 다시 로그인 해 주세요.");
	history.go(-1);
</script>
<%
	}
	else {
		Integer count = (Integer)application.getAttribute("count");
		 int cnt ;
		 	  if(count == null) 
				{application.setAttribute("count", 1);
				cnt=1;}
		 	 else 
		 		 cnt = count.intValue()+1;
		application.setAttribute("count",cnt);
		session.setAttribute("username",request.getParameter("userid"));
		session.setAttribute("count",cnt);
		session.setAttribute("userid", login.getUserid());
		response.sendRedirect("menu.jsp");
	}
%>
	
</body>
</html>