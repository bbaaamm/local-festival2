<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
String userID = (String)request.getAttribute("userID"); 
String userPassword = (String)request.getAttribute("userPassword"); 
String userName = (String)request.getAttribute("userName"); 
String userEmail = (String)request.getAttribute("userEmail"); 
String userArea = (String)request.getAttribute("userArea"); 
String userInterest = (String)request.getAttribute("userInterest"); 
%>
<!DOCTYPE html>
<html>
    <head>
        <title>mypage</title>
        <link rel ="stylesheet" href="css/mypage.css">
    </head>
    <body>
        <h1><a href="mypage.html">마이페이지</a></h1>
        <br><br><br>
       <table class="table">
            <tr>
                <td class="left">이름</td>
                <td><input type="text" name="username" id="username"></td>
            </tr>
            <tr>
                <td class="left">아이디</td>
                <td><input type="text" name="id" value="<%= userID%>"></td>
            </tr>
            <tr>
                <td class="left">비밀번호</td>
                <td><input type="text" name="password" id="password"></td>
            </tr>
            <tr>
                <td class="left">이메일</td>
                <td><input type="text" name="email" id="email"></td>
            </tr>
            <tr>
                <td class="left">관심지역</td>
                <td><input type="text" name="region" id="region"></td>
            </tr>
            <tr>
                <td class="left">관심분야</td>
                <td><input type="text" name="field" id="field"></td>
            </tr>  
       </table>
       <br>
       <div class="button">
       <button onclick="location.href='main.jsp'">뒤로</button>    
       <input type="submit" value="수정" class="mod"> 
       </div>
    </body>
</html>