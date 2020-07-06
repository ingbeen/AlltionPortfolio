<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <link rel="stylesheet" href="./resources/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
    <title>All-tion</title>
     
    <style>
.joinWrap {
    padding: 100px;
    text-align: center;
    font-family: "맑은 고딕","Malgun Gothic";
}
.joinWrap h3 {
    font-size: 26px;
    font-weight: bold;
    text-align: center;
    color: #393939;
    margin-bottom: 30px;
}
.joinWrap p {
    font-size: 18px;
    text-align: center;
    color: #666;
}
.joinWrap ul {
    overflow: hidden;
    width: 660px;
    margin: 40px auto 0;
    border: 3px solid #e8e8e8;
    box-sizing: border-box;
}
.joinWrap ul li:first-child {
    border-right: 1px solid #e8e8e8;
    box-sizing: border-box;
}
.joinWrap ul li dl dt {
    padding-bottom: 20px;
    font-size: 16px;
    color: #333;
    font-weight: bold;
    line-height: 16px;
}
.joinWrap ul li dl dd {
    display: table;
    width: 100%;
    height: 44px;
    vertical-align: top;
}
.joinWrap ul li {
    float: left;
    width: 327px;
    padding: 40px 0;
    text-align: center;
}
.joinWrap .sns_joinbtn {
    display: table-cell;
    vertical-align: middle;
    height: 175px;
}
.joinWrap .sns_joinbtn a.naver {
    background: #1ec700;
}
body a.base_btn {
    display: inline-block;
    height: 44px;
    padding: 0 60px;
    min-width: 118px;
    line-height: 43px;
    background: #FFAE36;
    font-size: 14px;
    font-weight: bold;
    color: #fff;
    text-align: center;
    vertical-align: middle;
    font-family: "맑은 고딕","Malgun Gothic";
    border-radius: 7px;
}
body a.base_btn1 {
    display: inline-block;
    height: 44px;
    padding: 0 20px;
    min-width: 118px;
    line-height: 43px;
    background: #1ec700;
    font-size: 14px;
    font-weight: bold;
    color: #fff;
    text-align: center;
    vertical-align: middle;
    font-family: "맑은 고딕","Malgun Gothic";
    border-radius: 7px;
}
        
    </style>
</head>
<body>
    <!-- 모든 페이지 공통 영역 by 하나  -->
    
    <div class="header">
        <div class="upper_header">
            <div class="upper_header--nav">
                <p>
                    <a href="">고객 센터</a>
                </p>
                <ul>
                    <li>
                        <a href="loginForm.kj">로그인</a>
                    </li>
                    <li>
                        <a href="#">회원 가입</a>
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
                        <a href="./loginForm.kj">
                            <span class="material-icons">perm_identity</span>
                            <span>마이 페이지</span>
                        </a>
                    </li>
                    <li>
                        <a href="./loginForm.kj">
                            <span class="material-icons">turned_in_not</span>
                            <span>찜 목록</span>
                        </a>
                    </li>
                    <li>
                        <a href="./loginForm.kj">
                            <span class="material-icons">access_time</span>
                            <span>참여 경매</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    
    <!-- 회원 가입 폼 -->
    <div class = "joinWrap">
        <h3>All-tion 통합회원가입</h3>
        <p>
        한 번의 통합회원가입으로
        <br>
        편리하게 All-tion을 이용하세요
        </p>
    <ul>
        <li>
            <dl>
                <dt>기본 회원가입</dt>
                    <dd>
                        <p>
                            <a href ="joinForm.kj" class = "base_btn">회원가입</a>
                        </p>
                    </dd>
            </dl>
        </li>    
        <li>
            <dl>
                <dt>SNS 간편 회원가입</dt>
                    <dd>
                        
                        <div id="naver_id_login" style="text-align:center"><a href="${url}" class = "base_btn1">
                        N&nbsp;&nbsp;네이버 간편 회원가입</a></div>
                        
                    </dd>
            </dl>
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
            
            // 헤더 고정
            var header = $('.lower_header');
            $(window).scroll(function(){
                if($(this).scrollTop() > 0){
                        header.addClass('sticky');
                   }else{
                        header.removeClass('sticky');
                   }
            })
            
            // 카테고리 누를 때마다 이동
            $("ul.deadline-items__category a").click(function(){
//                
//                var activeTab = $(this).attr('id');
//                
//				$('ul.deadline-items__category a').removeClass('active');
//				$('.menu-box').removeClass('active');
//				$(this).prop('checked', true);
//				$('div#' + activeTab).addClass('active');
            })
        });
    </script>
</body>
</html>