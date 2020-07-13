<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.alltion.productList.*" %>
<%@ page import="com.spring.alltion.productRegistration.ProductVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
 <%
  	List<ProductVO> mainlist=(List<ProductVO>)request.getAttribute("mainlist");
	/*
  	int listcount=((Integer)request.getAttribute("listcount")).intValue();
  	int nowpage=((Integer)request.getAttribute("page")).intValue();
  	int maxpage=((Integer)request.getAttribute("maxpage")).intValue();
  	int startpage=((Integer)request.getAttribute("startpage")).intValue();
  	int endpage=((Integer)request.getAttribute("endpage")).intValue();
  	*/
  %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/css/product_list.css" />">
    <link href="<c:url value="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap"/>" rel="stylesheet">
    <link href="<c:url value="https://fonts.googleapis.com/icon?family=Material+Icons"/>" rel="stylesheet">
    <title>All-tion</title>
</head>

<body>
    <!-- 모든 페이지 공통 영역 by 하나  -->
    <!-- top 키 -->
    <div id="topKey" class="topKey_btn" >
        <span class="material-icons">
            keyboard_arrow_up
        </span>
    </div>
    <!-- 헤더 -->
    <div class="header">
        <div class="upper_header">
            <div class="upper_header--nav">
                <p>
                    <a href="" id="clock"></a>
                </p>
                <ul>
                    <li>
                        <a href="loginForm.html">로그인</a>
                    </li>
                    <li>
                        <a href="joinForm.html">회원 가입</a>
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
                    <a href="index.html">ALL-TION</a>
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
                        <a href="mypage.html">
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
    <!-- 목록 페이지 -->
    
    <div class="product_list">
        <!-- 카테고리 영역 -->
        <div class="left_session cate">
            <div class="list_sidebar">
            <form id="fashion">
                <li class="mainmenu" style="cursor:pointer" value="1">패션</li>
                <ul class="submenu" style="display:none;">
                    <li>
                        <a href="/categoryCheck.ms" onclick="document.getElemnetById('fashion').submit();" value="a">여성의류</a>
                    </li>
                    <li>
                        <a href="./productList.ms?product_category_2=b&product_category_1=1">남성의류</a>
                    </li>
                    <li>
                        <a href="./productList.ms?product_category_2=c&product_category_1=1">여성신발</a>
                    </li>
                    <li>
                        <a href="./productList.ms?product_category_2=d&product_category_1=1">남성신발</a>
                    </li>
                    <li>
                        <a href="./productList.ms?product_category_2=e&product_category_1=1">악세서리</a>
                    </li>
                    <li>
                        <a href="./productList.ms?product_category_2=f&product_category_1=1">귀금속</a>
                    </li>
                    <li>
                        <a href="./productList.ms?product_category_2=g&product_category_1=1">모자</a>
                    </li>
                    <li>
                        <a href="./productList.ms?product_category_2=h&product_category_1=1">기타잡화/관련용품</a>
                    </li>
                    <li>
                        <a href="./productList.ms?product_category_2=i&product_category_1=1">수입명품</a>
                    </li>
                </ul>
                </form>
                <li class="mainmenu" style="cursor:pointer">뷰티</li>
                <ul class="submenu" style="display:none;">
                    <li>
                        <a href="./productList.ms?product_category_2=a&product_category_1=2">스킨케어</a>
                    </li>
                    <li>
                        <a href="./productList.ms?product_category_2=b&product_category_1=2">메이크업</a>
                    </li>
                    <li>
                        <a href="./productList.ms?product_category_2=c&product_category_1=2">헤어/바디</a>
                    </li>
                    <li>
                        <a href="./productList.ms?product_category_2=d&product_category_1=2">향수</a>
                    </li>
                    <li>
                        <a href="./productList.ms?product_category_2=e&product_category_1=2">네일케어</a>
                    </li>
                    <li>
                        <a href="./productList.ms?product_category_2=f&product_category_1=2">남성 화장품</a>
                    </li>
                    <li>
                        <a href="./productList.ms?product_category_2=g&product_category_1=2">가발/기타용품</a>
                    </li>
                </ul>
                <li class="mainmenu" style="cursor:pointer">출산/유아동</li>
                <ul class="submenu" style="display:none;">
                    <li>
                        <a href="#">출산/육아용품</a>
                    </li>
                    <li>
                        <a href="#">유아동안전/실내용품</a>
                    </li>
                    <li>
                        <a href="#">유아동의류</a>
                    </li>
                    <li>
                        <a href="#">유아동잡화</a>
                    </li>
                    <li>
                        <a href="#">유아동가구</a>
                    </li>
                    <li>
                        <a href="#">기타 유아동용품</a>
                    </li>
                </ul>
                <li class="mainmenu" style="cursor:pointer">전자기기</li>
                <li class="mainmenu" style="cursor:pointer">가전제품</li>
                <li class="mainmenu" style="cursor:pointer">가구/인테리어</li>
                <li class="mainmenu" style="cursor:pointer">반려동물/취미</li>
                <li class="mainmenu" style="cursor:pointer">도서/음반/문구</li>
                <li class="mainmenu" style="cursor:pointer">티켓/쿠폰</li>
                <li class="mainmenu" style="cursor:pointer">스포츠</li>
                <li class="mainmenu" style="cursor:pointer">공구/산업용품</li>
                <li class="mainmenu" style="cursor:pointer">기타잡화</li>
                <!--</div>-->
            </div>
        </div>
        <!-- 상품 목록 영역 -->

        <div class="right_session slideshow-container">
            <!-- 인기 경매 영역 -->
            <div class="hot_item">
                <h4>인기 경매</h4>
                <div class="slide1 fade" id="1">
                    <ul class="items__list list">
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info list">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown">2020/06/15 00:00</span>
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">8,888,888,888,888,888 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">8,888,888,888,888,888 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info list">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown">2020/06/15 00:00</span>
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">8,888,888,888,888,888 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">8,888,888,888,888,888 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="product-box">
                                   <img src="./resources/img/product/product_ex.png"><br>
                                </div>
                                <div class="items__product--info list">
                                    <p class="product_name">품목 이름</p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown">2020/06/15 00:00</span>
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
                                        <p class="bookmark--count">99</p>
                                    </div>
                                    <div class="price-txt">
                                        <p class="price_text">현재가</p>
                                        <p class="current_price">8,888,888,888,888,888 원</p>
                                        <p class="price_text">즉시 구매가</p>
                                        <p class="direct_price">8,888,888,888,888,888 원</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="slide1 fade" id="2">
                    <ul class="items__list list">
                        <li>
                        <a href="#">
                            <div class="product-box">
                               <img src="./resources/img/product/product_ex.png"><br>
                            </div>
                            <div class="items__product--info list">
                                <p class="product_name">품목 이름</p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown">2020/06/15 00:00</span>
                                <div class="bookmark">
                                    <span class="material-icons bookmark_border">bookmark_border</span>
                                    <p class="bookmark--count">99</p>
                                </div>
                                <div class="price-txt">
                                    <p class="price_text">현재가</p>
                                    <p class="current_price">9,999,999,999,999,999 원</p>
                                    <p class="price_text">즉시 구매가</p>
                                    <p class="direct_price">9,999,999,999,999,999 원</p>
                                </div>
                            </div>
                        </a>
                    </li>
                        <li>
                        <a href="#">
                            <div class="product-box">
                               <img src="./resources/img/product/product_ex.png"><br>
                            </div>
                            <div class="items__product--info list">
                                <p class="product_name">품목 이름</p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown">2020/06/15 00:00</span>
                                <div class="bookmark">
                                    <span class="material-icons bookmark_border">bookmark_border</span>
                                    <p class="bookmark--count">99</p>
                                </div>
                                <div class="price-txt">
                                    <p class="price_text">현재가</p>
                                    <p class="current_price">9,999,999,999,999,999 원</p>
                                    <p class="price_text">즉시 구매가</p>
                                    <p class="direct_price">9,999,999,999,999,999 원</p>
                                </div>
                            </div>
                        </a>
                    </li>
                        <li>
                        <a href="#">
                            <div class="product-box">
                               <img src="./resources/img/product/product_ex.png"><br>
                            </div>
                            <div class="items__product--info list">
                                <p class="product_name">품목 이름</p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown">2020/06/15 00:00</span>
                                <div class="bookmark">
                                    <span class="material-icons bookmark_border">bookmark_border</span>
                                    <p class="bookmark--count">99</p>
                                </div>
                                <div class="price-txt">
                                    <p class="price_text">현재가</p>
                                    <p class="current_price">9,999,999,999,999,999 원</p>
                                    <p class="price_text">즉시 구매가</p>
                                    <p class="direct_price">9,999,999,999,999,999 원</p>
                                </div>
                            </div>
                        </a>
                    </li>
                    </ul>
                </div>
                <div class="slide1 fade" id="3">
                    <ul class="items__list list">
                        <li>
                        <a href="#">
                            <div class="product-box">
                               <img src="./resources/img/product/product_ex.png"><br>
                            </div>
                            <div class="items__product--info list">
                                <p class="product_name">품목 이름</p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown">2020/06/15 00:00</span>
                                <div class="bookmark">
                                    <span class="material-icons bookmark_border">bookmark_border</span>
                                    <p class="bookmark--count">99</p>
                                </div>
                                <div class="price-txt">
                                    <p class="price_text">현재가</p>
                                    <p class="current_price">1,111,111,111,111,111 원</p>
                                    <p class="price_text">즉시 구매가</p>
                                    <p class="direct_price">1,111,111,111,111,111 원</p>
                                </div>
                            </div>
                        </a>
                    </li>
                        <li>
                        <a href="#">
                            <div class="product-box">
                               <img src="./resources/img/product/product_ex.png"><br>
                            </div>
                            <div class="items__product--info list">
                                <p class="product_name">품목 이름</p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown">2020/06/15 00:00</span>
                                <div class="bookmark">
                                    <span class="material-icons bookmark_border">bookmark_border</span>
                                    <p class="bookmark--count">99</p>
                                </div>
                                <div class="price-txt">
                                    <p class="price_text">현재가</p>
                                    <p class="current_price">1,111,111,111,111,111 원</p>
                                    <p class="price_text">즉시 구매가</p>
                                    <p class="direct_price">1,111,111,111,111,111 원</p>
                                </div>
                            </div>
                        </a>
                    </li>
                        <li>
                        <a href="#">
                            <div class="product-box">
                               <img src="./resources/img/product/product_ex.png"><br>
                            </div>
                            <div class="items__product--info list">
                                <p class="product_name">품목 이름</p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown">2020/06/15 00:00</span>
                                <div class="bookmark">
                                    <span class="material-icons bookmark_border">bookmark_border</span>
                                    <p class="bookmark--count">99</p>
                                </div>
                                <div class="price-txt">
                                    <p class="price_text">현재가</p>
                                    <p class="current_price">1,111,111,111,111,111 원</p>
                                    <p class="price_text">즉시 구매가</p>
                                    <p class="direct_price">1,111,111,111,111,111 원</p>
                                </div>
                            </div>
                        </a>
                    </li>
                    </ul>
                </div>
                <div style="text-align:center">
                    <span class="dot"></span>
                    <span class="dot"></span>
                    <span class="dot"></span>
                </div>
            </div>
            <!-- 경매 목록 -->
            <div class="product_li">
                <div class="product_li-category">
                    <h4>패션</h4>
                    <span>&#62;</span>
                    <span>수입 명품</span>
                </div>
                <select class="sort_list">
                    <option value="sort1">최신 순</option>
                    <option value="sort2">조회수 높은 순</option>
                    <option value="sort3">낮은 가격 순</option>
                    <option value="sort4">높은 가격 순</option>
                </select>
                
            <%
            System.out.println(mainlist.size());
            	for(int i=0; i<mainlist.size();i++){  		
            		ProductVO vo = (ProductVO)mainlist.get(i);
            %>	       	
                <ul class="items__list product">
                    <li>
                    	<a href="/alltion/boarddetail.hs?product_number=<%=vo.getProduct_number() %>">
                            <div class="product-box">
                               <img src=<%=vo.getProduct_img_1() %>><br>
                            </div>
                            <div class="items__product--info product">
                                <p class="product_name"><%=vo.getProduct_subject() %></p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown"><%=vo.getProduct_issue_date() %> 00:00</span>
                                <div class="bookmark">
                                    <span class="material-icons bookmark_border">bookmark_border</span>
                                    <p class="bookmark--count">99</p>
                                </div>
                                <div class="price-txt">
                                    <p class="price_text">현재가</p>
                                    <p class="current_price"><%=vo.getProduct_current_price() %> 원</p>
                                    <p class="price_text">즉시 구매가</p>
                                    <p class="direct_price"><%=vo.getProduct_purchase_price() %> 원</p>
                                </div>
                            </div>
                        </a>
                    </li>
                    </ul>
                 <%} %>
                
            </div>
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
    <script src="<c:url value="https://code.jquery.com/jquery-3.5.1.min.js" />"></script>
    <script src="<c:url value="/resources/js/common.js" />"></script>
    <script src="<c:url value="/resources/js/product_detail.js" />"></script>
</body>
</html>
