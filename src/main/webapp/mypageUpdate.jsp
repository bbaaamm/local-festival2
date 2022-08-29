<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" /> <!-- User 자바 빈지 사용 -->
<jsp:setProperty property="*" name="user"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<% 
    String userID = null;
    if(session.getAttribute("userID") != null){ //세션이 존재한다면
        userID = (String) session.getAttribute("userID"); //userID변수가 자신에게 부여된 세션 아이디를 받음
    }

    UserDAO userDAO = new UserDAO();
    if (user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null ||
             user.getUserArea() == null || user.getUserEmail() == null || user.getUserInterest() == null){  //하나라도 입력이 안됐을 때
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('입력이 안 된 사항이 있습니다.')");
                script.println("history.back()");
                script.println("</script>");
            } else {
                int result = userDAO.updateMember(user);
                if(result == 1){
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("alert('회원정보 수정이 완료되었습니다!')");
                    script.println("location.href = 'main.jsp'");
                    script.println("</script>");
                }
                else{
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("alert('존재하지 않는 아이디입니다.')");
                    script.println("history.back()");
                    script.println("</script>");
                }
            }
%>
</body>
</html>