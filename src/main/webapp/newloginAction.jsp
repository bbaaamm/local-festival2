<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userEmail" />
<jsp:setProperty name="user" property="userArea" />
<jsp:setProperty name="user" property="userInterest" />
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
	if (userID != null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어있습니다!')");
		script.println("location href = 'main.jsp'"); 
		script.println("</script>");
	}
	if (user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null ||
		user.getUserEmail() == null || user.getUserArea() == null || user.getUserInterest() == null) {		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다!')");
		script.println("history.back()"); // 이전페이지로 사용자를 돌려보냄
		script.println("</script>");
	} else {
		UserDAO userDAO = new UserDAO();     
		int result = userDAO.join(user);
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다!')");
			script.println("history.back()"); // 이전페이지로 사용자를 돌려보냄
			script.println("</script>");
		}
		else {
			session.setAttribute("userID", user.getUserID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원가입이 완료되었습니다!')");
			script.println("location.href = 'main.jsp'"); // 정상적으로 회원가입이 되었을 때는 메인페이지로 이동시켜줌
			script.println("</script>");
		}
	}		
	
	%>
</body>
</html>