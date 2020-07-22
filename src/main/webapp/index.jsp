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
    <link rel="stylesheet" href="resources/css/kakaoTalk.css">
    <link rel="shortcut icon" type="image⁄x-icon" href="./resources/img/header/logo.jpg">
    <link rel="stylesheet" href="./resources/css/style.css?after">
</head>
<body>
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
        <button style="background:url(./resources/img/header/close_btn.png);" class="ad__banner--closeBtn"></button>
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
                                        <div class="category--dropdown">
                        <ul class="whole_menu">
                            <li>
                                <a>
									패션
                                </a>
                                <span class="material-icons">
                                    arrow_right
                                </span>
                                <ul class="cate01">
                                    <h4>패션</h4>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0101">여성의류</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0102">남성의류</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0103">여성신발</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0104">남성신발</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0105">악세서리</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0106">귀금속</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0107">모자</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0108">기타잡화/관련용품</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0109">수입명품</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a>
									뷰티
                                </a>
                                <span class="material-icons">
                                    arrow_right
                                </span>
                                <ul class="cate02">
                                    <h4>뷰티</h4>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0201">스킨케어</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0202">메이크업</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0203">헤어/바디</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0204">향수</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0205">네일케어</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0206">남성화장품</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0207">가발/기타용품</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a>
									출산/유아동
                                </a>
                                <span class="material-icons">
                                    arrow_right
                                </span>
                                <ul class="cate03">
                                    <h4>출산/유아동</h4>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0301">출산/육아용품</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0302">유아동안전/실내용품</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0303">유아동의류</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0304">유아동잡화</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0305">유아동가구</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0306">기타 유아동용품</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a>
									전자기기
                                </a>
                                <span class="material-icons">
                                    arrow_right
                                </span>
                                <ul class="cate04">
                                    <h4>전자기기</h4>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0401">모바일</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0402">태블릿PC</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0403">노트북</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0404">데스크탑</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0405">카메라</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0406">캠코더</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a>
									가전제품
                                </a>
                                <span class="material-icons">
                                    arrow_right
                                </span>
                                <ul class="cate05">
                                    <h4>가전제품</h4>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0501">냉장고</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0502">TV</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0503">세탁기/건조기</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0504">주방가전</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0505">스마트홈</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0506">영상가전</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0507">음향가전</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0508">계절가전</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0509">생활가전</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0510">기타 가전제품</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a>
									가구/인테리어
                                </a>
                                <span class="material-icons">
                                    arrow_right
                                </span>
                                <ul class="cate06">
                                    <h4>가구/인테리어</h4>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0601">침실가구</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0602">거실가구</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0603">주방가구</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0604">수납/선반/공간박스</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0605">사무용가구</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0606">기타가구</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0607">침구</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0608">커튼/카페트</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0609">인테리어소품</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0610">이벤트/파티용품</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0611">리빙생활</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a>
									반려동물/취미
                                </a>
                                <span class="material-icons">
                                    arrow_right
                                </span>
                                <ul class="cate07">
                                    <h4>반려동물/취미</h4>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0701">반려동물</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0702">키덜트</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0703">핸드메이드/DIY</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0704">악기</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0705">예술작품/골동품/수집</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0706">미술재료/미술도구</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0707">게임</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a>
									도서/음반/문구
                                </a>
                                <span class="material-icons">
                                    arrow_right
                                </span>
                                <ul class="cate08">
                                    <h4>도서/음반/문구</h4>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0801">유아동도서/음반</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0802">학습/교육</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0803">소설/만화책</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0804">여행/취미/레저</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0805">문화/과학/경영</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0806">예술/디자인</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0807">잡지</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0808">기타도서</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0809">음반/DVD/굿즈</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0810">문구/사무용품</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a>
									티켓/쿠폰
                                </a>
                                <span class="material-icons">
                                    arrow_right
                                </span>
                                <ul class="cate09">
                                    <h4>티켓/쿠폰</h4>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0901">티켓</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0902">상품권/쿠폰</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0903">여행숙박/이용권</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate0904">기타티켓/쿠폰/이용권</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a>
									 스포츠
                                </a>
                                <span class="material-icons">
                                    arrow_right
                                </span>
                                <ul class="cate10">
                                    <h4>스포츠</h4>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate1001">골프</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate1002">자전거</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate1003">인라인/스케이트/전동</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate1004">축구</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate1005">야구</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate1006">농구</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate1007">라켓스포츠</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate1008">헬스/요가</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate1009">수상스포츠</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate1010">검도/격투/권투</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate1011">기타 스포츠</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate1012">레저/여행</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a>
									공구/산업용품
                                </a>
                                <span class="material-icons">
                                    arrow_right
                                </span>
                                <ul class="cate11">
                                    <h4>공구/산업용품</h4>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate1101">드릴/전동공구</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate1102">에어/유압</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate1103">작업공구</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate1104">측정공구</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate1105">초경/절삭/접착윤활</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate1106">전기/전자</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate1107">배관설비/포장운송</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate1108">금형공작</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate1109">용접기자재</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate1110">산업/안전/공구함</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate1111">산업자재</a>
                                    </li>
                                    <li>
                                        <a href="./getCategorylist.ms?product_category_2=cate1112">농기계/농업용공구</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="./getCategorylist.ms?product_category_2=cate1201">
									기타잡화
                                </a>
                                <span class="material-icons">
                                    arrow_right
                                </span>
                                <ul class="cate12">
                                    <li>
                                        <a>기타 잡화</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
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
                            <span class="material-icons">perm_identity</span><br>
                            <span>마이 페이지</span>
                        </a>
                    </li>
                    <li>
                        <a href="wishList.yb?page=1&endDateFormat=0">
                            <span class="material-icons">turned_in_not</span><br>
                            <span>찜 목록</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="material-icons">access_time</span><br>
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
    <div id="kakao-talk-channel-chat-button" style='display: none;'></div>
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
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script src="resources/js/kakaoTalk.js"></script>
</body>
</html>