<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.User"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="user" class="user.User" scope="page" />
<!DOCTYPE html>
<html>
    <head>
        <title>mypage</title>
        <link rel ="stylesheet" href="css/mypage.css">
    </head>
    <body>
        <%
        String userID = null;
        if(session.getAttribute("userID") != null){
            userID = (String) session.getAttribute("userID");
        }
        if (userID == null){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인을 하세요')");
            script.println("location.href = 'login.jsp'");
            script.println("</script>");
        }
        UserDAO userDAO = new UserDAO();
        User us = userDAO.getmember(userID);
        %>
        <h1><a href="mypage.jsp">마이페이지</a></h1>
        <br><br><br>

       <form action="mypageUpdate.jsp" method="post">
       <table class="table">
            <tr>
                <td class="left">이름</td>
                <td><input type="text" name="userName" id="username" value="<%=us.getUserName() %>"></td>
            </tr>
            <tr>
                <td class="left">아이디</td>
                <td><input type="text" name="userID" id="id" value="<%=us.getUserID() %>" readonly></td>
            </tr>
<tr>
                <td class="left">비밀번호</td>
                <td><input type="password" name="userPassword" value="<%=us.getUserPassword() %>"></td>
            </tr>
            <tr>
                <td class="left">이메일</td>
                <td><input type="text" name="userEmail" id="email" value="<%=us.getUserEmail() %>"></td>
            </tr>
            <tr>
                <td class="left">관심지역</td>
                <td><input type="text" name="userArea" id="region" value="<%=us.getUserArea() %>"></td>
            </tr>
            <tr>
                <td class="left">관심분야</td>
                <td><input type="text" name="userInterest" id="field" value="<%=us.getUserInterest() %>"></td>
            </tr>
       </table>
       <input type="submit" value="수정" class="mod"> 
       </form>
       <br>
       <div class="button">
       <button onclick="location.href='main.jsp'">뒤로</button>

       </div>
    </body>
</html>