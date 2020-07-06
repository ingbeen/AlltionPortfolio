<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="java.util.*" %>

<!doctype html>
<!-- 
create table pay(
    merchant_uid VARCHAR2(60),
 	name VARCHAR2(60),
 	amount VARCHAR2(100),
 	status VARCHAR2(20),
    buyer_email VARCHAR2(60),
    buyer_name VARCHAR2(60),
    buyer_tel VARCHAR2(60)
);
create table paymember(
    id VARCHAR2(20),
    pw VARCHAR2(20),
    email VARCHAR2(20),
    tel VARCHAR2(20),
    signdate date,
    ad number(2)
);

create table payobject(
    merchant_uid VARCHAR2(60),
    selid VARCHAR2(20),
    objname VARCHAR2(20),
    aucinsbuymoney number(30) 
);
 -->
<html>
<head>
<meta charset="utf-8" />

<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
    function pay() {
        var IMP = window.IMP;
        var code = "imp42790723"; // 가맹점 식별코드
        IMP.init(code);

        // 결제요청
        IMP.request_pay({
            // name과 amount만 있어도 결제 진행가능
            pg : 'kakao', // pg 사 선택(kakao, kakaopay 둘다 가능)
            pay_method : 'card',
            //merchant_uid : 'merchant_' + new Date().getTime(),
            merchant_uid : 'merchant_48', // 주문번호.. 취소할때 이 값이 필요
            name : 'e머니', // 상품명
            amount : 10000,
            //buyer_email : 'minseok2709@naver.com',
            buyer_name : 'lee',
            //buyer_tel : '010-9094-2709'
            // 결제 완료후 이동할 페이지. kakao나 kakaopay는 생략함
            //m_redirect_url : 'https://localhost:8080/payments/complete' / 
        }, function(rsp) {
            if ( rsp.success ) { // 결제 성공시 
                var msg = '결제가 완료되었습니다.';
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
                
                var payVO = { 
                //dfkek : rsp.imp_uid,
                merchant_uid : rsp.merchant_uid, //주문번호...상품번호로 대체
                //name : rsp.name,  //결제상품명
                amount : rsp.paid_amount,   //금액
                status : rsp.status, // 결제상태
     	   		//buyer_email : rsp.buyer_email,
     	  		buyer_name: rsp.buyer_name,   //아이디
     	 	    //buyer_tel : rsp.buyer_tel
                }
                
                //post로 payVO객체의 내용을 전달해야한다............
                $.ajax({
                	url : '/pay/getSuccessData.ms',
                	type : 'POST',
                	data : payVO,
                	contentType : 'application/x-www-form-urlencoded; charset=utf-8',
                	dataType : "json",
            	});
            }
            else { // 결제 실패시
                var msg = '결제에 실패하였습니다. 에러내용 : ' + rsp.error_msg
            }
            alert(msg);
        });
    }
    
    function cancelPay() {
        jQuery.ajax({
          	url: "/pay/cancel.ms",
          	type: "post",
          	//datatype: "json",
          	contentType : 'application/x-www-form-urlencoded; charset=utf-8',
          	data: {
	            "merchant_uid": "merchant_48" // 주문번호
	            //"cancel_request_amount": 2000, // 환불금액
	            //"reason": "테스트 결제 환불", // 환불사유
	            //"refund_holder": "홍길동", // [가상계좌 환불시 필수입력] 환불 가상계좌 예금주
	            //"refund_bank": "88", // [가상계좌 환불시 필수입력] 환불 가상계좌 은행코드(ex. KG이니시스의 경우 신한은행은 88번)
	            //"refund_account": "56211105948400" // [가상계좌 환불시 필수입력] 환불 가상계좌 번호
          	}
	    }).done(function(result) { // 환불 성공시 로직 
	    	$.ajax({
            	url : '/pay/cancelData.do',
            	type : 'POST',
            	data : {"merchant_uid" : "merchant_48"},
            	contentType : 'application/x-www-form-urlencoded; charset=utf-8'
        	});
	          	alert("환불 성공 : " + result);
	    }).fail(function(error) { // 환불 실패시 로직
	            alert("환불 실패 : " + error);
	    });
    }
    
    </script>

</head>
<body>
	<a href="#" onclick="pay()">일반결제</a>
	<br>
	<br>
	<a href="#" onclick="cancelPay()">결제취소</a>
</body>
</html>