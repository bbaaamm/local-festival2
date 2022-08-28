<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter"  %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginAction</title>
</head>
<body>
	<%
		String userID = null;  // 이미 로그인이 된 사용자는 또 다시 로그인이 될 수 없도록 막아주는 역할
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
		UserDAO userDAO = new UserDAO();     //사용자가 아이디와 비밀번호를 입력하고 로그인을 누르면 입력된 아이디/비밀번호가 UserDAO 에서 데이터베이스에 저장된 아이디/비밀번호 값과 비교하여 -2, -1, 0/ 1 값을 반환함
		int result = userDAO.login(user.getUserID(), user.getUserPassword());
		if (result == 1) {
			session.setAttribute("userID", user.getUserID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		else if (result == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다!')");
			script.println("history.back()"); // 이전페이지로 사용자를 돌려보냄
			script.println("</script>");
		}
		else if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다!')");
			script.println("history.back()"); // 이전페이지로 사용자를 돌려보냄
			script.println("</script>");
		}
		else if (result == -2) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다!')");
			script.println("history.back()"); // 이전페이지로 사용자를 돌려보냄
			script.println("</script>");
		}
	%>
</body>
</html>