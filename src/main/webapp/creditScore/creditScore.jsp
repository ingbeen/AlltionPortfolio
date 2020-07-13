<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./resource/css/style.css">
    <link rel="stylesheet" href="./resource/css/creditScore.css">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <title>Alltion</title>
</head>
<body>
    <!-- 모든 페이지 공통 영역 by 하나  -->
    <!-- 배너 및 헤더 -->
    <div class="header">
        <div class="upper_header">
             <div class="upper_header--nav">
                <p>
                    <a href="" id="clock"></a>
                </p>
                <ul>
                    <li>
                        <a href="#">로그인</a>
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
                    <a href="#">ALL-TION</a>
                </h1>
                <div class="category">
                    <a class="category--drop">
                        <img src="./img/header/category_tab.png">
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
                        <a href="#">
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
    <!-- 등급 페이지 by 하나 -->
    <div class="credit_score_form">
        <ul class="member_credit_score">
            <li class="purchase_credit_score">
                <h3>구매 신용도</h3>
                <ul class="purchase_credit_score-info"> 
                    <li>
                        <div class="purchase_credit_score-form title">
                            <label>정상 거래</label>
                        </div>
                        <div class="purchase_credit_score-form content">
                            <span>12 건</span>
                        </div>
                    </li>
                    <li>
                        <div class="purchase_credit_score-form title">
                            <label>구매 거부</label>
                        </div>
                        <div class="purchase_credit_score-form content">
                            <span>12 건</span>
                        </div>
                    </li>
                    <li>
                        <div class="purchase_credit_score-form title">
                            <label>미입금</label>
                        </div>
                        <div class="purchase_credit_score-form content">
                            <span>12 건</span>
                        </div>
                    </li>

                    <li>
                        <div class="purchase_credit_score-form title">
                            <label>반품</label>
                        </div>
                        <div class="purchase_credit_score-form content">
                            <span>12 건</span>
                        </div>
                    </li>
                    <li>
                        <div class="purchase_credit_score-form title">
                            <label>구매 성사율</label>
                        </div>
                        <div class="purchase_credit_score-form content">
                            <span>12 %</span>
                        </div>
                    </li>
                    <li>
                        <div class="purchase_credit_score-form title">
                            <label>구매 신용도</label>
                        </div>
                        <div class="purchase_credit_score-form content">
                            <span>12 급</span>
                        </div>
                    </li>
                </ul>
            </li>
            <li class="sale_credit_score">
                <h3>판매 신용도</h3>
                <ul class="sale_credit_score-info">
                    <li>
                        <div class="sale_credit_score-form title">
                            <label>정상 거래</label>
                        </div>
                        <div class="sale_credit_score-form content">
                            <span>12 건</span>
                        </div>
                    </li>
                    <li>
                        <div class="sale_credit_score-form title">
                            <label>판매 거부</label>
                        </div>
                        <div class="sale_credit_score-form content">
                            <span>12 건</span>
                        </div>
                    </li>
                    <li>
                        <div class="sale_credit_score-form title">
                            <label>미배송</label>
                        </div>
                        <div class="sale_credit_score-form content">
                            <span>12 건</span>
                        </div>
                    </li>
                    <li>
                        <div class="sale_credit_score-form title">
                            <label>반품</label>
                        </div>
                        <div class="sale_credit_score-form content">
                            <span>12 건</span>
                        </div>
                    </li>
                    <li>
                        <div class="sale_credit_score-form title">
                            <label>판매 성사율</label>
                        </div>
                        <div class="sale_credit_score-form content">
                            <span>12 %</span>
                        </div>
                    </li>
                    <li>
                        <div class="sale_credit_score-form title">
                            <label>판매 신용도</label>
                        </div>
                        <div class="sale_credit_score-form content">
                            <span>12 급</span>
                        </div>
                    </li>
                </ul>
            </li>
        </ul>
        <div class="credit_score-btn">
            <button class="back_to_myPage" onclick="history.back()">뒤로 가기</button>
        </div>
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
    <script src="./resource/js/common.js"></script>
</body>
</html>