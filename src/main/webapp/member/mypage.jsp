<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.spring.alltion.login.MemberVO" %>
<%
	String id = (String)session.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <link rel="stylesheet" href="./resources/css/style.css">
    <link rel="stylesheet" href="./resources/css/mypage.css">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <title>All-tion - 마이 페이지</title>
    <style>
    </style>
</head>
<body>
    <!-- 모든 페이지 공통 영역 by 하나  -->
   
    <div class="header">
        <div class="upper_header">
            <div class="upper_header--nav">
                <p>
                    <a href="" id="clock"></a>
                </p>
                <ul>
                    <li>
                        <a href="./mypage.kj">${userId}</a>
                    </li>
                    <li>
                        <a href="./logout.kj">로그아웃</a>
                    </li>
                    <li>
                    	<a href="./registration.yb">판매하기</a>
                    </li>
                    <li>
                        <a href="#">고객 센터</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="lower_header">
            <div class="lower_header--nav">
                <h1 class="logo">
                    <a href="/alltion/">ALL-TION</a>
                </h1>
                <div class="category">
                    <a class="category--drop">
                        <img src="./resources/img/header/category_tab.png">
                    </a>
                </div>
                <div class="search">
                    <select class="search--select">
                        <option value="">전체</option>
                        <option value="패션">패션</option>
                        <option value="뷰티">뷰티</option>
                        <option value="출산/유아동">출산/유아동</option>
                        <option value="전자기기">전자기기</option>
                        <option value="가전제품">가전제품</option>
                        <option value="가구/인테리어">가구/인테리어</option>
                        <option value="반려동물/취미">반려동물/취미</option>
                        <option value="도서/음반/문구">도서/음반/문구</option>
                        <option value="티켓/쿠폰">티켓/쿠폰</option>
                        <option value="스포츠">스포츠</option>
                        <option value="공구/산업용품">공구/산업용품</option>
                        <option value="기타잡화">기타잡화</option>
                    </select>
                    <input type="text" placeholder="찾으시는 상품을 입력해 주세요" class="search__input">
                </div>
                <ul class="member_info">
                    <li>
                        <a href="./mypage.kj">
                            <span class="material-icons">perm_identity</span>
                            <span>마이 페이지</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="material-icons">turned_in_not</span>
                            <span>찜 목록</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="material-icons">access_time</span>
                            <span>참여 경매</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!--  마이 페이지 선택  -->
    <div class="myPage__main">
        <h3 class="myPage__title">마이 페이지</h3>
        <ul class="myPage__category">
            <li>
                <a href="./memberinfo.kj">
                    <span class="material-icons">recent_actors</span><br>
                    <span class="myPage__menu">회원 정보</span>
                    
                </a>
            </li>
            <li>
                <a href="">
                    <span class="material-icons">receipt</span><br>
                    <span class="myPage__menu">구매 정보</span>
                </a>
            </li>
            <li>
                <a href="">
                    <span class="material-icons">list</span><br>
                    <span class="myPage__menu">판매 정보</span>
                </a>
            </li>
            <li>
                <a href="">
                    <span class="material-icons">poll</span><br>
                    <span class="myPage__menu">참여 경매</span>
                </a>
            </li>
            <li>
                <a href="">
                    <span class="material-icons">credit_card</span><br>
                    <span class="myPage__menu">e-머니</span>
                </a>
            </li>
            <li>
                <a href="">
                    <span class="material-icons">bookmarks</span><br>
                    <span class="myPage__menu">찜 목록</span>
                </a>
            </li>
            <li>
                <a href="">
                    <span class="material-icons">money</span><br>
                    <span class="myPage__menu">신용 등급</span>
                </a>
            </li>
            
             <li>
                <a href="">
                    <span class="material-icons">forum</span><br>
                    <span class="myPage__menu">활동 내역</span>
                </a>
            </li>
        </ul>
    </div>
    <!-- 푸터 영역 -->
    <div class="footer">
        <div class="upper_footer">
            <ul class="upper_footer--list">
                <li>
                    <a href="#">
                        올션소개
                    </a>
                </li>
                <li>
                    <a href="#">
                        채용정보
                    </a>
                </li>
                <li>
                    <a href="#">
                        공지사항
                    </a>
                </li>
                <li>
                    <a href="#">
                        이용약관
                    </a>
                </li>
                <li>
                    <a href="#">
                        개인정보처리방침
                    </a>
                </li>
                <li>
                    <a href="#">
                        전자금융거래약관
                    </a>
                </li>
                <li>
                    <a href="#">
                        제휴서비스
                    </a>
                </li>
            </ul>
        </div>
        <div class="lower_footer">
            
        </div>        
    </div>
    
    <!--  스크립트 영역  -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
        $(function(){
            // 광고 없애기
            $(".ad__banner--closeBtn").click(function(){
                $(".ad__banner").hide();
			})
            
            // 헤더에 시간 넣기
            let time = new Date();
            
            
            // 헤더 고정
            let header = $('.lower_header');
            $(window).scroll(function(){
                if($(this).scrollTop() > 0){
                    header.addClass('sticky');
                }else{
                    header.removeClass('sticky');
                }
            })
        });
        
        // 2020-06-23 pm 03:55 추가
        // 실시간 시간 구하기
        setInterval(function(){
             
            let nowDate = new Date();
            let day = ['(일)', '(월)', '(화)', '(수)', '(목)', '(금)', '(토)'];
            let dayNum = nowDate.getDay();
            let year = nowDate.getFullYear();
            let month= nowDate.getMonth() + 1;
            let date = nowDate.getDate();
            let hour = nowDate.getHours();
            let min = nowDate.getMinutes();
            let sec = nowDate.getSeconds();
            
            /*
            // 오전 오후로 나누고 싶을 때
            let amPm = '오전';
            
            if(hour >= 12) {
                amPm = '오후';
                hour = hour - 12;
            }
            
            document.getElementById('clock').innerHTML = year + '년' + '&nbsp;' + month + '월' + '&nbsp;' + date + '일' + day[dayNum] + '&nbsp;' + amPm + '&nbsp;' + addZero(hour) + ":" + addZero(min) + ":" + addZero(sec);
            */
            
            document.getElementById('clock').innerHTML = year + '년' + '&nbsp;' + month + '월' + '&nbsp;' + date + '일' + day[dayNum] + '&nbsp;' + hour + ":" + addZero(min) + ":" + addZero(sec);
        },1000);
        
        // 일의 자리 숫자일 때 0 붙여 주기
        function addZero(i) {
            if (i < 10) {
                i = '0' + i
            };
            return i;
        } // 2020-06-23 pm 03:55 추가
        
    </script>

</body>
</html>