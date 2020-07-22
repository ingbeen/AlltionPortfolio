<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.spring.alltion.pay.*"%>
<%@ page import="java.util.*"%>
<%
	List<PayVO> chargevo = (List<PayVO>) request.getAttribute("chargevo");
	List<PayVO> cancelvo = (List<PayVO>) request.getAttribute("cancelvo");
	List<PaymentVO> paymentvo = (List<PaymentVO>) request.getAttribute("paymentvo");
	
	int listcount1=((Integer)request.getAttribute("listcount1")).intValue();
	int nowpage1=((Integer)request.getAttribute("page1")).intValue();
	int maxpage1=((Integer)request.getAttribute("maxpage1")).intValue();
	int startpage1=((Integer)request.getAttribute("startpage1")).intValue();
	int endpage1=((Integer)request.getAttribute("endpage1")).intValue();
	
	int listcount2=((Integer)request.getAttribute("listcount2")).intValue();
	int nowpage2=((Integer)request.getAttribute("page2")).intValue();
	int maxpage2=((Integer)request.getAttribute("maxpage2")).intValue();
	int startpage2=((Integer)request.getAttribute("startpage2")).intValue();
	int endpage2=((Integer)request.getAttribute("endpage2")).intValue();
	
	int listcount3=((Integer)request.getAttribute("listcount3")).intValue();
	int nowpage3=((Integer)request.getAttribute("page3")).intValue();
	int maxpage3=((Integer)request.getAttribute("maxpage3")).intValue();
	int startpage3=((Integer)request.getAttribute("startpage3")).intValue();
	int endpage3=((Integer)request.getAttribute("endpage3")).intValue();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/style.css">
