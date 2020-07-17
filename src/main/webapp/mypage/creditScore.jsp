<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.spring.alltion.creditScore.SaleCreditScoreVO" %>
<%@ page import = "com.spring.alltion.creditScore.PurchaseCreditScoreVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    SaleCreditScoreVO saleCreditVO = (SaleCreditScoreVO)request.getAttribute("saleCreditVO");
    PurchaseCreditScoreVO purchaseCreditVO  = (PurchaseCreditScoreVO)request.getAttribute("purchaseCreditVO");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./resources/css/style.css">
    <link rel="stylesheet" href="./resources/css/creditScore.css">
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
                        <option value="cate01">패션</option>
                        <option value="cate02">뷰티</option>
                        <option value="cate03">출산/유아동</option>
                        <option value="cate04">전자기기</option>
                        <option value="cate05">가전제품</option>
                        <option value="cate06">가구/인테리어</option>
                        <option value="cate07">반려동물/취미</option>
                        <option value="cate08">도서/음반/문구</option>
                        <option value="cate09">티켓/쿠폰</option>
                        <option value="cate10">스포츠</option>
                        <option value="cate11">공구/산업용품</option>
                        <option value="cate12">기타잡화</option>
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
                        <a href="wishList.yb?page=1&endDateFormat=0">
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
                            <span><%=saleCreditVO.getSale_normal() %> 건</span>
                        </div>
                    </li>
                    <li>
                        <div class="purchase_credit_score-form title">
                            <label>구매 거부</label>
                        </div>
                        <div class="purchase_credit_score-form content">
                            <span><%=saleCreditVO.getSale_denial() %> 건</span>
                        </div>
                    </li>
                    <li>
                        <div class="purchase_credit_score-form title">
                            <label>미입금</label>
                        </div>
                        <div class="purchase_credit_score-form content">
                            <span><%=saleCreditVO.getSale_undelivered() %> 건</span>
                        </div>
                    </li>

                    <li>
                        <div class="purchase_credit_score-form title">
                            <label>반품</label>
                        </div>
                        <div class="purchase_credit_score-form content">
                            <span><%=saleCreditVO.getSale_return() %> 건</span>
                        </div>
                    </li>
                    <li>
                        <div class="purchase_credit_score-form title">
                            <label>구매 성사율</label>
                        </div>
                        <div class="purchase_credit_score-form content">
                            <span><%=saleCreditVO.getSale_success_rate() %> %</span>
                        </div>
                    </li>
                    <li>
                        <div class="purchase_credit_score-form title">
                            <label>구매 신용도</label>
                        </div>
                        <div class="purchase_credit_score-form content">
                            <span><%=saleCreditVO.getSale_credit_score() %> 점</span>
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
                            <span><%=purchaseCreditVO.getPurchase_normal() %> 건</span>
                        </div>
                    </li>
                    <li>
                        <div class="sale_credit_score-form title">
                            <label>판매 거부</label>
                        </div>
                        <div class="sale_credit_score-form content">
                            <span><%=purchaseCreditVO.getPurchase_denial() %> 건</span>
                        </div>
                    </li>
                    <li>
                        <div class="sale_credit_score-form title">
                            <label>미배송</label>
                        </div>
                        <div class="sale_credit_score-form content">
                            <span><%=purchaseCreditVO.getPurchase_undelivered() %> 건</span>
                        </div>
                    </li>
                    <li>
                        <div class="sale_credit_score-form title">
                            <label>반품</label>
                        </div>
                        <div class="sale_credit_score-form content">
                            <span><%=purchaseCreditVO.getPurchase_return() %> 건</span>
                        </div>
                    </li>
                    <li>
                        <div class="sale_credit_score-form title">
                            <label>판매 성사율</label>
                        </div>
                        <div class="sale_credit_score-form content">
                            <span><%=purchaseCreditVO.getPurchase_success_rate() %> %</span>
                        </div>
                    </li>
                    <li>
                        <div class="sale_credit_score-form title">
                            <label>판매 신용도</label>
                        </div>
                        <div class="sale_credit_score-form content">
                            <span><%=purchaseCreditVO.getPurchase_credit_score() %> 점</span>
                        </div>
                    </li>
                </ul>
            </li>
        </ul>
        <div class="credit_score-btn">
            <button class="back_to_myPage" onclick="history.back()">뒤로 가기</button>
            <a href="" onclick="#">테스트</a>
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
            <ul class="lower_footer__content">
                <li>
                    <p>상호명 : (주)올션 / 짜면된다 / 주소: 서울특별시 종로구 삼일대로 서울특별시 서초구 서초4동 강남대로</p>
                    <p>Tel: 02-000-0000 Fax : 02-000-0000 메일 : master@alltion.co.kr</p>
                    <p>사업자등록번호 : ###-##-##### 통신판매업 신고번호 : 제##–###호</p>
                </li>
                <li>
                    <p>올션은 통신판매중개자이며 통신 판매의 당사자가 아닙니다. 따라서 올션은 상품·거래정보 및 거래에 대하여 책임을 지지 않습니다.</p> 
                    <p>Copyright © eBay Korea LLC All rights reserved.</p>
                </li>
            </ul>
        </div>
    </div>       
    
    <!--  스크립트 영역  -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="./resources/js/common.js"></script>
</body>
</html>