<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, book.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<script language=JavaScript>
	// Ż�� Ȯ���� ���� �ڹٽ�ũ��Ʈ
	function delcheck() {
		// �޽��� â�� ���� YES/NO Ȯ��
		var user = confirm("������ Ż���Ͻðڽ��ϱ� ?");
		if(user==true){
			document.form1.action.value="delete";
			document.form1.submit();
		}
		else if(user==false)
			document.form1.action.value="login";
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ����</title>
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
    <td bgcolor="#99CC00">���̵�</td>
    <td>
      <%=member.getUserid() %>
    </td>
  </tr>
    <tr>
    <td bgcolor="#99CC00">��й�ȣ</td>
    <td><%=member.getPasswd() %></td>
  </tr>
  <tr>
    <td bgcolor="#99CC00">�̸�</td>
    <td><%=member.getName() %></td>
  </tr>
  <tr>
    <td bgcolor="#99CC00">�ֹε�Ϲ�ȣ</td>
    <td><%=member.getJuminnum() %></td>
  </tr>
  <tr>
    <td bgcolor="#99CC00">�ּ�</td>
    <td><%=member.getAddress() %></td>
  </tr>
  <tr>
    <td bgcolor="#99CC00">��ȭ��ȣ </td>
    <td><%=member.getPhone() %></td>
  </tr>
  <tr>
  	<td colspan=2 align=center>
  		<input type="submit" name="delete" value="Ż��" onClick="delcheck()">
		<input type="reset" name="reset" value="����">
	</td>
  </tr>
</table>
</form>
<center>
<a href="menu.jsp">�������� ���� </a>
</center>
</body>
</html>