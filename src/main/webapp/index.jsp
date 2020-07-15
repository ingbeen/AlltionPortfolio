<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="./resources/css/index_main.css">
    <link rel="stylesheet" href="./resources/css/style.css">
    <link rel="stylesheet" href="./resources/css/index_main.css">
    <link href="https://fonts.googleapis.com/css2?
    family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <title>All-tion</title>
</head>
<body>
<a href="Mainlist.ms">리스트Test</a>
    <!-- 모든 페이지 공통 영역 by 하나  -->
    <!-- top 키 -->
    <div id="topKey" class="topKey_btn" >
        <span class="material-icons">
            keyboard_arrow_up
        </span>
    </div>
    <!-- 광고 배너 및 헤더 -->
    <div class="ad__banner"> 	
        <a href="https://coupa.ng/bEUWFN" target="_blank">
            <img src="https://ads-partners.coupang.com/banners/263827?subId=&traceId=V0-301-969b06e95b87326d-I263827&w=728&h=90" >
        </a>
        <button class="ad__banner--closeBtn"></button>
<!--
        <a href="#" class="ad__banner--link">
            <img src="img/header/adEx.png" class="ad__banner--img">
            <button class="ad__banner--closeBtn"></button>
        </a>
-->
    </div>
    <div class="header">
        <div class="upper_header">
            <div class="upper_header--nav">
                <p>
                    <a href="" id="clock"></a>
                </p>
                <ul>
                	<!-- jstl 바뀐 구문 로그인, 비 로그인 -by계정-->
                	<c:choose>

					<c:when test="${userId != null}"><!-- 메인페이지 로그인시 -->         
                    <li>
                        <a href="./mypage.kj">${userId}</a>
                    </li>
                    <li>
                        <a href="./logout.kj">로그아웃</a>
                    </li>
                    </c:when>
                    <c:otherwise><!-- 로그인 하지 않았을때 메인페이지 -->
                    <li>
                        <a href="./loginForm.kj">로그인</a>
                    </li>
                    <li>
                        <a href="./naverjoin.kj">회원 가입</a>
                    </li>
                    </c:otherwise>
                    </c:choose>
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
                        <a href="wishList.yb">
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
	
    <!-- 배너 영역 -->
    <div class="banner">
    </div>
    
    <!-- !! 메인 페이지 내용(지워서 사용함) !! start -->
    
    <!--  메뉴 카테고리  -->
    
    <div class="menu">
        <div class="menu__tab">
            <input type="radio" name="menu--name" id="popular-items" checked>
            <label for="popular-items">인기 경매</label>
            <input type="radio" name="menu--name" id="deadline-items">
            <label for="deadline-items">마감 임박</label>
            <input type="radio" name="menu--name" id="resell-items">
            <label for="resell-items">재경매</label>
            <input type="radio" name="menu--name" id="premium-items">
            <label for="premium-items">프리미엄관</label>
            <!--  인기 경매  -->
            <div class="menu-box content1">
                <ul class="items__list popular">
                    <li>
                        <a href="#">
                            <div class="product-box">
                               <img src="./resources/img/product/product_ex.png"><br>
                            </div>
                            <div class="items__product--info popular">
                                <p class="product_name">품목 이름</p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown">2020/06/15 00:00</span>
                                <div class="bookmark">
                                    <span class="material-icons bookmark_border">bookmark_border</span>
                                    <p class="bookmark--count">99</p>
                                </div>
                                <div class="price-txt">
                                    <p class="price_text">현재가</p>
                                    <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                    <p class="price_text">즉시 구매가</p>
                                    <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="product-box">
                               <img src="./resources/img/product/product_ex.png"><br>
                            </div>
                            <div class="items__product--info popular">
                                <p class="product_name">품목 이름</p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown">2020/06/15 00:00</span>
                                <div class="bookmark">
                                    <span class="material-icons bookmark_border">bookmark_border</span>
                                    <p class="bookmark--count">99</p>
                                </div>
                                <div class="price-txt">
                                    <p class="price_text">현재가</p>
                                    <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                    <p class="price_text">즉시 구매가</p>
                                    <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="product-box">
                               <img src="./resources/img/product/product_ex.png"><br>
                            </div>
                            <div class="items__product--info popular">
                                <p class="product_name">품목 이름</p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown">2020/06/15 00:00</span>
                                <div class="bookmark">
                                    <span class="material-icons bookmark_border">bookmark_border</span>
                                    <p class="bookmark--count">99</p>
                                </div>
                                <div class="price-txt">
                                    <p class="price_text">현재가</p>
                                    <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                    <p class="price_text">즉시 구매가</p>
                                    <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="product-box">
                               <img src="./resources/img/product/product_ex.png"><br>
                            </div>
                            <div class="items__product--info popular">
                                <p class="product_name">품목 이름</p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown">2020/06/15 00:00</span>
                                <div class="bookmark">
                                    <span class="material-icons bookmark_border">bookmark_border</span>
                                    <p class="bookmark--count">99</p>
                                </div>
                                <div class="price-txt">
                                    <p class="price_text">현재가</p>
                                    <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                    <p class="price_text">즉시 구매가</p>
                                    <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="product-box">
                               <img src="./resources/img/product/product_ex.png"><br>
                            </div>
                            <div class="items__product--info popular">
                                <p class="product_name">품목 이름</p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown">2020/06/15 00:00</span>
                                <div class="bookmark">
                                    <span class="material-icons bookmark_border">bookmark_border</span>
                                    <p class="bookmark--count">99</p>
                                </div>
                                <div class="price-txt">
                                    <p class="price_text">현재가</p>
                                    <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                    <p class="price_text">즉시 구매가</p>
                                    <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="product-box">
                               <img src="./resources/img/product/product_ex.png"><br>
                            </div>
                            <div class="items__product--info popular">
                                <p class="product_name">품목 이름</p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown">2020/06/15 00:00</span>
                                <div class="bookmark">
                                    <span class="material-icons bookmark_border">bookmark_border</span>
                                    <p class="bookmark--count">99</p>
                                </div>
                                <div class="price-txt">
                                    <p class="price_text">현재가</p>
                                    <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                    <p class="price_text">즉시 구매가</p>
                                    <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="product-box">
                               <img src="./resources/img/product/product_ex.png"><br>
                            </div>
                            <div class="items__product--info popular">
                                <p class="product_name">품목 이름</p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown">2020/06/15 00:00</span>
                                <div class="bookmark">
                                    <span class="material-icons bookmark_border">bookmark_border</span>
                                    <p class="bookmark--count">99</p>
                                </div>
                                <div class="price-txt">
                                    <p class="price_text">현재가</p>
                                    <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                    <p class="price_text">즉시 구매가</p>
                                    <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="product-box">
                               <img src="./resources/img/product/product_ex.png"><br>
                            </div>
                            <div class="items__product--info popular">
                                <p class="product_name">품목 이름</p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown">2020/06/15 00:00</span>
                                <div class="bookmark">
                                    <span class="material-icons bookmark_border">bookmark_border</span>
                                    <p class="bookmark--count">99</p>
                                </div>
                                <div class="price-txt">
                                    <p class="price_text">현재가</p>
                                    <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                    <p class="price_text">즉시 구매가</p>
                                    <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                </div>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
            <!--  마감 임박  -->
            <div class="menu-box content2">
                <ul class="deadline-items__category">
                    <li id="tab1" class="active">
                        패션
                    </li>
                    <li id="tab2">
                        뷰티
                    </li>
                    <li id="tab3">
                        출산/유아동
                    </li>
                    <li id="tab4">
                        전자기기
                    </li>
                    <li id="tab5">
                        가전제품
                    </li>
                    <li id="tab6">
                        가구/인테리어
                    </li>
                    <li id="tab7">
                        반려동물/취미
                    </li>
                    <li id="tab8">
                        도서/음반/문구
                    </li>
                    <li id="tab9">
                        티켓/쿠폰
                    </li>
                    <li id="tab10">
                        스포츠
                    </li>
                    <li id="tab11">
                        공구/산업용품
                    </li>
                    <li id="tab12">
                        기타 및 잡화
                    </li>
                </ul>
                <div class="deadline-items--product tab1 active">
                    <ul class="items__list deadline">
                        <li>
                            <div class="deadline-items__detail_menu">
                                <span class="deadline-items__detail menu1">
                                    <a href="#">패션</a>
                                </span>
                                <ul>
                                    <li>
                                        <a href="productList.html">#여성의류</a>
                                    </li>
                                    <li>
                                        <a href="#">#남성의류</a>
                                    </li>
                                    <li>
                                        <a href="#">#여성신발</a>
                                    </li>
                                    <li>
                                        <a href="#">#남성신발</a>
                                    </li>
                                    <li>
                                        <a href="#">#악세서리</a>
                                    </li>
                                    <li>
                                        <a href="#">#귀금속</a>
                                    </li>
                                    <li>
                                        <a href="#">#모자</a>
                                    </li>
                                    <li>
                                        <a href="#">#기타잡화/관련용품</a>
                                    </li>
                                    <li>
                                        <a href="#">#수입명품</a>
                                    </li>
                                </ul>
                            </div>                            
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="deadline-items--product tab2">
                    <ul class="items__list deadline">
                        <li>
                            <div class="deadline-items__detail_menu">
                                <span class="deadline-items__detail menu1">
                                    <a href="#">뷰티</a>
                                </span>
                                <ul>
                                    <li>
                                        <a href="#">#스킨케어</a>
                                    </li>
                                    <li>
                                        <a href="#">#메이크업</a>
                                    </li>
                                    <li>
                                        <a href="#">#헤어/바디</a>
                                    </li>
                                    <li>
                                        <a href="#">#향수</a>
                                    </li>
                                    <li>
                                        <a href="#">#네일케어</a>
                                    </li>
                                    <li>
                                        <a href="#">#남성화장품</a>
                                    </li>
                                    <li>
                                        <a href="#">#가발/기타용품</a>
                                    </li>
                                </ul>
                            </div>                            
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="deadline-items--product tab3">
                    <ul class="items__list deadline">
                        <li>
                            <div class="deadline-items__detail_menu">
                                <span class="deadline-items__detail menu3">
                                    <a href="#">출산/유아동</a>
                                </span>
                                <ul>
                                    <li>
                                        <a href="#">#여성의류</a>
                                    </li>
                                    <li>
                                        <a href="#">#남성의류</a>
                                    </li>
                                    <li>
                                        <a href="#">#여성신발</a>
                                    </li>
                                    <li>
                                        <a href="#">#남성신발</a>
                                    </li>
                                    <li>
                                        <a href="#">#악세서리</a>
                                    </li>
                                    <li>
                                        <a href="#">#귀금속</a>
                                    </li>
                                    <li>
                                        <a href="#">#모자</a>
                                    </li>
                                    <li>
                                        <a href="#">#기타잡화/관련용품</a>
                                    </li>
                                    <li>
                                        <a href="#">#수입명품</a>
                                    </li>
                                </ul>
                            </div>                            
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="deadline-items--product tab4">
                    <ul class="items__list deadline">
                        <li>
                            <div class="deadline-items__detail_menu">
                                <span class="deadline-items__detail menu4">
                                    <a href="#">전자기기</a>
                                </span>
                                <ul>
                                    <li>
                                        <a href="#">#여성의류</a>
                                    </li>
                                    <li>
                                        <a href="#">#남성의류</a>
                                    </li>
                                    <li>
                                        <a href="#">#여성신발</a>
                                    </li>
                                    <li>
                                        <a href="#">#남성신발</a>
                                    </li>
                                    <li>
                                        <a href="#">#악세서리</a>
                                    </li>
                                    <li>
                                        <a href="#">#귀금속</a>
                                    </li>
                                    <li>
                                        <a href="#">#모자</a>
                                    </li>
                                    <li>
                                        <a href="#">#기타잡화/관련용품</a>
                                    </li>
                                    <li>
                                        <a href="#">#수입명품</a>
                                    </li>
                                </ul>
                            </div>                            
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="deadline-items--product tab5">
                    <ul class="items__list deadline">
                        <li>
                            <div class="deadline-items__detail_menu">
                                <span class="deadline-items__detail menu5">
                                    <a href="#">가전제품</a>
                                </span>
                                <ul>
                                    <li>
                                        <a href="#">#여성의류</a>
                                    </li>
                                    <li>
                                        <a href="#">#남성의류</a>
                                    </li>
                                    <li>
                                        <a href="#">#여성신발</a>
                                    </li>
                                    <li>
                                        <a href="#">#남성신발</a>
                                    </li>
                                    <li>
                                        <a href="#">#악세서리</a>
                                    </li>
                                    <li>
                                        <a href="#">#귀금속</a>
                                    </li>
                                    <li>
                                        <a href="#">#모자</a>
                                    </li>
                                    <li>
                                        <a href="#">#기타잡화/관련용품</a>
                                    </li>
                                    <li>
                                        <a href="#">#수입명품</a>
                                    </li>
                                </ul>
                            </div>                            
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="deadline-items--product tab6">
                    <ul class="items__list deadline">
                        <li>
                            <div class="deadline-items__detail_menu">
                                <span class="deadline-items__detail menu6">
                                    <a href="#">가구/인테리어</a>
                                </span>
                                <ul>
                                    <li>
                                        <a href="#">#여성의류</a>
                                    </li>
                                    <li>
                                        <a href="#">#남성의류</a>
                                    </li>
                                    <li>
                                        <a href="#">#여성신발</a>
                                    </li>
                                    <li>
                                        <a href="#">#남성신발</a>
                                    </li>
                                    <li>
                                        <a href="#">#악세서리</a>
                                    </li>
                                    <li>
                                        <a href="#">#귀금속</a>
                                    </li>
                                    <li>
                                        <a href="#">#모자</a>
                                    </li>
                                    <li>
                                        <a href="#">#기타잡화/관련용품</a>
                                    </li>
                                    <li>
                                        <a href="#">#수입명품</a>
                                    </li>
                                </ul>
                            </div>                            
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="deadline-items--product tab7">
                    <ul class="items__list deadline">
                        <li>
                            <div class="deadline-items__detail_menu">
                                <span class="deadline-items__detail menu7">
                                    <a href="#">반려동물/취미</a>
                                </span>
                                <ul>
                                    <li>
                                        <a href="#">#여성의류</a>
                                    </li>
                                    <li>
                                        <a href="#">#남성의류</a>
                                    </li>
                                    <li>
                                        <a href="#">#여성신발</a>
                                    </li>
                                    <li>
                                        <a href="#">#남성신발</a>
                                    </li>
                                    <li>
                                        <a href="#">#악세서리</a>
                                    </li>
                                    <li>
                                        <a href="#">#귀금속</a>
                                    </li>
                                    <li>
                                        <a href="#">#모자</a>
                                    </li>
                                    <li>
                                        <a href="#">#기타잡화/관련용품</a>
                                    </li>
                                    <li>
                                        <a href="#">#수입명품</a>
                                    </li>
                                </ul>
                            </div>                            
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="deadline-items--product tab8">
                    <ul class="items__list deadline">
                        <li>
                            <div class="deadline-items__detail_menu">
                                <span class="deadline-items__detail menu8">
                                    <a href="#">도서/음반/문구</a>
                                </span>
                                <ul>
                                    <li>
                                        <a href="#">#여성의류</a>
                                    </li>
                                    <li>
                                        <a href="#">#남성의류</a>
                                    </li>
                                    <li>
                                        <a href="#">#여성신발</a>
                                    </li>
                                    <li>
                                        <a href="#">#남성신발</a>
                                    </li>
                                    <li>
                                        <a href="#">#악세서리</a>
                                    </li>
                                    <li>
                                        <a href="#">#귀금속</a>
                                    </li>
                                    <li>
                                        <a href="#">#모자</a>
                                    </li>
                                    <li>
                                        <a href="#">#기타잡화/관련용품</a>
                                    </li>
                                    <li>
                                        <a href="#">#수입명품</a>
                                    </li>
                                </ul>
                            </div>                            
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p><!-- 현재 가격 -->
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="deadline-items--product tab9">
                    <ul class="items__list deadline">
                        <li>
                            <div class="deadline-items__detail_menu">
                                <span class="deadline-items__detail menu9">
                                    <a href="#">티켓/쿠폰</a>
                                </span>
                                <ul>
                                    <li>
                                        <a href="#">#여성의류</a>
                                    </li>
                                    <li>
                                        <a href="#">#남성의류</a>
                                    </li>
                                    <li>
                                        <a href="#">#여성신발</a>
                                    </li>
                                    <li>
                                        <a href="#">#남성신발</a>
                                    </li>
                                    <li>
                                        <a href="#">#악세서리</a>
                                    </li>
                                    <li>
                                        <a href="#">#귀금속</a>
                                    </li>
                                    <li>
                                        <a href="#">#모자</a>
                                    </li>
                                    <li>
                                        <a href="#">#기타잡화/관련용품</a>
                                    </li>
                                    <li>
                                        <a href="#">#수입명품</a>
                                    </li>
                                </ul>
                            </div>                            
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="deadline-items--product tab10">
                    <ul class="items__list deadline">
                        <li>
                            <div class="deadline-items__detail_menu">
                                <span class="deadline-items__detail menu10">
                                    <a href="#">스포츠</a>
                                </span>
                                <ul>
                                    <li>
                                        <a href="#">#여성의류</a>
                                    </li>
                                    <li>
                                        <a href="#">#남성의류</a>
                                    </li>
                                    <li>
                                        <a href="#">#여성신발</a>
                                    </li>
                                    <li>
                                        <a href="#">#남성신발</a>
                                    </li>
                                    <li>
                                        <a href="#">#악세서리</a>
                                    </li>
                                    <li>
                                        <a href="#">#귀금속</a>
                                    </li>
                                    <li>
                                        <a href="#">#모자</a>
                                    </li>
                                    <li>
                                        <a href="#">#기타잡화/관련용품</a>
                                    </li>
                                    <li>
                                        <a href="#">#수입명품</a>
                                    </li>
                                </ul>
                            </div>                            
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="deadline-items--product tab11">
                    <ul class="items__list deadline">
                        <li>
                            <div class="deadline-items__detail_menu">
                                <span class="deadline-items__detail menu11">
                                    <a href="#">공구/산업 용품</a>
                                </span>
                                <ul>
                                    <li>
                                        <a href="#">#여성의류</a>
                                    </li>
                                    <li>
                                        <a href="#">#남성의류</a>
                                    </li>
                                    <li>
                                        <a href="#">#여성신발</a>
                                    </li>
                                    <li>
                                        <a href="#">#남성신발</a>
                                    </li>
                                    <li>
                                        <a href="#">#악세서리</a>
                                    </li>
                                    <li>
                                        <a href="#">#귀금속</a>
                                    </li>
                                    <li>
                                        <a href="#">#모자</a>
                                    </li>
                                    <li>
                                        <a href="#">#기타잡화/관련용품</a>
                                    </li>
                                    <li>
                                        <a href="#">#수입명품</a>
                                    </li>
                                </ul>
                            </div>                            
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="deadline-items--product tab12">
                    <ul class="items__list deadline">
                        <li>
                            <div class="deadline-items__detail_menu">
                                <span class="deadline-items__detail menu12">
                                    <a href="#">기타 및 잡화</a>
                                </span>
                            </div>                            
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info deadline">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown hour">2시간</span><!-- 남은 시간 기입 -->
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <!--  재경매  -->
            <div class="menu-box content3">
                <ul class="items__list resell">
                    <li>
                        <a href="#">
                            <div class="product-box">
                               <img src="./resources/img/product/product_ex.png"><br>
                            </div>
                            <div class="items__product--info resell">
                                <p class="product_name">품목 이름</p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown">2020/06/15 00:00</span>
                                <div class="bookmark">
                                    <span class="material-icons bookmark_border">bookmark_border</span>
                                    <p class="bookmark--count">99</p>
                                </div>
                                <div class="price-txt">
                                    <p class="price_text">현재가</p>
                                    <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                    <p class="price_text">즉시 구매가</p>
                                    <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="product-box">
                               <img src="./resources/img/product/product_ex.png"><br>
                            </div>
                            <div class="items__product--info resell">
                                <p class="product_name">품목 이름</p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown">2020/06/15 00:00</span>
                                <div class="bookmark">
                                    <span class="material-icons bookmark_border">bookmark_border</span>
                                    <p class="bookmark--count">99</p>
                                </div>
                                <div class="price-txt">
                                    <p class="price_text">현재가</p>
                                    <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                    <p class="price_text">즉시 구매가</p>
                                    <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="product-box">
                               <img src="./resources/img/product/product_ex.png"><br>
                            </div>
                            <div class="items__product--info resell">
                                <p class="product_name">품목 이름</p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown">2020/06/15 00:00</span>
                                <div class="bookmark">
                                    <span class="material-icons bookmark_border">bookmark_border</span>
                                    <p class="bookmark--count">99</p>
                                </div>
                                <div class="price-txt">
                                    <p class="price_text">현재가</p>
                                    <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                    <p class="price_text">즉시 구매가</p>
                                    <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="product-box">
                               <img src="./resources/img/product/product_ex.png"><br>
                            </div>
                            <div class="items__product--info resell">
                                <p class="product_name">품목 이름</p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown">2020/06/15 00:00</span>
                                <div class="bookmark">
                                    <span class="material-icons bookmark_border">bookmark_border</span>
                                    <p class="bookmark--count">99</p>
                                </div>
                                <div class="price-txt">
                                    <p class="price_text">현재가</p>
                                    <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                    <p class="price_text">즉시 구매가</p>
                                    <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="product-box">
                               <img src="./resources/img/product/product_ex.png"><br>
                            </div>
                            <div class="items__product--info resell">
                                <p class="product_name">품목 이름</p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown">2020/06/15 00:00</span>
                                <div class="bookmark">
                                    <span class="material-icons bookmark_border">bookmark_border</span>
                                    <p class="bookmark--count">99</p>
                                </div>
                                <div class="price-txt">
                                    <p class="price_text">현재가</p>
                                    <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                    <p class="price_text">즉시 구매가</p>
                                    <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="product-box">
                               <img src="./resources/img/product/product_ex.png"><br>
                            </div>
                            <div class="items__product--info resell">
                                <p class="product_name">품목 이름</p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown">2020/06/15 00:00</span>
                                <div class="bookmark">
                                    <span class="material-icons bookmark_border">bookmark_border</span>
                                    <p class="bookmark--count">99</p>
                                </div>
                                <div class="price-txt">
                                    <p class="price_text">현재가</p>
                                    <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                    <p class="price_text">즉시 구매가</p>
                                    <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="product-box">
                               <img src="./resources/img/product/product_ex.png"><br>
                            </div>
                            <div class="items__product--info resell">
                                <p class="product_name">품목 이름</p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown">2020/06/15 00:00</span>
                                <div class="bookmark">
                                    <span class="material-icons bookmark_border">bookmark_border</span>
                                    <p class="bookmark--count">99</p>
                                </div>
                                <div class="price-txt">
                                    <p class="price_text">현재가</p>
                                    <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                    <p class="price_text">즉시 구매가</p>
                                    <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="product-box">
                               <img src="./resources/img/product/product_ex.png"><br>
                            </div>
                            <div class="items__product--info resell">
                                <p class="product_name">품목 이름</p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown">2020/06/15 00:00</span>
                                <div class="bookmark">
                                    <span class="material-icons bookmark_border">bookmark_border</span>
                                    <p class="bookmark--count">99</p>
                                </div>
                                <div class="price-txt">
                                    <p class="price_text">현재가</p>
                                    <p class="current_price">9,999,999,999,999,999,999,999 원</p>
                                    <p class="price_text">즉시 구매가</p>
                                    <p class="direct_price">9,999,999,999,999,999,999,999 원</p>
                                </div>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
            <!--  프리미엄관  -->
            <div class="menu-box content4">프리미엄관 내용</div>
        </div>
    </div>
    
    <!-- 경매 규칙 및 회원 등급 제도 설명 -->
    <div class="rules">
        <div class="rules__content">
            <ul class="rules__content">
                <li></li>
                <li></li>
            </ul>
        </div>
    </div>
    <!-- !! 메인 페이지 내용(지워서 사용함) !! end -->
    
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
    <script type="text/javascript"></script>
    <script src="./resources/js/index_main.js"></script>

</body>
</html>