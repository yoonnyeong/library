<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, book.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ݳ� �Ϸ�</title>
</head>
<body>
<jsp:useBean id="login" class="book.LoginBean" scope="session" />
<jsp:useBean id="lb" class="book.LentBean" scope="session" />
<jsp:useBean id="bb" class="book.BookBean" scope="session" />
<jsp:useBean id="books" class="book.Books" scope="session" />
<%
	String code= (String)session.getAttribute("code");
	Books book = bb.getBook(code);
%>
<center>
<h2>�ݳ� �Ϸ�</h2>
<hr>
<%=login.getUserid() %>��, �ݳ��� �Ϸ�Ǿ����ϴ�.
<br>�����մϴ� :)
<br><br>
[<a href="menu.jsp">���� ȭ������</a>]
[<a href="Bookslist_member.jsp">���� �������</a>]
<%;
MemberBean mb= new MemberBean();
Member memebr= mb.getDB((String)session.getAttribute("userid"));
String userid=(String)session.getAttribute("userid");
ArrayList<Lent> datas1= lb.getUserLentList(userid);
ArrayList<Lent> datas=lb.getLentOkList();
%>
<br><br>
<TABLE border='1' cellspacing=1 cellpadding=2 width='600'> 
	<TR bgcolor="#99CC00">
		<TD align='center' width='100'>���� ID</TD>
		<TD align='center' width='250'>���� ��</TD>
		<TD align='center' width='200'>�뿩 ����</TD>
		<TD align='center' width='200'>�ݳ� ����</TD>
	</TR>
<%
	for(Lent lent:datas ){
%>
	<tr>
		<td><%=lent.getLent_id()%></td>
		<td><%=book.getTitle()%></td>
		<td><%=lent.getLent_date()%></td>
		<td><%=lent.getRet_date()%></td>
	</tr>
<%
	}
%>
		
</TABLE>
</center>
</body>
</html>