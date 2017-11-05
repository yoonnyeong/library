<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="books_error.jsp" import="book.*, java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("euc-kr"); %>
 
<jsp:useBean id="books" class="book.Books"/> 
<jsp:useBean id="bb" class="book.BookBean"/>

<jsp:setProperty name="books" property="*"/> 
<% 
	// 컨트롤러 요청 파라미터
	String action = request.getParameter("action");

	// 파라미터에 따른 요청 처리
	// 주소록 목록 요청인 경우

	if(action.equals("list")) {
		response.sendRedirect("Bookslist_admin.jsp");
	}

	else if(action.equals("mlist")) {
		response.sendRedirect("Bookslist_member.jsp");
	}
	// 상품 등록 요청인 경우
	else if(action.equals("insert")) {		
		if(bb.insertBook(books)) {
			response.sendRedirect("Bookslist_admin.jsp");
		}
		else
			throw new Exception("DB 입력오류");
	}
	
	else if(action.equals("edit")) {		
			Books book = bb.getBook(books.getCode());
			request.setAttribute("book",book);
			pageContext.forward("Booklist_admin.jsp"); 
	}
	// 주소록 수정 등록 요청인 경우
	else if(action.equals("update")) {
			if(bb.updateBook(books)) {
				response.sendRedirect("Bookslist_admin.jsp");
			}
			else
				throw new Exception("DB 갱신오류");
	}
	// 주소록 삭제 요청인 경우
	else if(action.equals("delete")) {
		if(bb.deleteBook(books.getNum())) {
			response.sendRedirect("Bookslist_admin.jsp");
		}
		else
			throw new Exception("DB 삭제 오류");
	}
	else {
		out.println("<script>alert('action 파라미터를 확인해 주세요!!!')</script>");
	}
%>
