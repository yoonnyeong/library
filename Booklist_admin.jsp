<%--���� ����, ���� ������--%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, book.*" errorPage="books_error.jsp"%>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html>
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
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ǰ ����, ����</title>
</head>
<%	
	Books book = (Books)request.getAttribute("book"); 
%>
<body>
<center>
<h2>��ǰ ����,����</h2>
<hr>
[<a href=Bookscontrol_admin.jsp?action=list>�����������</a>]
<form name=form1 method=post action=Bookscontrol_admin.jsp>
<input type=hidden name="num" value="<%=book.getNum()%>">
<input type=hidden name="action" value="update">
<table cellpadding=5 cellspacing=0 border="1">
  <tr>
    <td bgcolor="#99CC00">å����</td>	
    <td ><input type="text" name="title" size="40"  value="<%=book.getTitle()%>"></td>
  </tr>
  <tr>
    <td bgcolor="#99CC00">����</td>
    <td ><input type="text" name="writer" size="40" value="<%=book.getWriter()%>"></td>
  </tr>
    <tr>
    <td bgcolor="#99CC00">���ǻ�</td>
    <td ><input type="text" name="publisher" size="40" value="<%=book.getPublisher()%>"></td>
  </tr>
    <tr>
    <td bgcolor="#99CC00">�����ڵ�</td>
    <td ><input type="text" name="code" size="40" value="<%=book.getCode()%>"></td>
  </tr>
  <tr>
    <td bgcolor="#99CC00">���</td>
    <td><textarea rows="5" name="contents" cols="40" ><%=book.getContents() %></textarea></td>
  </tr>
    <tr>
    <td bgcolor="#99CC00">���⿩��</td>
    <td ><input type="text" name="status" size="40" value="<%=book.getStatus()%>"></td>
  </tr>
  <tr>
    <td colspan=2 align=center><input type=submit value="����"><input type=reset value="���"><input type="button" value="����" onClick="delcheck()"></td>
</tr>
</table>
</form>
</center>
</body>
</html>