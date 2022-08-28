<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판</title>
</head>
<body> 
	<%	
		session.invalidate();   // 세션을 빼앗기도록 만들어서 로그아웃 시켜줌
	%>
	<script>
		location.href = 'main.jsp';
	</script>
</body>
</html>