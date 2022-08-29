<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Sign-up</title>
        <link rel ="stylesheet" href="css/mypage.css">
        <script>
               function pw() {
              var p1 = document.getElementById('password').value;
              var p2 = document.getElementById('chpassword').value;
              if( p1 != p2 ) {
                alert("비밀번호가 일치하지 않습니다");
                return false;
              } else{
                alert("비밀번호가 일치합니다");
                return true;
              	}

            	}
       </script>
    </head>
    <body>
        <h1><a href="newlogin.jsp">회원가입</a></h1>
        <br><br><br>
        <form method="post" action="newloginAction.jsp" onsubmit="return pw();">
       <table class="table">         
            <tr>
                <td class="left">아이디</td>
                <td><input type="text" name="userID"><input type="button" value="중복체크" style="width:67px;"></td>
                
            </tr>
            <tr>
                <td class="left">비밀번호</td>
                <td><input type="password" name="userPassword" id="password"></td>
            </tr>
            <tr>
                <td class="left">비밀번호 확인</td>
                <td><input type="password" name="userPassword_check" id="chpassword" placeholder="비밀번호를 다시 입력해주세요"></td>
            </tr>
            <tr>
                <td class="left">이름</td>
                <td><input type="text" name="userName"></td>
            </tr>
            <tr>
                <td class="left">이메일</td>
                <td><input type="email" name="userEmail"></td>
            </tr>
            <tr>
                <td class="left">관심지역</td>
                <td><input type="text" name="userArea"></td>
            </tr>
            <tr>
                <td class="left">관심분야</td>
                <td><input type="text" name="userInterest"></td>
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
       </form>
    </body>
<html>