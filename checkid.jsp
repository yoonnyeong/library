<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ID �ߺ� üũ �˻�</title>
</head>
<body>
<center>
<jsp:useBean id="mb" class="book.MemberBean"/>
<%
	if(request.getParameter("userid") != ""){
		if(mb.checkID(request.getParameter("userid"))){
%>
<%= request.getParameter("userid") %>�� ��� ������ ID �Դϴ�.

<%
		}
		else {
%>
�ߺ��� ID�� �����մϴ�.<Br>
�ٸ� ID�� ����� �ּ���.
<%
		}
	}
	else{
%>
ID�� �Էµ� ���� �����ϴ�. <br>
�ٽ� �ѹ� �Է����ּ���.
<%
	}
%>
</center>
</body>
</html>