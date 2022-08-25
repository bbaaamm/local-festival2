<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    	<meta charset="UTF-8">
        <title>local-festival</title>
        <link rel ="stylesheet" href="css/main.css">
        <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
        <script src="main.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="header">
                <h1><a href="main.jsp">룰루랄라 즐거운 festival</a></h1>
                <div class="btn">
                <!-- 팝업 생성 <input type="button" value="로그인" onclick="window.open('login.html', '로그인', 'width=400px, height=400px, location=no, status=no, scrollbars=no');"> -->
                <button><a href="login.jsp">로그인</a></button>
                <button><a href="newlogin.jsp">회원가입</a></button>
                <button><a href="mypage.jsp">마이페이지</a></button>
                </div>
            </div>
        
            <div class="main-content">
                <div class="adBox">
                        축제광고
                </div>
                
                <table id="select">
                    <tr>
                        <th>분야 선택</th>
                        <td onClick="HighLightTD(this, '#CCFFFF','cc3333');" >교통</td>
                        <td onClick="HighLightTD(this, '#CCFFFF','cc3333');" >안전</td>
                        <td onClick="HighLightTD(this, '#CCFFFF','cc3333');" >주택</td>
                        <td onClick="HighLightTD(this, '#CCFFFF','cc3333');" >경제</td>
                        <td onClick="HighLightTD(this, '#CCFFFF','cc3333');" >환경</td>
                        <td onClick="HighLightTD(this, '#CCFFFF','cc3333');" >문화</td>
                        <td onClick="HighLightTD(this, '#CCFFFF','cc3333');" >복지</td>
                        <td onClick="HighLightTD(this, '#CCFFFF','cc3333');" >행정</td>
                    </tr>
                    <tr>
                        <th>기간 선택</th>
                        <td onClick="HighLightTD(this, '#CCFFFF','cc3333');" >최근 1주일</td>
                        <td onClick="HighLightTD(this, '#CCFFFF','cc3333');" >최근 1달</td>
                    </tr>
                    <tr>
                        <th>지역 선택</th>
                        <td onClick="HighLightTD(this, '#CCFFFF','cc3333');" >서울</td>
                        <td onClick="HighLightTD(this, '#CCFFFF','cc3333');" >경기</td>
                        <td onClick="HighLightTD(this, '#CCFFFF','cc3333');" >인천</td>
                        <td onClick="HighLightTD(this, '#CCFFFF','cc3333');" >강원</td>
                        <td onClick="HighLightTD(this, '#CCFFFF','cc3333');" >부산</td>
                        <td onClick="HighLightTD(this, '#CCFFFF','cc3333');" >대구</td>
                        <td onClick="HighLightTD(this, '#CCFFFF','cc3333');" >대전</td>
                        <td onClick="HighLightTD(this, '#CCFFFF','cc3333');" >광주</td>
                        <td onClick="HighLightTD(this, '#CCFFFF','cc3333');" >울산</td>
                    </tr>
                </table>
                <table id="calendar">
                    <thead>
                        <tr>
                            <th><input name="preMon" type="button" value="<"></th>
                            <th colspan="5" class="year_mon"></th>
                            <th><input name="nextMon" type="button" value=">"></th>
                        </tr>
                        <tr>
                            <th>일</th>
                            <th>월</th>
                            <th>화</th>
                            <th>수</th>
                            <th>목</th>
                            <th>금</th>
                            <th>토</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
            <div class="list">
                <h2>축제 리스트</h2>
                <ul>
                    <li>
                        <div class="photo">
                            <img src="https://www.mcst.go.kr/attachFiles/cultureInfoCourt/localFestival/notifyFestival/1659318247159.jpg" alt="사진1" width="100px">
                        </div>
                        <div class="sub">
                                <a href="hanbok_8.25.jsp">2022 한복 상점</a>
                        </div>
                        <div class="text">
                                <p>[2022-08-25 ~ 2022-08-28]</p>
                        </div>
                    </li>
                    <li>
                        <div class="photo">
                            <img src="https://www.mcst.go.kr/attachFiles/cultureInfoCourt/localFestival/notifyFestival/1659318247159.jpg" alt="사진1" width="100px">
                        </div>
                        <div class="sub">
                                <a href="comedy_8.19.jsp">부산국제코미디페스티벌</a>
                        </div>
                        <div class="text">
                                <p>[2022-08-19 ~ 2022-08-28]</p>
                        </div>
                    </li>
                </ul>
            </div>
            <div class ="footer">
                <div class="email">
                    <p>문의 이메일 주소 : seoil.naver.com</p>
                </div>
                <div class ="FAQ">
                    <input type=button style= "width:40pt; height: 40pt;"  value="FAQ" onclick="location.href='FAQ.jsp'">
                </div>
                <div class ="sns">
                    <a href="https://www.instagram.com/mcstkorea/" target="_blank" title="새창">
                        <span class="fv fv_instagram"></span>
                        <p>인스타그램</p>
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>
