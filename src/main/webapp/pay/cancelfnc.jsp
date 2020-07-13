<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="java.util.*" %>
<% 
	String uid = (String)request.getParameter("merchant_uid");
	
	System.out.println("uid: " + uid);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
$(function() {
	//var IMP = window.IMP;
    //var code = "imp42790723"; // 가맹점 식별코드
    //IMP.init(code);
    
    jQuery.ajax({
      	url: "/alltion/cancel.bo",
      	type: "post",
      	//datatype: "json",
      	contentType : 'application/x-www-form-urlencoded; charset=utf-8',
      	data: {
            "merchant_uid": "<%=uid%>" // 주문번호
            //"cancel_request_amount": 2000, // 환불금액
            //"reason": "테스트 결제 환불", // 환불사유
            //"refund_holder": "홍길동", // [가상계좌 환불시 필수입력] 환불 가상계좌 예금주
            //"refund_bank": "88", // [가상계좌 환불시 필수입력] 환불 가상계좌 은행코드(ex. KG이니시스의 경우 신한은행은 88번)
            //"refund_account": "56211105948400" // [가상계좌 환불시 필수입력] 환불 가상계좌 번호
      	},
      	success: function(retVal){
      		console.log('성공');
      		alert('성공');
      	},
      	error: function(){
      		console.log('실패');
      		alert('실패');
      	}
    }).done(function(result) { // 환불 성공시 로직 
    	$.ajax({
        	url : '/alltion/cancelData.bo',
        	type : 'POST',
        	data : {"merchant_uid" : "<%=uid%>"},
        	contentType : 'application/x-www-form-urlencoded; charset=utf-8'
    	});
          	alert("환불 성공 : " + result);
          	location.href='./pay.ms';
    }).fail(function(error) { // 환불 실패시 로직
            alert("환불 실패 : " + error);
    });
});
</script>
</head>
<body>

</body>
</html>