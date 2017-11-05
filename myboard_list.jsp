<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" errorPage="boardbook_error.jsp" import="book.*" import="java.util.*"%>
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script language=JavaScript>
	function check(b_id) {
		pwd = prompt('수정/삭제 하려면 비밀번호를 넣으세요');
		document.location.href="boardbook_control.jsp?action=edit&b_id="+b_id+"&b_passwd="+pwd;
	}
	
</script>
<jsp:useBean id="login" class="book.LoginBean" scope="session" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판:목록화면</title>
</head>

<%
	BoardBean bb = new BoardBean();
	ArrayList<Board> datas = bb.getBoardList(login.getUserid());
%>
<body>
<center>
<H2>나의 글 목록 </H2>
<HR>
<a href="menu.jsp">메인 메뉴 가기</a><P>
<form>

		<table cellpadding=5 cellspacing=0 border="1">
			<tr  bgcolor="#99CC00" ><td>번호</td><td>작성자</td><td>제목</td><td>내용</td><td>작성일</td></tr>
			<%
				// ArrayList 객체를 통해 DB에서 가져온 목록을 출력함.
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

<a href="boardbook_form.jsp">글쓰기</a>
<HR>
</center>
</body>
</html>