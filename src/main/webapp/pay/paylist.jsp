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
<link rel="stylesheet" href="./resources/css/main_style.css">
<link rel="stylesheet" href="./resources/css/paylist.css">
    <link href="https://fonts.googleapis.com/css2?
    family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>Alltion 충전내역 조회</title>
</head>
<body>
    <!-- 모든 페이지 공통 영역 by 하나  -->
    
    <div class="header">
        <jsp:include page="../header/main_header.jsp"></jsp:include>
    </div>

    <!-- !! 메인 페이지 내용(지워서 사용함) !! start -->
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
            }).done(function(data){
            	click = true;
            }).fail(function(data){
            	click = false;
            })
         } else {
            console.log("중복됨");
         }
    }
	</script>
</body>
</html>