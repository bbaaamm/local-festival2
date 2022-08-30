<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="review.ReviewDAO" %>
<%@ page import="review.Review" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
  <title>지역별 축제 소개</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="css/detailpage.css">
</head>

<body>
  <%
        String userID = null;
        if(session.getAttribute("userID") != null){
            userID = (String) session.getAttribute("userID");
        }
        int pageNumber = 1;
        if (request.getParameter("pageNumber") != null) {
        	pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
        }
   %>
  <h1>~"2022년 한복상점"</h1>

  <p><img src="https://www.mcst.go.kr/attachFiles/cultureInfoCourt/localFestival/notifyFestival/1659318247159.jpg"
    width="60%" alt=""></p> 
  
  <table id="explanation">
    <tr>
      <th>개최지역</th>
      <td>서울시 강남구</td>
    </tr>
    <tr>
      <th>개최기간</th>
      <td>2022.8.25~28./10:00~19:00 (18:00 입장마감)</td>
    </tr>
    <tr>
      <th>축제장소</th>
      <td>코엑스 3층 D2홀</td>
    </tr>
    <tr>
      <th>요금</th>
      <td>5,000원(입장권 현장구매) / 무료입장 : 한복착용자, 사전등록자, 초대권소지자, 영유아(미취학아동까지), 만 65세 이상 어르신(신분증 필참), 국가유공자(인증서류 필참), 기초생활수급자(인증서류 필참), 장애인 및 동반 보호자 1인(인증서류 필참)</td>
    </tr>
  </table>

	
  <p>2022년 한복상점은 문화체육관광부가 주최하고 한국공예·디자인문화진흥원이 주관하는 행사로, 소비자와 한복업계를 잇는 유통의 장이자 전국의 한복인이 모이는 소통의 장이다. 2022년 한복상점에서는 바람결에 스며든 푸른 이야기를 주제로 기획전시를 진행하며, 전국의 다양한 한복업체의 판매관을 만나볼 수 있다. 한복을 입어보고 만들어볼 수 있는 체험관과 한복디자인프로젝트 공모전 수상작, 한복교복과 한복근무복 전시 등도 마련될 예정이다.</p>
	<table class="review">
	<thead>
		<tr>
			<th>번호</th>
			<th>별점</th>
			<th>내용</th>
			<th>작성자</th>
		</tr>
	</thead>
	<tbody>
	<%
		ReviewDAO reviewDAO = new ReviewDAO();
		ArrayList<Review> list = reviewDAO.getList(pageNumber);
		for(int i = 0; i < list.size(); i++) {
	%>
	<tr>
		<td><%= list.get(i).getBbsID() %></td>
		<td><%= list.get(i).getBbsStar() %></td>
		<td><%= list.get(i).getBbsContent() %></td>
		<td><%= list.get(i).getUserID() %></td>
	
	</tr>
	<%
			}
	%>
	</tbody>
	</table>
  <form class="mb-3" name="myform" id="myform" method="post" action="writeAction.jsp">
    <!-- <form> 태그는 사용자 의견이나 정보를 알기 위해 입력할 큰 틀을 만드는데 사용이 됨 폼은 입력된 데이터를 한 번에 서버로 전송함 
      method : 폼을 서버에 전송할 http 메소드를 정함(GET or POST) POST 방식은 내부적으로 URL이 보이지 않음-->
    <fieldset name="bbsStar">
    <!-- <fieldset> 태그는 <form> 요소에서 연관된 요소들을 하나의 그룹으로 묶을 때 사용함 <fieldset> 요소는 하나의 그룹으로 묶은 요소들 주변으로 박스 모양의 선을 그려줌-->
      <span class="text-bold">별점을 선택해주세요</span> 
      <!-- <span> 태그안에 아무런 컨텐츠가 없다면 해당 부분은 아무런 변화가 없지만 span태그 내부에 객체가 들어가면 그 객체의 크기만큼 공간이 할당이 됨 -->
      <input type="radio" name="bbsStar" value="★★★★★" id="rate1"><label
        for="rate1">★</label>  <!-- <label> 태그의 for 속성은 라벨(label)과 결합될 요소를 명시함 -->
      <input type="radio" name="bbsStar" value="★★★★" id="rate2"><label
        for="rate2">★</label>
      <input type="radio" name="bbsStar" value="★★★" id="rate3"><label
        for="rate3">★</label>
      <input type="radio" name="bbsStar" value="★★" id="rate4"><label
        for="rate4">★</label>
      <input type="radio" name="bbsStar" value="★" id="rate5"><label
        for="rate5">★</label>
    </fieldset>
    <div>
      <textarea class="col-auto form-control" id="reviewContents"
             name="bbsContent" style="height:200px; width:500px;"></textarea>
 
    <input type="submit" value="작성">
    </div>
    </form>
    <p>
      관련 사이트 : <a href="https://www.2022hanbokexpo.com/#." target="_blank"title="hanbok">2022 한복상점</a>
    </p>

  </body>
  </html>
