<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, book.*" errorPage="books_error.jsp"%>
<% request.setCharacterEncoding("euc-kr"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script language=JavaScript>
	function checkS(status) {
		if(status==1){
			alert("���� ���Դϴ�");
			document.form1.action.value="list";
			document.form1.submit();
		}
		else
			{document.form1.action.value="lent";
			document.form1.submit();}
	}

</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� �뿩</title>
</head>
<body>
<jsp:useBean id="books" class="book.Books"/>
<jsp:useBean id="bb" class="book.BookBean"/>
<jsp:setProperty name="books" property="*"/>
<center>
<h2>���� ����</h2>
<hr>
<%	
	int s= books.getStatus();
	Books book = bb.getBook(books.getCode());
	String code= book.getCode();
	session.setAttribute("code",code);
%>
[<a href=Bookscontrol_admin.jsp?action=mlist>�����������</a>]
<form name=form1 method=post action=lent_control.jsp>
<input type=hidden name="action" value="lent">
<table cellpadding=5 cellspacing=0 border="1">
  <tr>
    <td bgcolor="#99CC00">å����</td>	
    <td ><%=book.getTitle()%></td>
  </tr>
  <tr>
    <td bgcolor="#99CC00">����</td>
    <td ><%=book.getWriter()%></td>
  </tr>
    <tr>
    <td bgcolor="#99CC00">���ǻ�</td>
    <td ><%=book.getPublisher()%></td>
  </tr>
    <tr>
    <td bgcolor="#99CC00">�����ڵ�</td>
    <td ><%=book.getCode()%></td>
  </tr>
  <tr>
    <td bgcolor="#99CC00">���</td>
    <td><%=book.getContents()%></td>
  </tr>
 
  <tr>
    <td colspan=2 align=center><input type="button" value="����" onClick="checkS('<%=book.getStatus()%>')"></td>
</tr>
</table>
</form>
</center>
</body>
</html>