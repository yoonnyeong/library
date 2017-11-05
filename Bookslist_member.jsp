<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, book.*" errorPage="books_error.jsp"%>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language=JavaScript>
	function check(code) {
			document.location.href="Booklist_member.jsp?code="+code;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ��� ȭ��</title>
</head>

<jsp:useBean id="login" class="book.LoginBean" scope="session" />

<body>
<%
	BookBean bb = new BookBean();
	ArrayList<Books> datas = bb.getBookList();
%>
<center>
<h2>���� ���</h2>
<hr>
<form method="post" action="searchlist_member.jsp">
	<select name="field">
		<option value="title" selected>������
		<option value="writer">����
	</select>
	<input type="text" name="string">
	<input type="submit" value="�˻�">
</form>
<hr>
[<a href="menu.jsp">���� ȭ������</a>]
<form>
<table cellpadding=5 cellspacing=0 border="1">
	<tr bgcolor="#99CC00"><td>������ȣ</td><td>������</td><td>����</td><td>���ǻ�</td><td>��ǰ�ڵ�</td><td>���</td><td>���⿩��</td></tr>
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
		<td> <%
		if(books.getStatus()==0){
			out.println("���Ⱑ��");
		}
			else
				out.println("������");%></td>
	</tr>
<%
	}
%>
</table>
</form>
<br>

</center>
</body>
</html>