<link rel="stylesheet" href="./resources/css/paylist.css">
<link rel="stylesheet" href="resources/css/kakaoTalk.css">
<link rel="shortcut icon" type="image⁄x-icon" href="./resources/img/header/logo.jpg">
<link rel="stylesheet" href="./resources/css/style.css?after">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<title>Alltion 충전내역 조회</title>
</head>
<body>
	<!-- 모든 페이지 공통 영역 by 하나  -->
	<!-- top 키 -->
	<div id="topKey" class="topKey_btn">
		<p class="material-icons">keyboard_arrow_up</p>
	</div>
	<!-- 헤더 -->
	<div class="header">
		<div class="upper_header">
			<div class="upper_header--nav">
				<span> <a href="" id="clock"></a>
				</span>
				<ul>
					<li><a href="./mypage.kj">${userId}</a></li>
					<li><a href="./logout.kj">로그아웃</a></li>
					<li><a href="./registration.yb">판매하기</a></li>
				</ul>
			</div>
		</div>
		<div class="lower_header">
			<div class="lower_header--nav">
				<h1 class="logo">
					<a href="/alltion/">ALL-TION</a>
				</h1>
				<div class="category">
					<a class="category--drop"> <img
						src="./resources/img/header/category_tab.png">
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
					</select> <input type="text" placeholder="찾으시는 상품을 입력해 주세요"
						class="search__input">
				</div>
				<ul class="member_info">
					<li><a href="./mypage.kj"> <span class="material-icons">perm_identity</span><br>
							<span>마이 페이지</span>
					</a></li>
					<li><a href="#"> <span class="material-icons">turned_in_not</span><br>
							<span>찜 목록</span>
					</a></li>
					<li><a href="#"> <span class="material-icons">access_time</span><br>
							<span>참여 경매</span>
					</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div id="kakao-talk-channel-chat-button" style='display: none;'></div>
	<!-- 충전내역 조회 -->
	<div class="pay">
		<div class="chargehistory">
			<h3>충전 내역</h3>
			<div class="pay_list">
				<ul class="firstcharge">
					<li>
						<div class="charge__list title">
							<span>No</span>
						</div>
					</li>
					<li>
						<div class="charge__list title">
							<span>결제주문번호</span>
						</div>
					</li>
					<li>
						<div class="charge__list title">
							<span>결제 금액</span>
						</div>
					</li>
					<li>
						<div class="charge__list title">
							<span>이전 금액	</span>
						</div>
					</li>
					<li>
						<div class="charge__list title">
							<span>변동 후 금액</span>
						</div>
					</li>
					<li>
						<div class="charge__list title">
							<span>결제 상태</span>
						</div>
					</li>
				</ul>
				<%	
					if (!chargevo.isEmpty()) {
					for (int i = 0; i < chargevo.size(); i++) {
						PayVO vo = (PayVO) chargevo.get(i);
				%>
				<ul class="charge">
					<li>
						<div class="charge__list content">
							<span><%=vo.getRnum() %></span>
						</div>
					</li>
					<li>
						<div class="charge__list content">
							<span><%=vo.getPay_merchant_uid()%></span>
						</div>
					</li>
					<li>
						<div class="charge__list content">
							<span><%=vo.getPay_amount()%></span>
						</div>
					</li>
					<li>
						<div class="charge__list content">
							<span><%=vo.getPay_lastmoney()%></span>
						</div>
					</li>
					<li>
						<div class="charge__list content">
							<span><%=vo.getPay_nowmoney()%></span>
						</div>
					</li>
					<li>
						<div class="charge__list content">
							<span>결제</span>
						</div>
					</li>
				</ul>
				<%
					}
				}
				%>
			</div>
			<div class="chargepage">
				<ul class="page_number paging">
                    <li>
                    <%if(nowpage1<=1){ %>
                    &#60;
                    <%}else{ %>
                        <a href="./goPaylist.ms?page1=<%=nowpage1-1 %>">&#60;</a>
                    <%} %>
                    </li>
                    <%for(int a=startpage1;a<=endpage1;a++){
						if(a==nowpage1){%>
						<li>
						<a href="" class="active num"><%=a %></a>
						</li>
						<%}else{ %>
						<li>
						<a href="./goPaylist.ms?page1=<%=a %>"><%=a %></a>
						</li>
						<%} %>
					<%} %>
                    
                    <%if(nowpage1>=maxpage1){ %>
                    <li>
                    &#62;
                    </li>
                    <%}else{ %>
                    <li>
                        <a href="./goPaylist.ms?page1=<%=nowpage1+1 %>">&#62;</a>
                    </li>
                    <%} %>
                </ul>
			</div>
		</div>
		
		<!-- 환불 내역 조회 -->
		<div class="cancelhistory">
			<h3>환불 내역</h3>
			<div class="pay_list">
				<ul class="firstcancel">
					<li>
						<div class="cancel__list title">
							<span>No</span>
						</div>
					</li>
					<li>
						<div class="cancel__list title">
							<span>결제주문번호</span>
						</div>
					</li>
					<li>
						<div class="cancel__list title">
							<span>결제 금액</span>
						</div>
					</li>
					<li>
						<div class="charge__list title">
							<span>이전 금액	</span>
						</div>
					</li>
					<li>
						<div class="charge__list title">
							<span>변동 후 금액</span>
						</div>
					</li>
					<li>
						<div class="cancel__list title">
							<span>결제 상태</span>
						</div>
					</li>
				</ul>
				<%
					if (!cancelvo.isEmpty()) {
					for (int i = 0; i < cancelvo.size(); i++) {
						PayVO vo = (PayVO) cancelvo.get(i);
				%>
				<ul class="cancel">
					<li>
						<div class="cancel__list content">
							<span><%=vo.getRnum()%></span>
						</div>
					</li>
					<li>
						<div class="cancel__list content">
							<span><%=vo.getPay_merchant_uid()%></span>
						</div>
					</li>
					<li>
						<div class="cancel__list content">
							<span><%=vo.getPay_amount()%></span>
						</div>
					</li>
					<li>
						<div class="charge__list content">
							<span><%=vo.getPay_lastmoney()%></span>
						</div>
					</li>
					<li>
						<div class="charge__list content">
							<span><%=vo.getPay_nowmoney()%></span>
						</div>
					</li>
					<li>
						<div class="cancel__list content">
							<span><%=vo.getPay_status()%></span>
						</div>
					</li>
				</ul>
				<%
					}
				}
				%>
			</div>
			<div class="cancelpage">
				<ul class="page_number paging">
                    <li>
                    <%if(nowpage2<=1){ %>
                    &#60;
                    <%}else{ %>
                        <a href="./goPaylist.ms?page2=<%=nowpage2-1 %>">&#60;</a>
                    <%} %>
                    </li>
                    <%for(int a=startpage2;a<=endpage2;a++){
						if(a==nowpage2){%>
						<li>
						<a href="" class="active num"><%=a %></a>
						</li>
						<%}else{ %>
						<li>
						<a href="./goPaylist.ms?page2=<%=a %>" class="num"><%=a %></a>
						</li>
						<%} %>
					<%} %>
                    
                    <%if(nowpage2>=maxpage2){ %>
                    <li>
                    &#62;
                    </li>
                    <%}else{ %>
                    <li>
                        <a href="./goPaylist.ms?page2=<%=nowpage2+1 %>">&#62;</a>
                    </li>
                    <%} %>
                </ul>
            </div>
		</div>
	</div>
	
	<div class="payment">
		<div class="paymenthistory">
			<h3>거래 내역</h3>
			<div class="payment_list">
				<ul class="firstline">
					<li>
						<div class="cancel__list title">
							<span>No</span>
						</div>
					</li>
					<li>
						<div class="cancel__list title">
							<span>상품 제목</span>
						</div>
					</li>
					<li>
						<div class="cancel__list title">
							<span>결제 금액</span>
						</div>
					</li>
					<li>
						<div class="charge__list title">
							<span>이전 금액	</span>
						</div>
					</li>
					<li>
						<div class="charge__list title">
							<span>변동 후 금액</span>
						</div>
					</li>
					<li>
						<div class="cancel__list title">
							<span>결제 상태</span>
						</div>
					</li>
				</ul>
				<%
					if (!paymentvo.isEmpty()) {
					for (int i = 0; i < paymentvo.size(); i++) {
						PaymentVO vo = (PaymentVO) paymentvo.get(i);
				%>
				<ul class="paymentlist">
					<li>
						<div class="cancel__list content">
							<span><%=vo.getRnum()%></span>
						</div>
					</li>
					<li>
						<div class="cancel__list content">
							<span><%=vo.getPayment_product_subject()%></span>
						</div>
					</li>
					<li>
						<div class="cancel__list content">
							<span><%=vo.getPayment_amount()%></span>
						</div>
					</li>
					<li>
						<div class="charge__list content">
							<span><%=vo.getPayment_lastmoney()%></span>
						</div>
					</li>
					<li>
						<div class="charge__list content">
							<span><%=vo.getPayment_nowmoney()%></span>
						</div>
					</li>
					<li>
						<div class="cancel__list content">
							<span><%=vo.getPayment_status()%></span>
						</div>
					</li>
				</ul>
				<%
					}
				}
				%>
			</div>
			<div class="paymentpage">
				<ul class="page_number paging">
                    <li>
                    <%if(nowpage3<=1){ %>
                    &#60;
                    <%}else{ %>
                        <a href="./goPaylist.ms?page3=<%=nowpage3-1 %>">&#60;</a>
                    <%} %>
                    </li>
                    <%for(int a=startpage3;a<=endpage3;a++){
						if(a==nowpage3){%>
						<li>
						<a href="" class="active num"><%=a %></a>
						</li>
						<%}else{ %>
						<li>
						<a href="./goPaylist.ms?page3=<%=a %>" class="num"><%=a %></a>
						</li>
						<%} %>
					<%} %>
                    
                    <%if(nowpage3>=maxpage3){ %>
                    <li>
                    &#62;
                    </li>
                    <%}else{ %>
                    <li>
                        <a href="./goPaylist.ms?page3=<%=nowpage3+1 %>">&#62;</a>
                    </li>
                    <%} %>
                </ul>
            </div>
		</div>
	</div>
	<div class="test">
		<div>
			<span>현재 보유한 사이버머니 : ${currentMoney }</span>
		</div>
		<div>
		<form name="test1" action="plus.ms">
			<input type="hidden" name="userId" value="${userId}">
			<input type="hidden" name="product_subject" value="테스트상품1">
			<input type="hidden" name="amount" value=10000>
			<a href="" onclick="plusClick();">플러스</a>
		</form>
		<form name="test2" action="minus.ms">
			<input type="hidden" name="userId" value="${userId}">
			<input type="hidden" name="product_subject" value="테스트상품1">
			<input type="hidden" name="amount" value=10000>
			<a href="" onclick="minusClick();">마이너스</a>
		</form>
		</div>
	</div>
	
	
	<!-- 푸터 영역 -->
	<div class="footer">
		<div class="upper_footer">
			<ul class="upper_footer--list">
				<li><a href="#"> 올션소개 </a></li>
				<li><a href="#"> 채용정보 </a></li>
				<li><a href="#"> 공지사항 </a></li>
				<li><a href="#"> 이용약관 </a></li>
				<li><a href="#"> 개인정보처리방침 </a></li>
				<li><a href="#"> 전자금융거래약관 </a></li>
				<li><a href="#"> 제휴서비스 </a></li>
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
					<p>올션은 통신판매중개자이며 통신 판매의 당사자가 아닙니다. 따라서 올션은 상품·거래정보 및 거래에 대하여
						책임을 지지 않습니다.</p>
					<p>Copyright © eBay Korea LLC All rights reserved.</p>
				</li>
			</ul>
		</div>
	</div>

	<!--  스크립트 영역  -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="./resources/js/common.js"></script>
	<script>
	var formData = $("form[name=test1]").serialize() ;
	var click = true;
    function plusClick() {
         if (click) {
            console.log("클릭됨");
            click = !click;
            $.ajax({
            	url: "/alltion/plus.ms",
            	data: formData
            })
            // 타이밍 추가
            setTimeout(function () {
                click = true;
            }, 1000)
            
         } else {
            console.log("중복됨");
         }
    }
	</script>
	<script>
	var formData = $("form[name=test2]").serialize() ;
	var click = true;
    function minusClick() {
         if (click) {
            console.log("클릭됨");
            click = !click;
            $.ajax({
            	url: "/alltion/minus.ms",
            	data: formData
            })
            // 타이밍 추가
            setTimeout(function () {
                click = true;
            }, 1000)
            
         } else {
            console.log("중복됨");
         }
    }
	</script>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script src="resources/js/kakaoTalk.js"></script>
</body>
</html>