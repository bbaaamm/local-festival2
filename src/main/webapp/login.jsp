<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link href="css/login.css" rel="stylesheet">
    </head>
    <body>
        <h1>로그인</h1>
        <form method="post" action="loginAction.jsp">
        <table class="table">
            <tr>
                <td class="left">아이디</td>
                <td><input type="text" name="userID"maxlength="20"></td>
            </tr>
            <tr>
                <td class="left">비밀번호</td>
                <td><input type="password" name="userPassword" maxlength="20"></td>
            </tr>
        </table>
        <br>
        <input type="submit" value="확인" class="mod">	
        </form>
        <div class="button">
        <button onclick="location.href='main.jsp'">뒤로</button>     
        </div>
    </body>
</html>