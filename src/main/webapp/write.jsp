<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/detailpage.css">
<title>Insert title here</title>
</head>
<body>
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
</body>
</html>