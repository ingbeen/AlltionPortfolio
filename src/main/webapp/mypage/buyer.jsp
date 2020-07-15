<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.spring.alltion.login.MemberVO" %>
<%@ page import = "com.spring.alltion.test.Product_kjVO" %>
<%@ page import = "java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%	
	ArrayList<Product_kjVO> product_list =
			(ArrayList<Product_kjVO>)request.getAttribute("product_list");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="./resources/css/style.css">
    <link rel="stylesheet" href="./resources/css/buyer.css">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <title>All-tion</title>
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
                        <a href="./mypage.kj">${userId}</a>
                    </li>
                    <li>
                        <a href="./logout.kj">로그아웃</a>
                    </li>
                    <li>
                    	<a href="./registration.yb">판매하기</a>
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
    <!--구매 중-->
    	<%if(product_list.size()==0) {%>
    	<div class="buyer--form">
    	<h3>구매 중 경매가 없습니다.</h3>
    	</div>
    	<%}else{ %>
    	<%
        	for(int i = 0; i < product_list.size(); i++)
        	{
        		Product_kjVO vo = (Product_kjVO)product_list.get(i);
        	
        %> 
       
        <div class="buyer--form">
        <h3>구매 중 경매</h3>
            <div class="buyer--content">
                <ul class="buyer_form list">
                    <li>
                        <div class="buyer_form__list title">
                            <span>상품 번호</span>
                        </div>
                        <div class="buyer_form__list content">
                        <span><%=vo.getProduct_number() %></span>
                        </div>    
                    </li>
                </ul>
                <ul class="buyer_form list">
                    <li>
                        <div class="buyer_form__list title">
                            <span>상품명</span>
                        </div>
                        <div class="buyer_form__list content">
                        <span><%=vo.getProduct_subject() %></span>
                        </div>    
                    </li>
                </ul>
                <ul class="buyer_form list">
                    <li>
                        <div class="buyer_form__list title">
                            <span>구매 가격</span>
                        </div>
                        <div class="buyer_form__list content">
                        <span><%=vo.getProduct_purchase_price() %></span>
                        </div>    
                    </li>
                </ul>
                <ul class="buyer_form list">
                    <li>
                        <div class="buyer_form__list title">
                            <span>입금 기한</span>
                        </div>
                        <div class="buyer_form__list content">
                        <span><%=vo.getTrading_deposit_deadline() %></span>
                        </div>    
                    </li>
                </ul>
                <ul class="buyer_form list">
                    <li>
                        <div class="buyer_form__list title">
                            <span>거래 방식</span>
                        </div>
                        <div class="buyer_form__list content">
                        <span><%=vo.getTrading_transaction_method() %></span>
                        </div>    
                    </li>
                </ul>
                <ul class="buyer_form list">
                    <li>
                        <div class="buyer_form__list title">
                            <span>판매자</span>
                        </div>
                        <div class="buyer_form__list content">
                        	<span><%=vo.getProduct_id() %></span>
                        </div>    
                    </li>
                </ul>
               
        </div>
        <a href = "./buyer_deal.kj"  class = "base_btn">거래 하기</a>
    </div>
    <%
        	}}
    %>
    
    <!--구매 완료 -->
        <div class="buyer--form">
            <h3>구매 완료</h3>
            <div class="buyer--content">
                <ul class="buyer_form list">
                    <li>
                        <div class="buyer_form__list title">
                            <span>상품 번호</span>
                        </div>
                        <div class="buyer_form__list content">
                            
                        </div>    
                    </li>
                </ul>
                <ul class="buyer_form list">
                    <li>
                        <div class="buyer_form__list title">
                            <span>상품명</span>
                        </div>
                        <div class="buyer_form__list content">
                            <h4></h4>
                        </div>    
                    </li>
                </ul>
                <ul class="buyer_form list">
                    <li>
                        <div class="buyer_form__list title">
                            <span>구매 가격</span>
                        </div>
                        <div class="buyer_form__list content">
                            <h4></h4>
                        </div>    
                    </li>
                </ul>
                <ul class="buyer_form list">
                    <li>
                        <div class="buyer_form__list title">
                            <span>구매 날짜</span>
                        </div>
                        <div class="buyer_form__list content">
                            <h4></h4>
                        </div>    
                    </li>
                </ul>
                <ul class="buyer_form list">
                    <li>
                        <div class="buyer_form__list title">
                            <span>판매자</span>
                        </div>
                        <div class="buyer_form__list content">
                            <h4></h4>
                        </div>    
                    </li>
                </ul> 
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