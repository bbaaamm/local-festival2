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
    String userID = null;
    if(session.getAttribute("userID") != null) {
        userID = (String) session.getAttribute("userID");
    }
    if (userID == null) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('로그인을 하세요.')");
        script.println("location.href = 'login.jsp'");
        script.println("</script>");
    } else{
          if (review.getBbsStar() == null || review.getBbsContent() == null) {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('입력이 안 된 사항이 있습니다.')");
                script.println("history.back()");    // 이전 페이지로 사용자를 보냄
                script.println("</script>");
            }  else {
                    ReviewDAO reviewDAO = new ReviewDAO();
                    int result = reviewDAO.write(review.getBbsStar(), userID, review.getBbsContent());

                    if (result == -1){
                       PrintWriter script = response.getWriter();
                       script.println("<script>");
                       script.println("alert('글쓰기에 실패했습니다.')");
                       script.println("history.back()");    // 이전 페이지로 사용자를 보냄
                       script.println("</script>");
                    }
                    else {
                       PrintWriter script = response.getWriter();
                       script.println("<script>");
                       script.println("alert('글쓰기 성공!')");
                       script.println("location.href= 'hanbok_8.25.jsp'");
                       script.println("</script>");
                       }
        }
    }
%>
</body>
</html>