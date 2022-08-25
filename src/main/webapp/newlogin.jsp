<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Sign-up</title>
        <link rel ="stylesheet" href="css/mypage.css">
    </head>
    <body>
        <h1><a href="newlogin.html">회원가입</a></h1>
        <br><br><br>
       <table class="table">            
            <tr>
                <td class="left">아이디</td>
                <td><input type="text" name="id" id="id"><input type="button" value="중복체크" style="width:67px;"></td>
            </tr>
            <tr>
                <td class="left">비밀번호</td>
                <td><input type="text" name="password" id="password"></td>
            </tr>
            <tr>
                <td class="left"></td>
                <td><input type="text" name="chpassword" id="chpassword"
                placeholder="비밀번호를 다시 입력해주세요"></td>
            </tr>
            <tr>
                <td class="left">이름</td>
                <td><input type="text" name="username" id="username"></td>
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
            <tr>
                <td class="left">수신여부</td>
                <td><input type="checkbox" name="agree" value="수신에 동의"> 수신에 동의</td>
            </tr>
       </table>
       <br>
       <div class="button">
       <button onclick="location.href='main.jsp'">뒤로</button>    
       <input type="submit" value="가입" class="mod"> 
       </div>
    </body>
</html>