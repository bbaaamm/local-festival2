<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="review.ReviewDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="review" class="review.Review" scope="page" />
<jsp:setProperty name="review" property="bbsStar" />
<jsp:setProperty name="review" property="bbsContent" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String userID = null;  // 이미 로그인이 된 사용자는 또 다시 회원가입이 될 수 없도록 막아주는 역할
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요!')");
		script.println("location href = 'login.jsp'"); 
		script.println("</script>");
	} else {
		if (review.getBbsStar() == null || review.getBbsContent() == null ) {		
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다!')");
				script.println("history.back()"); // 이전페이지로 사용자를 돌려보냄
				script.println("</script>");
			} else {
				ReviewDAO reviewDAO = new ReviewDAO();     
				int result = reviewDAO.write(review.getBbsStar(), review.getBbsContent(), userID);
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다!')");
					script.println("history.back()"); // 이전페이지로 사용자를 돌려보냄
					script.println("</script>");
				}
				else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기가 완료되었습니다!')");
					script.println("location.href = 'hanbok_8.25.jsp'"); // 정상적으로 회원가입이 되었을 때는 메인페이지로 이동시켜줌
					script.println("</script>");
				}
			}			
	}
%>
</body>
</html>