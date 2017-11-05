<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<HTML>
<HEAD><TITLE>session_end.jsp</TITLE></HEAD>
<BODY>
<HR>
<%
session.invalidate();
response.sendRedirect("login_form.html");
%>
</BODY>
