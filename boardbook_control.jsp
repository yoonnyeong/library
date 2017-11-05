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
	// 사용자 요청을 구분하기 위한 파라미터를 저장할 변수
	String action = request.getParameter("action");
	
	if(action.equals("list")) {
		if(login.getUserid().equals("admin")){
			response.sendRedirect("boardbook_list_admin.jsp");
		}
		else{
			response.sendRedirect("boardbook_list.jsp");
		}
	}
	
	// 게시물 등록 요청인 경우
	else if(action.equals("insert")) {		
		if(bb.insertDB(board)) {
			response.sendRedirect("boardbook_list.jsp");
		}
		else
			throw new Exception("DB 입력오류");
	}
	// 게시물 수정화면 요청인 경우
	else if(action.equals("edit")) {
		Board gboard = bb.getDB(board.getB_id());
		if(!gboard.getB_passwd().equals(request.getParameter("b_passwd"))) {
			out.println("<script>alert('비밀번호가 틀렸습니다.!!');history.go(-1);</script>");
		}
		else {
			request.setAttribute("gboard",gboard);
			pageContext.forward("boardbook_edit_form.jsp");
		}
	}
	// 게시물 수정 처리인 경우
	else if(action.equals("update")) {
		if(bb.updateDB(board)){
				response.sendRedirect("boardbook_list.jsp");
			}
			else
				throw new Exception("DB 갱신오류");
	}
	// 게시물 삭체 요청인 경우
	else if(action.equals("delete")) {
		if(bb.deleteDB(board.getB_id())) {
			response.sendRedirect("boardbook_list.jsp");
		}
		else
			throw new Exception("DB 삭제 오류");
	}
	else if(action.equals("reply")) {
		int num   = Integer.parseInt(request.getParameter("reply_num")); 
			if(bb.replyDB(board, num)) {
				response.sendRedirect("boardbook_list_admin.jsp");
			}
			else
				throw new Exception("DB 답변오류 ");
	}

	else {
		out.println("<script>alert('action 파라미터를 확인해 주세요!!!')</script>");
	}
%>

</body>
</html>