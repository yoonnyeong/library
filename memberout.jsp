<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, book.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<script language=JavaScript>
	// 탈퇴 확인을 위한 자바스크립트
	function delcheck() {
		// 메시지 창을 통해 YES/NO 확인
		var user = confirm("정말로 탈퇴하시겠습니까 ?");
		if(user==true){
			document.form1.action.value="delete";
			document.form1.submit();
		}
		else if(user==false)
			document.form1.action.value="login";
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>나의 정보</title>
</head>
<body>
</script>
<center>
<H2> My Page </H2>
<HR>
</center>
<%
MemberBean bb= new MemberBean();
Member member= bb.getMember((String)session.getAttribute("username"));
%>
<form name=form1 method=post action=member_control.jsp>
<input type=hidden name="action" value="delete">
<table cellpadding=5 cellspacing=0 border="1" align="center">
  <tr>
    <td bgcolor="#99CC00">아이디</td>
    <td>
      <%=member.getUserid() %>
    </td>
  </tr>
    <tr>
    <td bgcolor="#99CC00">비밀번호</td>
    <td><%=member.getPasswd() %></td>
  </tr>
  <tr>
    <td bgcolor="#99CC00">이름</td>
    <td><%=member.getName() %></td>
  </tr>
  <tr>
    <td bgcolor="#99CC00">주민등록번호</td>
    <td><%=member.getJuminnum() %></td>
  </tr>
  <tr>
    <td bgcolor="#99CC00">주소</td>
    <td><%=member.getAddress() %></td>
  </tr>
  <tr>
    <td bgcolor="#99CC00">전화번호 </td>
    <td><%=member.getPhone() %></td>
  </tr>
  <tr>
  	<td colspan=2 align=center>
  		<input type="submit" name="delete" value="탈퇴" onClick="delcheck()">
		<input type="reset" name="reset" value="리셋">
	</td>
  </tr>
</table>
</form>
<center>
<a href="menu.jsp">메인으로 가기 </a>
</center>
</body>
</html>