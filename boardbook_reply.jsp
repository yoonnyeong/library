<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" errorPage="boardbook_error.jsp" import="book.*"%>
     <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title>�Խ��� �亯ȭ��</title>
<jsp:useBean id="login" class="book.LoginBean" scope="session" />
</head>
<%
BoardBean board= new BoardBean();
String snum= request.getParameter("reply_num");
int num=Integer.parseInt(snum);
Board bb = board.getDB(num);
%>
<center>
<H2>�Խ���:�亯ȭ�� </H2>
<HR>
[<a href=boardbook_control.jsp?action=list>�Խù��������</a>]
<form name=form1 method=post action=boardbook_control.jsp>
<input type=hidden name="action" value="reply">
<input type=hidden name="reply_num" value="<%=request.getParameter("reply_num") %>" >
<table cellpadding=5 cellspacing=0 border="1">
  <tr>
    <td bgcolor="#99CC00">�亯��ȣ</td>	
    <td><%=request.getParameter("reply_num") %></td>
  </tr>
  <tr>
    <td bgcolor="#99CC00">�� �� ��</td>	
    <td><input type="text" name="userid" value="<%=login.getUserid()%>" size="20"></td>
  </tr>
  <tr>
    <td bgcolor="#99CC00">����</td>
    <td><input type="text" name="b_title" value="re:<%=bb.getB_title()%>" size="20"></td>
  </tr>
  <tr>
    <td bgcolor="#99CC00">��й�ȣ</td>
    <td><input type="password" name="b_passwd" size="20" value="<%=bb.getB_passwd()%>"></td>
  </tr>
  <tr>
    <td colspan="2"><textarea rows="5" name="b_contents" cols="40"></textarea></td>
  </tr>
  <tr>
    <td colspan=2 align=center><input type=submit value="����"><input type=reset value="���"></td>
</tr>
</table>
</form>

</center>
</body>
</html>