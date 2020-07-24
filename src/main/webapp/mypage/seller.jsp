<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.spring.alltion.test.Product_kjVO" %>
<%@ page import = "java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%	
	ArrayList<Product_kjVO> getSale_list = (ArrayList<Product_kjVO>)request.getAttribute("getSale_list");
%>
<%
	ArrayList<Product_kjVO> dealcompleteseller_list = (ArrayList<Product_kjVO>)request.getAttribute("dealcompleteseller_list");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="./resources/css/main_style.css">
    <link rel="stylesheet" href="./resources/css/seller.css">
    <link href="https://fonts.googleapis.com/css2?
    family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <title>All-tion</title>
</head>
<body>
    <!-- 모든 페이지 공통 영역 by 하나  -->
    
    <div class="header">
        <jsp:include page="../header/main_header.jsp"></jsp:include>
    </div>

    <!-- !! 메인 페이지 내용(지워서 사용함) !! start -->

 	<div class="main_body">
    <div class="bidding_title">
            <h1>판매 경매</h1>
    </div>
        <div class="bidding_notify">
            <ul>
                <li>
                    회원님께서 현재 판매 중인 경매 리스트입니다.
                <li>
                <li>
                    문의 사항은 고객센터에 문의해주시기 바랍니다.
                </li>

            </ul>
        </div>
       </div>
    <div id="kakao-talk-channel-chat-button" style='display: none;'></div>

    <!--판매 중-->
    	<%if(getSale_list.size()==0) {%>
    	<div class="seller--form">
    	<h3>판매 중 경매가 없습니다.</h3>
    	</div>
    	<%}else{ %>
    	<%
        	for(int j = 0; j < getSale_list.size(); j++)
        	{
        		Product_kjVO Product_kjvo = (Product_kjVO)getSale_list.get(j);
        	
        %> 
       
        <div class="seller--form">
        <h3>판매 중 경매</h3>
            <div class="seller--content">
                <ul class="seller_form list">
                    <li>
                        <div class="seller_form__list title">
                            <span>상품 번호</span>
                        </div>
                        <div class="seller_form__list content">
                        <span><%=Product_kjvo.getTrading_product_number() %></span>
                        </div>    
                    </li>
                </ul>
                <ul class="seller_form list">
                    <li>
                        <div class="seller_form__list title">
                            <span>상품명</span>
                        </div>
                        <div class="seller_form__list content">
                        <span><%=Product_kjvo.getProduct_subject() %></span>
                        </div>    
                    </li>
                </ul>
                <ul class="seller_form list">
                    <li>
                        <div class="seller_form__list title">
                            <span>판매 가격</span>
                        </div>
                        <div class="seller_form__list content">
                        <span><%=Product_kjvo.getTrading_price() %></span>
                        </div>    
                    </li>
                </ul>
                <ul class="seller_form list">
                    <li>
                        <div class="seller_form__list title">
                            <span>운송장번호 입력기한</span>
                        </div>
                        <div class="seller_form__list content">
                        <span><%=Product_kjvo.getTrading_waybill_deadline() %></span>
                        </div>    
                    </li>
                </ul>
                <ul class="seller_form list">
                    <li>
                        <div class="seller_form__list title">
                            <span>거래 방식</span>
                        </div>
                        <div class="seller_form__list content">
                        <span><%=Product_kjvo.getTrading_transaction_method() %></span>
                        </div>    
                    </li>
                </ul>
                <ul class="seller_form list">
                    <li>
                        <div class="seller_form__list title">
                            <span>구매자 아이디</span>
                        </div>
                        <div class="seller_form__list content">
                        	<span><%=Product_kjvo.getTrading_buyer_id() %></span>
                        </div>    
                    </li>
                </ul>
                <ul class="seller_form list">
                    <li>
                        <div class="seller_form__list title">
                            <span>구매자 이름</span>
                        </div>
                        <div class="seller_form__list content">
                        	<span><%=Product_kjvo.getMember_name() %></span>
                        </div>    
                    </li>
                </ul>
                <ul class="seller_form list">
                    <li>
                        <div class="seller_form__list title">
                            <span>구매자 번호</span>
                        </div>
                        <div class="seller_form__list content">
                        	<span><%=Product_kjvo.getMember_phone() %></span>
                        </div>    
                    </li>
                </ul>
                <ul class="seller_form list">
                    <li>
                        <div class="seller_form__list title">
                            <span>주소</span>
                        </div>
                        <div class="seller_form__list content">
                        	<span><%=Product_kjvo.getSample4_postcode() %>
                        		<%=Product_kjvo.getSample4_roadAddress() %>
                        	    <%=Product_kjvo.getSample4_jibunAddress() %>
                        		<%=Product_kjvo.getSample4_detailAddress() %></span>
                        </div>    
                    </li>
                </ul>
               
        </div>
         <a href = "./waybill.kj"  class = "base_btn" >운송장 번호 입력하기</a>	
    </div>
    <%
        	}}
    %>
    
    <!--판매 완료 -->
    <%if(dealcompleteseller_list.size()==0) {%>
    	<div class="seller--form">
    	<h3>판매 완료된 경매가 없습니다.</h3>
    	</div>
    	<%}else{ %>
    	<%
        	for(int i = 0; i < dealcompleteseller_list.size(); i++)
        	{
        		Product_kjVO dealcompletvo = (Product_kjVO)dealcompleteseller_list.get(i);
        	
        %> 
        <div class="seller--form">
            <h3>판매 완료</h3>
            <div class="seller--content">
                <ul class="seller_form list">
                    <li>
                        <div class="seller_form__list title">
                            <span>상품 번호</span>
                        </div>
                        <div class="seller_form__list content">
                            <span><%=dealcompletvo.getProduct_number() %></span>
                        </div>    
                    </li>
                </ul>
                <ul class="seller_form list">
                    <li>
                        <div class="seller_form__list title">
                            <span>상품명</span>
                        </div>
                        <div class="seller_form__list content">
                            <span><%=dealcompletvo.getProduct_subject() %></span>
                        </div>    
                    </li>
                </ul>
                <ul class="seller_form list">
                    <li>
                        <div class="seller_form__list title">
                            <span>판매 가격</span>
                        </div>
                        <div class="seller_form__list content">
                            <span><%=dealcompletvo.getTrading_price() %></span>
                        </div>    
                    </li>
                </ul>
                <ul class="seller_form list">
                    <li>
                        <div class="seller_form__list title">
                            <span>판매 날짜</span>
                        </div>
                        <div class="seller_form__list content">
                            <span><%=dealcompletvo.getTrading_purchase_date() %></span>
                        </div>    
                    </li>
                </ul>
                <ul class="seller_form list">
                    <li>
                        <div class="seller_form__list title">
                            <span>구매자</span>
                        </div>
                        <div class="seller_form__list content">
                            <span><%=dealcompletvo.getTrading_buyer_id() %></span>
                        </div>    
                    </li>
                </ul> 
        </div>
    </div>
    <%
        	}}
    %>
    
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
    
    <script>
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