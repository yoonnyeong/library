<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" errorPage="boardbook_error.jsp" import="book.*" import="java.util.*"%>
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script language=JavaScript>
	function check(b_id) {
		pwd = prompt('����/���� �Ϸ��� ��й�ȣ�� ��������');
		document.location.href="boardbook_control.jsp?action=edit&b_id="+b_id+"&b_passwd="+pwd;
	}
	
</script>
<jsp:useBean id="login" class="book.LoginBean" scope="session" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խ���:���ȭ��</title>
</head>

<%
	BoardBean bb = new BoardBean();
	ArrayList<Board> datas = bb.getBoardList(login.getUserid());
%>
<body>
<center>
<H2>���� �� ��� </H2>
<HR>
<a href="menu.jsp">���� �޴� ����</a><P>
<form>

		<table cellpadding=5 cellspacing=0 border="1">
			<tr  bgcolor="#99CC00" ><td>��ȣ</td><td>�ۼ���</td><td>����</td><td>����</td><td>�ۼ���</td></tr>
			<%
				// ArrayList ��ü�� ���� DB���� ������ ����� �����.
				for(Board  board : datas) {
			%>
			  <tr>
			   <td><%=board.getB_id() %></td>
			    <td><%=board.getUserid() %></td>
				<td><%=board.getB_title() %></td>
				<td><a href=javascript:check('<%=board.getB_id() %>')><%=board.getB_contents() %></a></td>
				<td><%=board.getB_date() %></td>
			  </tr>
			 <%
				}
			 %>
		</table>
</form>

<a href="boardbook_form.jsp">�۾���</a>
<HR>
</center>
</body>
</html>