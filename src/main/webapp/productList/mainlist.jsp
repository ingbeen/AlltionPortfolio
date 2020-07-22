<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.alltion.productList.*" %>
<%@ page import="com.spring.alltion.productRegistration.ProductVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
 <%
  	List<ProductVO> mainlist=(List<ProductVO>)request.getAttribute("mainlist");
	List<ProductVO> pricelist=(List<ProductVO>)request.getAttribute("pricelist");
 	List<ProductVO> participantslist=(List<ProductVO>)request.getAttribute("participantslist");
	List<ProductVO> viewslist=(List<ProductVO>)request.getAttribute("viewslist");
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
    <link rel="stylesheet" href="resources/css/kakaoTalk.css">
    <link rel="shortcut icon" type="image⁄x-icon" href="./resources/img/header/logo.jpg">
    <link rel="stylesheet" href="./resources/css/style.css?after">
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
                        <a href="mypage.kj">
                            <span class="material-icons">perm_identity</span><br>
                            <span>마이 페이지</span>
                        </a>
                    </li>
                    <li>
                        <a href="wishList.yb">
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
    <div id="kakao-talk-channel-chat-button" style='display: none;'></div>
    <!-- 목록 페이지 -->
    
    <div class="product_list">
        <!-- 카테고리 영역 -->
        <div class="left_session cate">
            <div class="list_sidebar">
            <form id="fashion">
                <li class="mainmenu" style="cursor:pointer" value="1">패션</li>
                <ul class="submenu" style="display:none;">
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
                        <a href="./getCategory.ms?product_category_2=cate0108">기타잡화/관련용품</a>
                    </li>
                    <li>
                        <a href="./getCategory.ms?product_category_2=cate0109">수입명품</a>
                    </li>
                </ul>
                </form>
                <li class="mainmenu" style="cursor:pointer">뷰티</li>
                <ul class="submenu" style="display:none;">
                    <li>
                        <a href="./getCategorylist.ms?product_category_2=cate0201">스킨케어</a>
                    </li>
                    <li>
                        <a href="./getCategorylist.ms?product_category_2=cate0202">메이크업</a>
                    </li>
                    <li>
                        <a href="./getCategory.ms?product_category_2=cate0203">헤어/바디</a>
                    </li>
                    <li>
                        <a href="./getCategorylist.ms?product_category_2=cate0204">향수</a>
                    </li>
                    <li>
                        <a href="./getCategorylist.ms?product_category_2=cate0205">네일케어</a>
                    </li>
                    <li>
                        <a href="./getCategorylist.ms?product_category_2=cate0206">남성 화장품</a>
                    </li>
                    <li>
                        <a href="./getCategorylist.ms?product_category_2=cate0207">가발/기타용품</a>
                    </li>
                </ul>
                <li class="mainmenu" style="cursor:pointer">출산/유아동</li>
                <ul class="submenu" style="display:none;">
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
                 <% if(!pricelist.isEmpty()) { %>
                    <ul class="items__list list">
						<% for(int i=0; i<3;i++) { 
							if(i == mainlist.size()) {break;}
		                    	ProductVO vo = (ProductVO)pricelist.get(i);	%>
                        <li> 
                            <a href="/alltion/boarddetail.hs?product_number=<%=vo.getProduct_number() %>">
                                <div class="product-box">
                                   <img src=<%=vo.getProduct_img_1() %>><br>
                                </div>
                                <div class="items__product--info list">
                                    <p class="product_name"><%=vo.getProduct_subject() %></p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown"><%=vo.getProduct_issue_date() %> 00:00</span>
                                    <div class="bookmark">
                                        <span class="material-icons bookmark_border">bookmark_border</span>
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

                     <%} %>
                    </ul>
                <%} %>
                </div>
                <div class="slide1 fade" id="2">
                    <% if(!participantslist.isEmpty()) { %>
                    <ul class="items__list list">
						<%	for(int i=0; i<3;i++) { 
							if(i == participantslist.size()) {break;}
		                    	ProductVO vo = (ProductVO)participantslist.get(i);	%>
                        <li>
                        <a href="/alltion/boarddetail.hs?product_number=<%=vo.getProduct_number() %>">
                            <div class="product-box">
                               <img src=<%=vo.getProduct_img_1() %>><br>
                            </div>
                            <div class="items__product--info list">
                                <p class="product_name"><%=vo.getProduct_subject() %></p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown"><%=vo.getProduct_issue_date() %> 00:00</span>
                                <div class="bookmark">
                                    <span class="material-icons bookmark_border">bookmark_border</span>
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
                    	<%} %>
                    </ul>
                <%} %>  
                </div>
                <div class="slide1 fade" id="3">
                    <% if(!viewslist.isEmpty()) { %>
                    <ul class="items__list list">
						<%	for(int i=0; i<3;i++) { 
							if(i == viewslist.size()) {break;}
		                    	ProductVO vo = (ProductVO)viewslist.get(i);	%>
                        <li>
                        <a href="/alltion/boarddetail.hs?product_number=<%=vo.getProduct_number() %>">
                            <div class="product-box">
                               <img src=<%=vo.getProduct_img_1() %>><br>
                            </div>
                            <div class="items__product--info list">
                                <p class="product_name"><%=vo.getProduct_subject() %></p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown"><%=vo.getProduct_issue_date() %> 00:00</span>
                                <div class="bookmark">
                                    <span class="material-icons bookmark_border">bookmark_border</span>
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
                      <%} %>
                    </ul>
                    <%} %>
                </div>
                <div style="text-align:center">
                <% if(!pricelist.isEmpty()) { %>
                    <span class="dot"></span>
                    <%} %>
                    <% if(!participantslist.isEmpty()) { %>
                    <span class="dot"></span>
                    <%} %>
                    <% if(!viewslist.isEmpty()) { %>
                    <span class="dot"></span>
                    <%} %>
                </div>
            </div>
            <!-- 경매 목록 -->
            <div class="product_li">
                <div class="product_li-category">
                    <h4>전체</h4>
                </div>
                <select class="sort_list">
                    <option value="sort1">최신 순</option>
                    <option value="sort2">조회수 높은 순</option>
                    <option value="sort3">낮은 가격 순</option>
                    <option value="sort4">높은 가격 순</option>
                </select>
                
            <%
            	loop : for(int i=0; i<mainlist.size();i++){  		
            %>	       	
                <ul class="items__list product">
                <%for(int j=i; j<i+3;j++) {
                	if(j == mainlist.size()) {break loop;}
                	ProductVO vo = (ProductVO)mainlist.get(j);
                %>
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
                    <% if(j==i+2){
                    i=j;
                    break;}
                    }%>
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
    <script src="<c:url value="https://code.jquery.com/jquery-3.5.1.min.js" />"></script>
    <script src="<c:url value="/resources/js/common.js" />"></script>
    <script src="<c:url value="/resources/js/product_detail.js" />"></script>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="resources/js/kakaoTalk.js"></script>
</body>
</html>
