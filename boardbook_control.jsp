<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"  errorPage="boardbook_error.jsp" import="book.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("euc-kr"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
</head>
<jsp:useBean id="bb" class="book.BoardBean"/>
<jsp:useBean id="board" class="book.Board"/>
<jsp:useBean id="login" class="book.LoginBean" scope="session" />
<jsp:setProperty name="board" property="*"/>
<% 
	// ����� ��û�� �����ϱ� ���� �Ķ���͸� ������ ����
	String action = request.getParameter("action");
	
	if(action.equals("list")) {
		if(login.getUserid().equals("admin")){
			response.sendRedirect("boardbook_list_admin.jsp");
		}
		else{
			response.sendRedirect("boardbook_list.jsp");
		}
	}
	
	// �Խù� ��� ��û�� ���
	else if(action.equals("insert")) {		
		if(bb.insertDB(board)) {
			response.sendRedirect("boardbook_list.jsp");
		}
		else
			throw new Exception("DB �Է¿���");
	}
	// �Խù� ����ȭ�� ��û�� ���
	else if(action.equals("edit")) {
		Board gboard = bb.getDB(board.getB_id());
		if(!gboard.getB_passwd().equals(request.getParameter("b_passwd"))) {
			out.println("<script>alert('��й�ȣ�� Ʋ�Ƚ��ϴ�.!!');history.go(-1);</script>");
		}
		else {
			request.setAttribute("gboard",gboard);
			pageContext.forward("boardbook_edit_form.jsp");
		}
	}
	// �Խù� ���� ó���� ���
	else if(action.equals("update")) {
		if(bb.updateDB(board)){
				response.sendRedirect("boardbook_list.jsp");
			}
			else
				throw new Exception("DB ���ſ���");
	}
	// �Խù� ��ü ��û�� ���
	else if(action.equals("delete")) {
		if(bb.deleteDB(board.getB_id())) {
			response.sendRedirect("boardbook_list.jsp");
		}
		else
			throw new Exception("DB ���� ����");
	}
	else if(action.equals("reply")) {
		int num   = Integer.parseInt(request.getParameter("reply_num")); 
			if(bb.replyDB(board, num)) {
				response.sendRedirect("boardbook_list_admin.jsp");
			}
			else
				throw new Exception("DB �亯���� ");
	}

	else {
		out.println("<script>alert('action �Ķ���͸� Ȯ���� �ּ���!!!')</script>");
	}
%>

</body>
</html>