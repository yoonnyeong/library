<%-- 도서 등록 페이지--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  errorPage="books_error.jsp" %>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>도서 등록 화면</title>
</head>
<body>
<center>
<h2>도서 등록</h2>
<hr>
[<a href=Bookscontrol_admin.jsp?action=list>도서목록으로</a>]
<form name=form1 method=post action=Bookscontrol_admin.jsp>
<input type=hidden name="action" value="insert">
<table cellpadding=5 cellspacing=0 border="1">
  <tr>
    <td bgcolor="#99CC00">책제목</td>	
    <td ><input type="text" name="title" size="40"></td>
  </tr>
  <tr>
    <td bgcolor="#99CC00">저자</td>
    <td ><input type="text" name="writer" size="40"></td>
  </tr> 
      <tr>
    <td bgcolor="#99CC00">출판사</td>
    <td ><input type="text" name="publisher" size="40"></td>
  </tr>
   <tr>
    <td bgcolor="#99CC00">코드</td>
    <td ><input type="text" name="code" size="40"></td>
  </tr>
  <tr>
    <td bgcolor="#99CC00">비고</td>
    <td><textarea rows="5" name="contents" cols="40"></textarea></td>
  </tr>
  <tr>
    <td bgcolor="#99CC00">대출여부</td>
    <td><input type="text" name="status" size="40"></td>
  </tr>
  <tr>
    <td colspan=2 align=center><input type=submit value="등록"><input type=reset value="취소"></td>
</tr>
</table>
</form>
</center>
</body>
</html>