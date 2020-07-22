<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.spring.alltion.test.Product_kjVO" %>
<%@ page import = "com.spring.alltion.login.MemberVO" %>
<%@ page import = "com.spring.alltion.test.Test_emoneyVO" %>
<%@ page import = "java.util.*" %>
<%
	Test_emoneyVO emoneyvo = (Test_emoneyVO)request.getAttribute("emoneyvo");
	MemberVO membervo = (MemberVO)request.getAttribute("membervo");
	Product_kjVO Product_kjvo = (Product_kjVO)request.getAttribute("Product_kjvo");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="./resources/css/style.css">
    <link rel="stylesheet" href="./resources/css/buyer_emoney.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="resources/css/kakaoTalk.css">
	<link rel="shortcut icon" type="image⁄x-icon" href="./resources/img/header/logo.jpg">
	<link rel="stylesheet" href="./resources/css/style.css?after">
    
    <title>All-tion</title>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
    <!-- 모든 페이지 공통 영역 by 하나  -->
  
    <div class="header">
        <div class="upper_header">
            <div class="upper_header--nav">
                <span>
                    <a href="" id="clock"></a>
                </span>
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
                            <span class="material-icons">perm_identity</span><br>
                            <span>마이 페이지</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
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
    <!-- 이머니 확인 페이지by.계정 -->
    <div class="eomney_update--form">
            <h3>이머니 입금</h3>
            <div class="eomney_update--content">
                <ul class="update_form list">
                    <li>
                        <div class="update_form__list title">
                            <span>이머니</span>
                        </div>
                        <div class="update_form__list content">
                            <span>현재 이머니 : <%=emoneyvo.getTest_emoney() %></span>
                            <br>
                            <br>           
                            <span>구매 가격 : <%=Product_kjvo.getTrading_price() %></span>
                            <br>     
                            <br>                     
                            <h5>이머니가 부족할 경우 밑에있는 이머니 충전버튼을 눌러주세요</h5>    
                            <h5>이머니의 최종 결재는 마지막 구매완료시 입금됩니다.</h5>                                        
                        </div>
                    </li>  
                    </ul>                   
                    </div>  
                     <div class="buyer_update--btn">
       					<a href = "./pay.ms"  class = 	"base_btn">이머니 충전</a>    
					</div>                
     			 </div>
      	<form name = "buyer_deal" action = "./buyer_deal.kj" method = "post">			
   	 	<input type = "hidden" name = "trading_buyer_id" id = "trading_buyer_id" value = "<%=Product_kjvo.getTrading_buyer_id() %>">
   	 	<div class="eomney_update--form">
            <h3>택배 거래</h3>
            <div class="eomney_update--content">
                <ul class="update_form list">
                    <li>
                        <div class="update_form__list title">
                            <span>택배 방법</span>
                        </div>
                        <div class="update_form__list content">                  
                            <span><%=Product_kjvo.getTrading_transaction_method() %></span>      
                        </div>               
                    </li>
                    <form name = "buyer_deal_update" action = "./buyer_deal_update.kj" method = "post">
                    <ul>
                    <li>
                        <div class="update_form__list title">
                            <span>주소</span>
                        </div>                      
                        <div class="update_form__list content">   
							<span><%=membervo.getSample4_postcode() %>
                        		<%=membervo.getSample4_roadAddress() %>
                        	    <%=membervo.getSample4_jibunAddress() %>
                        		<%=membervo.getSample4_detailAddress() %></span>
				            	<input type ="button" onclick = "modal_display_address_deal()" value = "주소 변경"> 
                            	<div id="update_address_deal" class="modal">
                            	<div class="modal-content">
                                <span class="close">&times;</span>
                                <fieldset id="member_update">
                                <legend>주소 변경</legend>
                                <br>
                                <li>
                                <label>우편 번호</label>
                                <input type="text" id="sample4_postcode" class = "input_border" name="sample4_postcode" placeholder="우편번호">                             
                                <label>도로명 주소</label>
                                <input type="text" class = "input_border" id="sample4_roadAddress" name = "sample4_roadAddress" placeholder="도로명 주소">                                
                                <label>지번 주소</label>
                                <input type="text" class = "input_border" id="sample4_jibunAddress" name = "sample4_jibunAddress" placeholder="지번 주소">                               
                                <label>상세 주소</label>
                                <input type="text" class = "input_border" id="sample4_detailAddress" name = "sample4_detailAddress" placeholder="상세 주소를 입력해 주세요">				                                
                                <input type="button" class = "base_btn address" onclick="sample4_execDaumPostcode()" value="검색">&nbsp;&nbsp;&nbsp;&nbsp;
                                <span id="guide" style="color:#999;display:none;"></span>
                                <a href="javascript:buyer_deal_update.submit()" class="update_btn__submit" >주소 변경</a>&nbsp;&nbsp;
                                </li>

                                   </fieldset>
                                </div>
                       		 </div>              
                        </div>                                   
                    </li>
                    </ul>
                    </form>
                    </ul>
                   
                    <div class="buyer_update--btn">
                    <a href = "javascript:buyer_deal.submit()" class = "base_btn">결제진행</a>
                    </div>
                    
                    </div>                                     
                    </div>
                    </form>
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
    <script src="./resources/js/buyer_emoney.js"></script>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script src="resources/js/kakaoTalk.js"></script>
</body>
</html>