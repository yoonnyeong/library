<%-- 사용자 검색 상품 목록 화면--%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, book.*" errorPage="books_error.jsp"%>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>검색된 상품 목록 리스트</title>
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
<h2>검색된 상품 목록</h2>
<hr>
[<a href="Bookslist_member.jsp">상품 전체 목록</a>]
[<a href="main.jsp">메인 화면으로</a>]
<form>
<table cellpadding=5 cellspacing=0 border="1">
	<tr  bgcolor="#99CC00" ><td>도서번호</td><td>도서명</td><td>저자</td><td>출판사</td><td>상품코드</td><td>비고</td></tr>
<%
	// ArrayList 객체를 통해 DB에서 가져온 목록을 출력함.
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
		<option value="title" selected>상품명
		<option value="contents">상품정보
	</select>
	<input type="text" name="string">
	<input type="submit" value="검색">
</form>
</center>
</body>
</html>