<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="books_error.jsp" import="book.*, java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("euc-kr"); %>

<jsp:useBean id="books" class="book.Books"/> 
<jsp:useBean id="bb" class="book.BookBean"/>
<jsp:useBean id="lent" class="book.Lent"/>
<jsp:useBean id="lb" class="book.LentBean"/>
<jsp:setProperty name="books" property="*"/> 
<jsp:setProperty name="lent" property="*"/>
<% 
	// 컨트롤러 요청 파라미터
	String action = request.getParameter("action");
	String userid=(String)session.getAttribute("username");
	String code=(String)session.getAttribute("code");
	// 파라미터에 따른 요청 처리

 	//대출 항목
	if(action.equals("list")) {
		response.sendRedirect("Bookslist_member.jsp");
	}
	// "대출"버튼을 클릭했을 경우
	else if(action.equals("lent")) {	
		if(lb.insertLent(lent,code,userid)) {
			response.sendRedirect("lent_ok.jsp");
		}
		else
			throw new Exception("DB 입력오류");
	}
	else if(action.equals("return")) {	
		int lentid=lent.getLent_id();
		if(lb.updateLent(lentid)) {
			response.sendRedirect("return_ok.jsp");
		}
		else
			throw new Exception("DB 입력오류");
	}


	else {
		out.println("<script>alert('action 파라미터를 확인해 주세요!!!')</script>");
	}
%>
