<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.spring.alltion.pay.*" %>
<%
	String buyer = (String)request.getAttribute("buyer_name");
	String amount = (String)request.getAttribute("amount");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css" />">
<link rel="stylesheet" href="<c:url value="/resources/css/pay.css" />">
<link
	href="<c:url value="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap"/>"
	rel="stylesheet">
<link href="<c:url value="https://fonts.googleapis.com/icon?family=Material+Icons"/>"
	rel="stylesheet">
<title>All-tion</title>
<style>
</style>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	function test1(value) {
		$('.text2').val(value);
	}
</script>
<script>
function getFormatDate(date){
    var year = date.getFullYear();              //yyyy
    var month = (1 + date.getMonth());          //M
    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
    var day = date.getDate();                   //d
    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
    return  year + '' + month + '' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
}
var date = new Date();
date = getFormatDate(date);

</script>
</head>

<body>
	<!-- 모든 페이지 공통 영역 by 하나  -->
	<!-- 광고 배너 및 헤더 -->
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
                    <li>
                        <a href="mypage.kj">
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

	<!------------------------------------------------------------------------------------------------>
	<div class="Main">
		<div class="h3_subBox">
			<h3>사이버머니 충전/환불</h3>
		</div>
		<div class="chargePageBox">
			<div class="charge_intro">
				<h4>[사이버머니?]</h4>
				<p>
					"All-tion에서 이루어지는 모든 현금 결제는 적립되어 있는 " <span class="bold">사이버머니</span>
					"에서 차감됩니다." <br> " 회원님께서 일정금액을 미리 사이버머니로 적립해 놓으셔야 응찰권 및 경매물품의
					낙찰금액에 대하여 현금 결제가 가능해 집니다." <br> " 사이버머니가 충분하게 적립되어 있는 상태에서 즉시
					경매낙찰을 이용하실 경우, 판매자와의 직거래여부 선택에 따라 빠른 진행이 가능하십니다." <br>
				</p>
			</div>
			<div class="XenoTab">
				<ul class="ul menuBar XenoTabMenu" id="chargeMenu">
					<li>
						<button class="Tab_menu1 XenoTabMenuItem on" for="charge">사이버머니 충전</button></li>
					<li>
						<button class="Tab_menu2 XenoTabMenuItem" for="back">환불요청</button></li>
				</ul>

				<div id="charge_1" class="Tab_box1 XenoTabLayer on">
					<form id="chargeform" method="post" action="./charge.ms" >
						<!-- <input type="hidden" name="merchant_uid"> -->
						<!-- <input type="hidden" name="id" value="id넣어야한다......"> -->
						<table class="tb1_money">
							<colgroup>
								<col width="15%">
								<col width="35%">
								<col width="15%">
								<col width="35%">
							</colgroup>
							<tbody>
								<tr>
									<th>아이디</th>
									<td><input class="text1" type="text" name="buyer_name"
										title="입금인" size="20"></td>
									<th>현재 사이버 머니</th>
									<td>￦ 0000</td>
								</tr>
								<tr>
									<th>충전할 금액(원)</th>
									<td colspan="3">
										<div class="won moneyAdd">
											<input class="text2" type="text" name="amount" title="입금금액"
												value size="20"> 원&nbsp;&nbsp; <a href="#"
												rel="10000" onclick="test1(10000)"> <img
												src="data:image/gif;base64,R0lGODlhHQATANUAAPn5+aCgoGpqasnJyfv7+5+fn2tra56envT09DQ0NKGhoePj4/Hx8WlpaTU1NV1dXWhoaMrKyuTk5K6urtPT062trYSEhE9PT1xcXDMzM/Ly8ltbW8jIyMbGxvz8/Pj4+P39/fX19fr6+vf39/b29v7+/sfHx////wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH/C1hNUCBEYXRhWE1QPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS4zLWMwMTEgNjYuMTQ1NjYxLCAyMDEyLzAyLzA2LTE0OjU2OjI3ICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1wTU06T3JpZ2luYWxEb2N1bWVudElEPSJ4bXAuZGlkOjFCNTRGNzgyNkJBNUUxMTE5OEE5RTBGNzkzNUY1QThGIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjBDODAwRkEwNTY0NjExRTJBNzU2QUVCMEQyQ0JCOEVGIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjBDODAwRjlGNTY0NjExRTJBNzU2QUVCMEQyQ0JCOEVGIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDUzQgV2luZG93cyI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkE3MDkzNTUwM0E1NkUyMTFBMzVEQkU3NTg3NjZGMTBGIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjFCNTRGNzgyNkJBNUUxMTE5OEE5RTBGNzkzNUY1QThGIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+Af/+/fz7+vn49/b19PPy8fDv7u3s6+rp6Ofm5eTj4uHg397d3Nva2djX1tXU09LR0M/OzczLysnIx8bFxMPCwcC/vr28u7q5uLe2tbSzsrGwr66trKuqqainpqWko6KhoJ+enZybmpmYl5aVlJOSkZCPjo2Mi4qJiIeGhYSDgoGAf359fHt6eXh3dnV0c3JxcG9ubWxramloZ2ZlZGNiYWBfXl1cW1pZWFdWVVRTUlFQT05NTEtKSUhHRkVEQ0JBQD8+PTw7Ojk4NzY1NDMyMTAvLi0sKyopKCcmJSQjIiEgHx4dHBsaGRgXFhUUExIREA8ODQwLCgkIBwYFBAMCAQAAIfkEAAAAAAAsAAAAAB0AEwAABv/Ak2nYGRqPxiKHY2SaOsKTdHoqVanYq3VanG6z3iu2ZGWCtWFx+tSBbt9U+HdsllrJUkZhcFoMBhESJwJgXWsMGA4BJwEXAg+LCWBDaycDFgIKjIsDixkFWZRgGicGmgEKIAOgCYtYlHdpAosVDQYCEyWSoSZkviUgdrNkHAvBJw6/vkMgzc7NHiACByAeBSbR0dXPIEMEHuDhIiAi09EHGwYQAg0U3x7vTCLz9AAiBAQABPT8/fRDAAB8GEjwQ8CBAgseJBjQBIcPJD6MmEixosWKEklMfEIiRAiNJEKKHEky5McRIYuEQDACgceXMGPCRNDxIxQmHTjkRMKz584DE0EAADs="
												alt="1만">
											</a> <a href="#" rel="20000" onclick="test1(20000)"> <img
												src="data:image/gif;base64,R0lGODlhHQATANUAAMbGxvn5+cjIyDQ0NMnJyTU1NWpqavv7+/Hx8YWFha6urmlpadbW1mtra+Tk5KGhoTMzM11dXVBQUPDw8EFBQZ+fn6CgoOPj409PT8XFxfT09NXV1ZOTk0JCQq2trVxcXE5OTvPz81tbW56enkNDQ/z8/P39/fj4+PX19ff39/r6+vb29v7+/sfHx////wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH/C1hNUCBEYXRhWE1QPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS4zLWMwMTEgNjYuMTQ1NjYxLCAyMDEyLzAyLzA2LTE0OjU2OjI3ICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1wTU06T3JpZ2luYWxEb2N1bWVudElEPSJ4bXAuZGlkOjFCNTRGNzgyNkJBNUUxMTE5OEE5RTBGNzkzNUY1QThGIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjBDQjE2MjQzNTY0NjExRTJBNzU2QUVCMEQyQ0JCOEVGIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjBDQjE2MjQyNTY0NjExRTJBNzU2QUVCMEQyQ0JCOEVGIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDUzQgV2luZG93cyI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkE3MDkzNTUwM0E1NkUyMTFBMzVEQkU3NTg3NjZGMTBGIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjFCNTRGNzgyNkJBNUUxMTE5OEE5RTBGNzkzNUY1QThGIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+Af/+/fz7+vn49/b19PPy8fDv7u3s6+rp6Ofm5eTj4uHg397d3Nva2djX1tXU09LR0M/OzczLysnIx8bFxMPCwcC/vr28u7q5uLe2tbSzsrGwr66trKuqqainpqWko6KhoJ+enZybmpmYl5aVlJOSkZCPjo2Mi4qJiIeGhYSDgoGAf359fHt6eXh3dnV0c3JxcG9ubWxramloZ2ZlZGNiYWBfXl1cW1pZWFdWVVRTUlFQT05NTEtKSUhHRkVEQ0JBQD8+PTw7Ojk4NzY1NDMyMTAvLi0sKyopKCcmJSQjIiEgHx4dHBsaGRgXFhUUExIREA8ODQwLCgkIBwYFBAMCAQAAIfkEAAAAAAAsAAAAAB0AEwAABv9AV6ZFFBCPxmMLAGgllS1X1EU1Ua+sqzaLvRKp3K2LFR5rz8urFczmls/Z5nn+zr7H3/vkYUG4LgSBDC4Gg3ZZX2IsESAREiwPHQYSBiwFBGUsTnMuCAuDlxUNLhYGLgMJDmhTnC4KFAgPHwQJDSyoqlqJdRskCq4GDQscpwJzRIdkZA4UCcoCHmYDAsrKRCbY2SYTIhhECCYjCywl2SUs2kQHJesl7gAFAwMQLQcV8wMFBS0lKu7uRFQIHDgwwAGCBAMgFEgkgMMTECOqOBGAYkSIFS9CJJKi44kUJ1Z0HEmyZMkVS1asQLEyhcqXMGPKTEFEAwqWK0KsvMmzp88QmztbaCLSREATKEiVHI0SBAA7"
												alt="2만">
											</a> <a href="#" rel="30000" onclick="test1(30000)"> <img
												src="data:image/gif;base64,R0lGODlhHQATANUAAPv7+/j4+P39/aCgoGpqasnJyeTk5GlpacbGxvHx8U9PT66url1dXaGhofDw8NbW1kJCQoWFhTU1NZ+fn2tra62trdfX1zMzM5GRkZOTk8rKyl5eXp6enuLi4k5OTlBQUNXV1Xl5ecjIyDQ0NPz8/Pn5+fr6+vX19fb29vf39/7+/sfHx////wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH/C1hNUCBEYXRhWE1QPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS4zLWMwMTEgNjYuMTQ1NjYxLCAyMDEyLzAyLzA2LTE0OjU2OjI3ICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1wTU06T3JpZ2luYWxEb2N1bWVudElEPSJ4bXAuZGlkOjFCNTRGNzgyNkJBNUUxMTE5OEE5RTBGNzkzNUY1QThGIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjBDQjE2MjRCNTY0NjExRTJBNzU2QUVCMEQyQ0JCOEVGIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjBDQjE2MjRBNTY0NjExRTJBNzU2QUVCMEQyQ0JCOEVGIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDUzQgV2luZG93cyI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkE3MDkzNTUwM0E1NkUyMTFBMzVEQkU3NTg3NjZGMTBGIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjFCNTRGNzgyNkJBNUUxMTE5OEE5RTBGNzkzNUY1QThGIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+Af/+/fz7+vn49/b19PPy8fDv7u3s6+rp6Ofm5eTj4uHg397d3Nva2djX1tXU09LR0M/OzczLysnIx8bFxMPCwcC/vr28u7q5uLe2tbSzsrGwr66trKuqqainpqWko6KhoJ+enZybmpmYl5aVlJOSkZCPjo2Mi4qJiIeGhYSDgoGAf359fHt6eXh3dnV0c3JxcG9ubWxramloZ2ZlZGNiYWBfXl1cW1pZWFdWVVRTUlFQT05NTEtKSUhHRkVEQ0JBQD8+PTw7Ojk4NzY1NDMyMTAvLi0sKyopKCcmJSQjIiEgHx4dHBsaGRgXFhUUExIREA8ODQwLCgkIBwYFBAMCAQAAIfkEAAAAAAAsAAAAAB0AEwAABv9A1kq0KhpFCBHRWEQYnUYha0plqajX6jRbVRW7YK01PB1ixVrVNcstr85jNDzuTk8dg4aD9RBpCgYWBHRWRWtjKgkKCh4MLAQfBBADIiNbVV9iBg0JICMJBwMsoQUjom2ZbVMGIQwqFBEFDAOlonSGdnwKGywZBwQEC6WXVF9qLAJWBiIsCSMrKgsiapVrx14rJAIq2gIkCCMLFSMdJAQT2+kk3ALtRSQAJPLaABgXEhwAAAcj/f3x8+QVMUGQYAkABhESVKjvYImCD4uUmJgiQIkAGE1ctJhi4sUSFTdaLJKipMmTKFOmHIKipcuXMGPGLHKips2bOHPmZMakp88Fn0ymBQEAOw=="
												alt="3만">
											</a> <a href="#" rel="50000" onclick="test1(50000)"> <img
												src="data:image/gif;base64,R0lGODlhHQATANUAAGpqavv7+/z8/MjIyDQ0NMnJycbGxqCgoDU1NZ+fn09PT2tra+Tk5NbW1q6urqGhoYWFhWlpaa2trXd3d5OTk4SEhK+vr+Xl5UFBQV1dXUBAQJKSkkNDQ05OTrq6uvj4+Pn5+f39/fr6+vb29vX19ff39/7+/sfHx////wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH/C1hNUCBEYXRhWE1QPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS4zLWMwMTEgNjYuMTQ1NjYxLCAyMDEyLzAyLzA2LTE0OjU2OjI3ICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1wTU06T3JpZ2luYWxEb2N1bWVudElEPSJ4bXAuZGlkOjFCNTRGNzgyNkJBNUUxMTE5OEE5RTBGNzkzNUY1QThGIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjBDRjA0NDRENTY0NjExRTJBNzU2QUVCMEQyQ0JCOEVGIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjBDRjA0NDRDNTY0NjExRTJBNzU2QUVCMEQyQ0JCOEVGIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDUzQgV2luZG93cyI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkE3MDkzNTUwM0E1NkUyMTFBMzVEQkU3NTg3NjZGMTBGIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjFCNTRGNzgyNkJBNUUxMTE5OEE5RTBGNzkzNUY1QThGIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+Af/+/fz7+vn49/b19PPy8fDv7u3s6+rp6Ofm5eTj4uHg397d3Nva2djX1tXU09LR0M/OzczLysnIx8bFxMPCwcC/vr28u7q5uLe2tbSzsrGwr66trKuqqainpqWko6KhoJ+enZybmpmYl5aVlJOSkZCPjo2Mi4qJiIeGhYSDgoGAf359fHt6eXh3dnV0c3JxcG9ubWxramloZ2ZlZGNiYWBfXl1cW1pZWFdWVVRTUlFQT05NTEtKSUhHRkVEQ0JBQD8+PTw7Ojk4NzY1NDMyMTAvLi0sKyopKCcmJSQjIiEgHx4dHBsaGRgXFhUUExIREA8ODQwLCgkIBwYFBAMCAQAAIfkEAAAAAAAsAAAAAB0AEwAABv9A1GlILBYNp8EgSTQsT0IUyiStUqtWqhYrhFqnYOn1miUjv1w0lnwdisNjsGkrtya/V8fhkGAwCoANJgANa0IGaVIACgCEDxoLjCgEBWluiQAPVwcAKJwmCBUXXJdwKJEIEygJGQUQnQQQDKRehhsUHhwSDgsRABQmlJZQcyFbIVMAB0IWWgQDYnMmQyEhAijW1QoTAxgSJgkR1cYCAuPVQwHm6uUiJx2hAQEJBAgIBAQnISIh8gJDIgIKFBEARMGBCEWAUBgg4BAQED98KCERYkQRFSVmBPEB4pASIEOKHEmS5AkDI1KqXMmy5UoSI5KQmEmzps2bNw1MM8Kzp08DFEEAADs="
												alt="5만">
											</a> <a href="#" rel="100000" onclick="test1(100000)"> <img
												src="data:image/gif;base64,R0lGODlhHQATANUAAGpqavz8/KCgoDU1NZ+fn66uruTk5F1dXfHx8dbW1jMzM4WFhZ2dncrKykJCQlBQUOPj40FBQWlpaaGhoWtra9fX162trVFRUbu7u5OTk+Li4rq6uvDw8E9PT8jIyPv7+/j4+Pn5+cbGxsnJyf39/TQ0NPr6+vb29vX19ff39/7+/sfHx////wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH/C1hNUCBEYXRhWE1QPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS4zLWMwMTEgNjYuMTQ1NjYxLCAyMDEyLzAyLzA2LTE0OjU2OjI3ICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1wTU06T3JpZ2luYWxEb2N1bWVudElEPSJ4bXAuZGlkOjFCNTRGNzgyNkJBNUUxMTE5OEE5RTBGNzkzNUY1QThGIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjBEMTM0OEQ0NTY0NjExRTJBNzU2QUVCMEQyQ0JCOEVGIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjBEMTM0OEQzNTY0NjExRTJBNzU2QUVCMEQyQ0JCOEVGIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDUzQgV2luZG93cyI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkE3MDkzNTUwM0E1NkUyMTFBMzVEQkU3NTg3NjZGMTBGIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjFCNTRGNzgyNkJBNUUxMTE5OEE5RTBGNzkzNUY1QThGIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+Af/+/fz7+vn49/b19PPy8fDv7u3s6+rp6Ofm5eTj4uHg397d3Nva2djX1tXU09LR0M/OzczLysnIx8bFxMPCwcC/vr28u7q5uLe2tbSzsrGwr66trKuqqainpqWko6KhoJ+enZybmpmYl5aVlJOSkZCPjo2Mi4qJiIeGhYSDgoGAf359fHt6eXh3dnV0c3JxcG9ubWxramloZ2ZlZGNiYWBfXl1cW1pZWFdWVVRTUlFQT05NTEtKSUhHRkVEQ0JBQD8+PTw7Ojk4NzY1NDMyMTAvLi0sKyopKCcmJSQjIiEgHx4dHBsaGRgXFhUUExIREA8ODQwLCgkIBwYFBAMCAQAAIfkEAAAAAAAsAAAAAB0AEwAABv9A1mooGnpExeJwdfQQl0oha0pVqajVK1ZLXYmwLO3VGgZzy8IVGF2ditHc4Xi9XXO1w/IVMjFcEQICUwkNHiMGFQBsTlgJDiUjUw8HDwssFB0ADgIeJW5TRVgCBSUeLCMlHBgKLACCEgKognhqbggskCydKqitCyMHBCMDBJ95bQMjKg2eqCoZANEFw59pVlckKrm7zioWyiq7YVZDJObZJCUrJBoDGwwX2QAE6NkBKuZDAR/7/CUiJD4wGBBBxD4AJUooSMiv3xATED9AnDgxhAmJHyxe3DhxSIiPKUKAGPlRJAgTIUGIXDmy5ZAUMGPKnEmT5pATKE7o3Mmzp08VnkhQCB1KtKhRo6aWKF3KtCkTFkEAADs="
												alt="10만">
											</a>
										</div>
									</td>
								</tr>
								<tr>
									<th>결제수단</th>
									<td colspan="3"><label> <input type="radio"
											class="radio" title="결제방법" checked="checked">카카오페이
									</label></td>
								</tr>
							</tbody>
						</table>
						<div class="submit">
							<input type="image"
								src="data:image/gif;base64,R0lGODlheQAlAMQAAPTW1+ioqdxxdNlhZOKPkPnr69M5PtZOUvfh4e7Awd+AgvHLzPz19eWcnuu0tbscIf///9AfJQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH/C1hNUCBEYXRhWE1QPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS41LWMwMTQgNzkuMTUxNDgxLCAyMDEzLzAzLzEzLTEyOjA5OjE1ICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjgwNURBODcxNzM3RDExRTNCODNBQzdEODUzQzZEN0ZFIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjgwNURBODcyNzM3RDExRTNCODNBQzdEODUzQzZEN0ZFIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6ODA1REE4NkY3MzdEMTFFM0I4M0FDN0Q4NTNDNkQ3RkUiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6ODA1REE4NzA3MzdEMTFFM0I4M0FDN0Q4NTNDNkQ3RkUiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4B//79/Pv6+fj39vX08/Lx8O/u7ezr6uno5+bl5OPi4eDf3t3c29rZ2NfW1dTT0tHQz87NzMvKycjHxsXEw8LBwL++vby7urm4t7a1tLOysbCvrq2sq6qpqKempaSjoqGgn56dnJuamZiXlpWUk5KRkI+OjYyLiomIh4aFhIOCgYB/fn18e3p5eHd2dXRzcnFwb25tbGtqaWhnZmVkY2JhYF9eXVxbWllYV1ZVVFNSUVBPTk1MS0pJSEdGRURDQkFAPz49PDs6OTg3NjU0MzIxMC8uLSwrKikoJyYlJCMiISAfHh0cGxoZGBcWFRQTEhEQDw4NDAsKCQgHBgUEAwIBAAAh+QQAAAAAACwAAAAAeQAlAEAF/+AjjmRpnmiqrmzrvmIkz3Rt33iu73zv+7GfUDZgQCAAQWSwODIGMsURQogIBAlIYImYAgxWpA0AUcjIyuEvqBYGClNnAEwE2O93R04g1qHbQA+Ag4SFhjlsh4qLjDqJjTYBWjZxUzKSW5eTMnwAZwGgoWcQaZARj6ZLCmQFBFA0BwFVNJgHEE9LRwadnHAIdKOlkKipxcaBMMnKy8zNKsfQ0TvE0tXH1NbZw4LGBKBNRwigs5qZoGQBZJVavDXtf6nYh+v0cAxmA11VmHwFM3AD+DAAMMsAHDPBisk71GTBgRkGsiyY0Q4HAQAFACBsJwBhDXimFmobWUgkyZNqTNaiXNlDJcuXOFzCnDlDJs2ZNm++zKlzJU9AFxv8EBCg1EVyschZDPAwHrdi6uh5imAHTsapmBqcQwLqSh96CZ1Cw3IkC4QEHmU0mRon0xIBr8JMpdHgbNiQT1MNINB0xgECaepCaGBkTgRMEbosCNAEQZgjbvvNALnNWKitBS4HGOAA2JJyFdFUNNAlAQ3KjX7+OBA1DoK4FWUcEPDQQaUqvAaU9UyVlMK8pmwjAHyFQGmK9I7MtRH7BmpGqofsusK7p5Do1rNhz15tO/do3r9fAy5e54MQADs="
								value="충전하기" >
						</div>
					</form>
				</div>
				<div id="charge_2" class="Tab_box2 XenoTabLayer">
					<form id="drawbackform" method="post" action="./drawback.ms">
						<table class="tbl_money" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<colgroup>
								<col width="15%">
								<col width="35%">
								<col width="15%">
								<col width="35%">
							</colgroup>
							<tbody>
								<tr>
									<th>결제 주문번호</th>
									<td><input class="text3" type="text" name="merchant_uid"
										title="결제 주문번호"></td>

									<th>현재 사이버머니</th>
									<td>￦ 0000</td>
								</tr>
								<tr>
									
								</tr>
							</tbody>
						</table>
						<div class="submit">
							<input type="image"
								src="data:image/gif;base64,R0lGODlheQAlAMQAAPTW19xxdNZOUvz19eKPkO7AwdM5Pvnr69lhZPfh4eWcnvHLzOu0td+AguioqbscIf///9AfJQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH/C1hNUCBEYXRhWE1QPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS41LWMwMTQgNzkuMTUxNDgxLCAyMDEzLzAzLzEzLTEyOjA5OjE1ICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjgzMUVDRTk0NzM3RDExRTM4QTAzQkU5RkMyNEFDQzRGIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjgzMUVDRTk1NzM3RDExRTM4QTAzQkU5RkMyNEFDQzRGIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6ODMxRUNFOTI3MzdEMTFFMzhBMDNCRTlGQzI0QUNDNEYiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6ODMxRUNFOTM3MzdEMTFFMzhBMDNCRTlGQzI0QUNDNEYiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4B//79/Pv6+fj39vX08/Lx8O/u7ezr6uno5+bl5OPi4eDf3t3c29rZ2NfW1dTT0tHQz87NzMvKycjHxsXEw8LBwL++vby7urm4t7a1tLOysbCvrq2sq6qpqKempaSjoqGgn56dnJuamZiXlpWUk5KRkI+OjYyLiomIh4aFhIOCgYB/fn18e3p5eHd2dXRzcnFwb25tbGtqaWhnZmVkY2JhYF9eXVxbWllYV1ZVVFNSUVBPTk1MS0pJSEdGRURDQkFAPz49PDs6OTg3NjU0MzIxMC8uLSwrKikoJyYlJCMiISAfHh0cGxoZGBcWFRQTEhEQDw4NDAsKCQgHBgUEAwIBAAAh+QQAAAAAACwAAAAAeQAlAEAF/+AjjmRpnmiqrmzrvmIkz3Rt33iu73zv+7GfcDaAOCKCA4QQgDgdgoB0OkXIHJBFrQApzBBOiCKCfQ6FwbOQAWi73dZyeA4YOpTzRED9S/P/gIGCNn6DhoeIOYWJBjJNdREGj1cQAA6Xl1yQkQ5FTgMFjTRYRzOkiTSLiABhA24FBJUyBG9uRaURk5S4jgueEAcFAqipD8THyIEwy8zNzs8sydLTQMbU19jF2dvXqoeSAZhMCLpYBVQBCrIR6gmiMgsQDLlzYXunx97fDgkQAwt7JmG6xMrSwGEGuMwRJqPfgAaRuIzBR0zfIVZ7cGBxVQsAgQj1QjrZw+ojDVa8EupZ5MZS0MqWMNW8jEmzWs2bgGbi3FlDJ8+fPn/uDCr0JlE+AhyYRKLUkYOMX5rWiDLsRjioERo8RXZUSJOQAMqJdALJgEMGDhgoccfUQcFLwyii6iqEwK8u9PQkHbsOZQ1dMjQ59ZvPGjJWCy4VkQJMDl8IAQwUOYDJYVW7EBr0WxDHCFfDxAhkAragjTpItNooOeBmjIykBMhJ2RoBAcMZVRl4LjxNARQausINvKQEF2C5sUBhYjWgakXQx1gl6AigM+XhTal3tKL7gIIpuiF/LhoIHNbx5NP3hK6ePN322d7D78Z+Ps8HIQAAOw=="
								value="환불요청하기" >
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>




	<!------------------------------------------------------------------------------------------------>


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
                    <p>올션은 통신판매중개자이며 통신 판매의 당사자가 아닙니다. 따라서 올션은 상품·거래정보 및 거래에 대하여 책임을 지지 않습니다.</p> 
                    <p>Copyright © eBay Korea LLC All rights reserved.</p>
                </li>
            </ul>
        </div>
	</div>

	<!--  스크립트 영역  -->
	<script src="<c:url value="https://code.jquery.com/jquery-3.5.1.min.js"/>"></script>
	<script src="<c:url value="/resources/js/pay.js" />"></script>
	<script src="<c:url value="/resources/js/common.js" />"></script>
	<script type="text/javascript">
		$(function() {
			// 광고 없애기
			$(".ad__banner--closeBtn").click(function() {
				$(".ad__banner").hide();
			})

			// 헤더 고정
			var header = $('.lower_header');
			$(window).scroll(function() {
				if ($(this).scrollTop() > 0) {
					header.addClass('sticky');
				} else {
					header.removeClass('sticky');
				}
			})

			// 카테고리 누를 때마다 이동
			$("ul.deadline-items__category a").click(function() {
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
