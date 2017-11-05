<%-- ����� �˻� ��ǰ ��� ȭ��--%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, book.*" errorPage="books_error.jsp"%>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�˻��� ��ǰ ��� ����Ʈ</title>
<script language=JavaScript>
	function check(code) {
		document.location.href="Booklist_member.jsp?code="+code;
	}
</script>
</head>
<body>
<%
	String strTitle = request.getParameter("field");
	String strCont = request.getParameter("string");
	
	BookBean bb = new BookBean();
	ArrayList<Books> datas = bb.getsearchBooklist(strTitle, strCont);
%>
<center>
<h2>�˻��� ��ǰ ���</h2>
<hr>
[<a href="Bookslist_member.jsp">��ǰ ��ü ���</a>]
[<a href="main.jsp">���� ȭ������</a>]
<form>
<table cellpadding=5 cellspacing=0 border="1">
	<tr  bgcolor="#99CC00" ><td>������ȣ</td><td>������</td><td>����</td><td>���ǻ�</td><td>��ǰ�ڵ�</td><td>���</td></tr>
<%
	// ArrayList ��ü�� ���� DB���� ������ ����� �����.
	for(Books books : datas) {
%>
	<tr>
		<td><%=books.getNum()%></td>
		<td><a href="javascript:check('<%=books.getCode()%>')"><%=books.getTitle() %></a></td>
		<td><%=books.getWriter() %></td>
		<td><%=books.getPublisher() %></td>
		<td><%=books.getCode() %></td>
		<td><%=books.getContents() %></td>
	</tr>
<%
	}
%>
</table>
</form>
<br>
<form method="post" action="searchlist_member.jsp">
	<select name="field">
		<option value="title" selected>��ǰ��
		<option value="contents">��ǰ����
	</select>
	<input type="text" name="string">
	<input type="submit" value="�˻�">
</form>
</center>
</body>
</html>