<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" errorPage="boardbook_error.jsp" import="book.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<head>
<script language=JavaScript>
	// ���� Ȯ���� ���� �ڹٽ�ũ��Ʈ
	function delcheck() {
		// �޽��� â�� ���� YES/NO Ȯ��
		result = confirm("������ �����Ͻðڽ��ϱ� ?");
		if(result == true){
			document.form1.action.value="delete";
			document.form1.submit();
		}
		else
			return;
	}
</script>

<title>�Խ���:����ȭ��</title>
</head>

<%
Board board = (Board)request.getAttribute("gboard");
%>

<body>
<center>
<H2>�Խ���:����ȭ�� </H2>
<HR>
<jsp:useBean id="login" class="book.LoginBean" scope="session" />
<%
		if(login.getUserid().equals("admin")){
		%>[<a href="boardbook_list_admin.jsp">�Խù� �������</a>]
		<%} 
		else{%>
		[<a href=boardbook_control.jsp?action=list>�Խù� �������</a>]
<%} %>
<form name=form1 method=post action=boardbook_control.jsp>
<input type=hidden name="b_id" value="<%=board.getB_id()%>">
<input type=hidden name="action" value="update">

<table cellpadding=5 cellspacing=0 border="1">
 <tr>
    <td bgcolor="#99CC00">�� �� ��</td>	
    <td><input type="text" name="userid" size="20" value="<%=board.getUserid() %>"></td>
  </tr>
  <tr>
    <td bgcolor="#99CC00">����</td>
    <td><input type="text" name="b_title" size="20" value="<%=board.getB_title() %>"></td>
  </tr>
  <tr>
    <td bgcolor="#99CC00">��й�ȣ</td>
    <td><input type="password" name="b_passwd" size="20" value="<%=board.getB_passwd()%>"></td>
  </tr>
  <tr>
    <td colspan="2"><textarea rows="5" name="b_contents" cols="40"><%=board.getB_contents() %></textarea></td>
  </tr>
  <tr>
    <td colspan=2 align=center><input type=submit value="����"><input type=reset value="���"><input type="button" value="����" onClick="delcheck()"></td>
</tr>
</table>
</form>

</center>
</body>
</html>