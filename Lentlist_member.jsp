<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, book.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>전체 대출 기록</title>
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
<h2>나의 대여 목록</h2>
<hr>
<%=login.getUserid() %>님의 전체 대출기록 
총 대여 개수 : <%= datas.size()%>

<br><br>
[<a href="menu.jsp">메인 화면으로</a>]

<br><br>
<TABLE border='1' cellspacing=1 cellpadding=2 width='600'> 
	<TR bgcolor="#99CC00">
		<TD align='center' width='150'>대출 ID</TD>
		<TD align='center' width='300'>도서명</TD>
		<TD align='center' width='100'>대여자</TD>
		<TD align='center' width='250'>대여일자</TD>
		<TD align='center' width='250'>반납일자</TD>
		<TD align='center' width='250'>반납정보</TD>
		<TD align='center' width='100'>반납</TD>
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
			out.println("반납완료");
		}
			else{
				out.println("대출중");
      			count++;}
				%></td>
   <% if(lent.getStatus()==1){ %>
   <td><a href="javascript:check('<%=lent.getLent_id()%>')">반납</a></td><%} %>
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
미 반납 도서 개수 : <%=count %>
</center>
</body>
</html>