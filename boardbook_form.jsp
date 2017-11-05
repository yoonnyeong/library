<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" errorPage="boardbook_error.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판:작성화면</title>
</head>
<body>
<center>
<H2>게시판:작성화면 </H2>
<HR>
<jsp:useBean id="login" class="book.LoginBean" scope="session" />
[<a href=boardbook_control.jsp?action=list>게시물목록으로</a>]
<form name=form1 method=post action=boardbook_control.jsp>
<input type=hidden name="action" value="insert">
<table cellpadding=5 cellspacing=0 border="1">
  <tr>
    <td bgcolor="#99CC00">작 성 자</td>	
    <td><input type="text" name="userid" value="<%=login.getUserid()%>" size="20"></td>
  </tr>
  <tr>
    <td bgcolor="#99CC00">제목</td>
    <td><select name=b_title>
			<option selected>도서문의</option>
			<option>반납문의</option>
			<option>기타문의</option>
	</select></td>
  </tr>
  <tr>
    <td bgcolor="#99CC00">비밀번호</td>
    <td><input type="password" name="b_passwd" size="20"></td>
  </tr>
  <tr>
    <td colspan="2"><textarea rows="5" name="b_contents" cols="40"></textarea></td>
  </tr>
  <tr>
    <td colspan=2 align=center><input type=submit value="저장"><input type=reset value="취소"></td>
</tr>
</table>
</form>

</center>
</body>
</html>