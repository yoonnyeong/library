<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, book.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ü ���� ���</title>
<script language=JavaScript>
	function check(lent_id) {
		document.location.href="lent_control.jsp?action=return&lent_id="+lent_id;
	}
	
</script>
</head>
<body>
<jsp:useBean id="login" class="book.LoginBean" scope="session" />
<jsp:useBean id="lb" class="book.LentBean" scope="session" />
<jsp:useBean id="bb" class="book.BookBean" scope="session" />
<jsp:useBean id="books" class="book.Books" scope="session" />
<%
String id= login.getUserid();
ArrayList<Lent> datas= lb.getUserLentList(id);
int count=0;
%>
<center>
<h2>���� �뿩 ���</h2>
<hr>
<%=login.getUserid() %>���� ��ü ������ 
�� �뿩 ���� : <%= datas.size()%>

<br><br>
[<a href="menu.jsp">���� ȭ������</a>]

<br><br>
<TABLE border='1' cellspacing=1 cellpadding=2 width='600'> 
	<TR bgcolor="#99CC00">
		<TD align='center' width='150'>���� ID</TD>
		<TD align='center' width='300'>������</TD>
		<TD align='center' width='100'>�뿩��</TD>
		<TD align='center' width='250'>�뿩����</TD>
		<TD align='center' width='250'>�ݳ�����</TD>
		<TD align='center' width='250'>�ݳ�����</TD>
		<TD align='center' width='100'>�ݳ�</TD>
	</TR>
<%

	for(Lent lent: datas){  
		Books book=bb.getBook(lent.getCode());
%>
   <tr>
      <td><%=lent.getLent_id()%></td>
      <td><%=book.getTitle()%></td>
      <td><%=lent.getUserid()%></td>
      <td><%=lent.getLent_date()%></td>
      <td><%=lent.getRet_date()%></td>
      <td><%
		if(lent.getStatus()==0){
			out.println("�ݳ��Ϸ�");
		}
			else{
				out.println("������");
      			count++;}
				%></td>
   <% if(lent.getStatus()==1){ %>
   <td><a href="javascript:check('<%=lent.getLent_id()%>')">�ݳ�</a></td><%} %>
   <% if(lent.getStatus()==0){ %>
   <td>--</td><%} %>
   </tr>
<%
   }
%>


</TABLE>

</center>
<br>
<center>
�� �ݳ� ���� ���� : <%=count %>
</center>
</body>
</html>