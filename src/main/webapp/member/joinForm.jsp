<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="./resources/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
    <title>All-tion</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    
    <!-- 주소 api -->
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
    <script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
             

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>

<!--주소 api 끝-->   

<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script>
		function usercheck(){
			var member_id = $('#member_id').val();

			$.ajax({
				url: 'user_check.kj',
				type: 'POST',
				data: {'member_id':member_id},
				dataType : 'json',
				contentType : 'application/x-www-form-urlencoded; charset=utf-8',
				success: function(res){
					if(res==1){
						 $("#alert-success").css('display', 'inline-block');
			             $("#alert-danger").css('display', 'none');
					}else{
						$("#alert-success").css('display', 'none');
		                $("#alert-danger").css('display', 'inline-block');
					}
					
				},
				error: function(){
					alert('ajax 통신 실패(usercheck)');
				}
			});
		}
		
		
	</script>

<style>
        .joinWrap {
            width: 490px;
            margin: 160px auto;
            border: 1px solid #FEE7C5;
            border-radius: 4px;
            box-shadow: 2px 2px 2px rgba(238, 238, 238, 0.8);
        }
        
        .joinWrap > h3 {
            width: 356px;
            margin: 0 auto 32px auto;
        }
        
        .joinWrap h2 {
            margin-top: 24px;
            margin-bottom: 50px;
            font-size: 24px;
            text-align: center;
        }
        
        .row_group {
            width: 356px;
            margin: 0 auto;
        }
        
        .join_title {
            font-size: 16px;
        }
        
        .join_title_title {
            font-size: 18px;
            font-weight: 700;
            margin-bottom: 20px;
        }
        
        .join_row {
            margin: 0 auto;
            margin-bottom: 36px;
            text-align: left;
        }
        .int {
            margin-top: 4px;
            border-bottom: 1px solid rgba(0, 0, 0, 0.25);
            font-size: 16px;
            width: 100%;
            padding: 4px;
            transition: border .2s;
        }
        
        .int:focus {
            border-bottom: 1px solid #F9A825;
        }
        
        .int::placeholder {
            font-size: 14px;
        }
        
        .error_next_box {
            display: block;
            margin: 9px 0 -2px;
            font-size: 12px;
            line-height: 14px;
            color: red;
        }
        .ps_box.int_id {
            padding-right: 110px;
        }
        .ps_box.int_id_address {
            padding-right: 25px;
        }
        .ps_box, .ps_box_disable {
            display: block;
            position: relative;
            width: 100%;
            height: 51px;
            border: solid 1px #F9A825;
            padding: 10px 14px 10px 14px;
            background: #fff;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            vertical-align: top;
            border-radius: 5px;
        }
        
        .join_row:first-child {position: relative;}

        
        .base_btn {
            position: absolute;
            bottom: 4px;
            right: 0;
            display: inline-block;
            padding: 0 10px;
            height: 28px;
            background: #F8C436;
            color: #fff;
            text-align: center;
            vertical-align: middle;
            border-radius: 2px;
            font-size: 14px;
        }
        
        .base_btn1 {
            position: absolute;
            bottom: 4px;
            right: 0;
            display: inline-block;
            padding: 0 10px;
            height: 28px;
            background: #F8C436;
            color: #fff;
            text-align: center;
            vertical-align: middle;
            border-radius: 2px;
            font-size: 14px;
        }
        
        .base_btn.submit, .base_btn.cancel {
            position: static;
            width: 49%;
            height: 40px;
            line-height: 40px;
        }
        
        .base_btn:hover {background-color: #F9A825;}
        
        #member_email {
            width: 40%;
        }
        
        #sample4_postcode {
            width: 33%;
        }
        
        .base_btn.address {
            right: 67%;
        }
        
    </style>	
</head>

<body>
<form name="joinform" action="./joinprocess.kj" method="post" onsubmit="return validate();">
<c:choose>

<c:when test="${email != null}"><!-- naver 연동시 email 값이 있을때 -->
    <!-- 모든 페이지 공통 영역 by 하나  -->
    
    <div class="header">
        <div class="upper_header">
             <div class="upper_header--nav">
                <p>
                    <a href="" id="clock"></a>
                </p>
                <ul>
                    <li>
                        <a href="./loginForm.kj">로그인</a>
                    </li>
                    <li>
                        <a href="./naverjoin.kj">회원 가입</a>
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
                        <option value="패션">패션</option>
                        <option value="뷰티">뷰티</option>
                        <option value="출산/유아동">출산/유아동</option>
                        <option value="전자기기">전자기기</option>
                        <option value="가전제품">가전제품</option>
                        <option value="가구/인테리어">가구/인테리어</option>
                        <option value="반려동물/취미">반려동물/취미</option>
                        <option value="도서/음반/문구">도서/음반/문구</option>
                        <option value="티켓/쿠폰">티켓/쿠폰</option>
                        <option value="스포츠">스포츠</option>
                        <option value="공구/산업용품">공구/산업용품</option>
                        <option value="기타잡화">기타잡화</option>
                    </select>
                    <input type="text" placeholder="찾으시는 상품을 입력해 주세요" class="search__input">
                </div>
                <ul class="member_info">
                    <li>
                        <a href="./loginForm.kj">
                            <span class="material-icons">perm_identity</span>
                            <span>마이 페이지</span>
                        </a>
                    </li>
                    <li>
                        <a href="./loginForm.kj">
                            <span class="material-icons">turned_in_not</span>
                            <span>찜 목록</span>
                        </a>
                    </li>
                    <li>
                        <a href="./loginForm.kj">
                            <span class="material-icons">access_time</span>
                            <span>참여 경매</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- 회원가입 폼 by 계정 -->
    <div class = "joinWrap">
        <h2>All-tion 통합 회원 가입</h2>
        <div class = "row_group">
            <div class = "join_row">
                <h3 class = "join_title_title" text-align = "left">
                    &lt;필수 입력 사항&gt;
                </h3>    
                <div class = "join_row">
                <label class = "join_title" text-align = "left">이름</label><br>
                <input type = "text" id = "member_name" name = "member_name" class = "int" maxlength = "5" placeholder="이름">
            	</div>            
                <label class = "join_title" text-align = "left">아이디</label>
                <span id="alert-danger" style="display: none; color: #1ec700; font-weight: bold; ">*&nbsp;사용가능 아이디</span>   			
    			<span id="alert-success" style="display: none; color: #d92742;">일치하는 아이디가 존재합니다.</span>
                <input type = "text" id = "member_id" name = "member_id"  class = "int" maxlength = "20" placeholder="최소6~최대20, 숫자와알파벳만 사용해 주세요">
                <input type = "button" class = "base_btn1" value = "중복 확인" onclick="usercheck()">
            </div>
            	
            <div class = "join_row">
                <label class = "join_title" text-align = "left">비밀번호</label>
                <input type = "password" id = "member_password" name = "member_password" class = "int" maxlength = "20" placeholder="최소6~최대20, 숫자와 알파벳만 사용해 주세요">
            </div>
            <div class = "join_row">
                <label class = "join_title" text-align = "left">비밀번호 재확인</label>
                <input type = "password" id = "member_password2" name = "member_password2" class = "int" maxlength = "20" placeholder="최소6~최대20, 숫자와 알파벳만 사용해 주세요"
                onchange="checkpassword()">
            	<span id="alert-success1" style="display: none; color: #1ec700;">비밀번호가 일치합니다.</span>
    			<span id="alert-danger1" style="display: none; color: #d92742; font-weight: bold; ">비밀번호가 일치하지 않습니다.</span>
            </div>

            <div class = "join_row">
                <label class = "join_title" text-align = "left">이메일</label>
                <div>
                <input type="hidden" class = "int" id="email"  name ="email" style="ime-mode:inactive; width:356px;" placeholder="이메일 아이디" value = "${email}">     
            	${email}
            	</div>
            </div>  
            <div class = "join_row">
                <label class = "join_title" text-align = "left">휴대 전화 번호</label>
                <input type = "text" id = "member_phone" name = "member_phone" class = "int" maxlength = "11" placeholder="'-' 없이 입력해 주세요">
            </div>
        </div>    
        <div class = "row_group">
            <div class = "join_row" style="margin-bottom: 0;">
                <h3 class = "join_title_title" text-align = "left">
                    &lt;추가 입력 사항&gt;
                </h3>
                <label class = "join_title" text-align = "left">주소</label><br>
                <input type="text" id="sample4_postcode" class = "int" name="sample4_postcode" placeholder="우편번호">
                <input type="button" class = "base_btn address" onclick="sample4_execDaumPostcode()" value="검색">
            </div>
        </div>
        <div class = "row_group">
            <div class = "join_row">
            <input type="text" class="int" id="sample4_roadAddress" name = "sample4_roadAddress" placeholder="도로명 주소">
            <input type="text" class="int" id="sample4_jibunAddress" name = "sample4_jibunAddress" placeholder="지번 주소">
            <span id="guide" style="color:#999;display:none;"></span>
            <input type="text" class="int" id="sample4_detailAddress" name = "sample4_detailAddress" placeholder="상세 주소를 입력해 주세요">
            </div>
        </div>
        <h3>
            <a href ="javascript:joinform.submit()" class = "base_btn submit" >회원가입</a> 
            <a href ="javascript:joinform.reset()" class = "base_btn cancel">다시작성</a>                         
        </h3> 
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
            
            // 2020-06-23 pm 03:55 추가
            // 실시간 시간 구하기
            setInterval(function(){

                let nowDate = new Date();
                let day = ['(일)', '(월)', '(화)', '(수)', '(목)', '(금)', '(토)'];
                let dayNum = nowDate.getDay();
                let year = nowDate.getFullYear();
                let month= nowDate.getMonth() + 1;
                let date = nowDate.getDate();
                let hour = nowDate.getHours();
                let min = nowDate.getMinutes();
                let sec = nowDate.getSeconds();

                /*
                // 오전 오후로 나누고 싶을 때
                let amPm = '오전';

                if(hour >= 12) {
                    amPm = '오후';
                    hour = hour - 12;
                }

                document.getElementById('clock').innerHTML = year + '년' + '&nbsp;' + month + '월' + '&nbsp;' + date + '일' + day[dayNum] + '&nbsp;' + amPm + '&nbsp;' + addZero(hour) + ":" + addZero(min) + ":" + addZero(sec);
                */

                document.getElementById('clock').innerHTML = year + '년' + '&nbsp;' + month + '월' + '&nbsp;' + date + '일' + day[dayNum] + '&nbsp;' + hour + ":" + addZero(min) + ":" + addZero(sec);
            },1000);

            // 일의 자리 숫자일 때 0 붙여 주기
            function addZero(i) {
                if (i < 10) {
                    i = '0' + i
                };
                return i;
            } // 2020-06-23 pm 03:55 추가
        });
    </script>

</c:when>

<c:otherwise><!-- 일반 회원가입 -->

    <div class="header">
        <div class="upper_header">
             <div class="upper_header--nav">
                <p>
                    <a href="" id="clock"></a>
                </p>
                <ul>
                    <li>
                        <a href="./loginForm.kj">로그인</a>
                    </li>
                    <li>
                        <a href="./naverjoin.kj">회원 가입</a>
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
                        <option value="패션">패션</option>
                        <option value="뷰티">뷰티</option>
                        <option value="출산/유아동">출산/유아동</option>
                        <option value="전자기기">전자기기</option>
                        <option value="가전제품">가전제품</option>
                        <option value="가구/인테리어">가구/인테리어</option>
                        <option value="반려동물/취미">반려동물/취미</option>
                        <option value="도서/음반/문구">도서/음반/문구</option>
                        <option value="티켓/쿠폰">티켓/쿠폰</option>
                        <option value="스포츠">스포츠</option>
                        <option value="공구/산업용품">공구/산업용품</option>
                        <option value="기타잡화">기타잡화</option>
                    </select>
                    <input type="text" placeholder="찾으시는 상품을 입력해 주세요" class="search__input">
                </div>
                <ul class="member_info">
                    <li>
                        <a href="./loginForm.kj">
                            <span class="material-icons">perm_identity</span>
                            <span>마이 페이지</span>
                        </a>
                    </li>
                    <li>
                        <a href="./loginForm.kj">
                            <span class="material-icons">turned_in_not</span>
                            <span>찜 목록</span>
                        </a>
                    </li>
                    <li>
                        <a href="./loginForm.kj">
                            <span class="material-icons">access_time</span>
                            <span>참여 경매</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    
    <!-- 회원가입 폼 by 계정 -->
    <div class = "joinWrap">
        <h2>All-tion 통합 회원 가입</h2>
        <div class = "row_group">
            <div class = "join_row">
                <h3 class = "join_title_title" text-align = "left">
                    &lt;필수 입력 사항&gt;
                </h3>
                <div class = "join_row">
                <label class = "join_title" text-align = "left">이름</label><br>
                <input type = "text" id = "member_name" name = "member_name" class = "int" maxlength = "5" placeholder="이름">
            	</div>
                <label class = "join_title" text-align = "left">아이디</label>
                <span id="alert-danger" style="display: none; color: #1ec700; font-weight: bold; ">&nbsp;*&nbsp;사용가능 아이디</span>   			
    			<span id="alert-success" style="display: none; color: #d92742;">&nbsp;*&nbsp;일치하는 아이디가 존재합니다.</span>
                <br>
                <input type = "text" id = "member_id" name = "member_id" class = "int" maxlength = "20" placeholder="최소6~최대20, 숫자와알파벳만 사용해 주세요">
                <input type = "button" class = "base_btn1" value = "중복 확인" onclick="usercheck()">
             </div>
             	
            <div class = "join_row">
                <label class = "join_title" text-align = "left">비밀번호</label>
                <input type = "password" id = "member_password" name = "member_password" class = "int" maxlength = "20" placeholder="최소6~최대20, 숫자와 알파벳만 사용해 주세요">
            	
            </div>
            <div class = "join_row">
                <label class = "join_title" text-align = "left">비밀번호 재확인</label>
                <input type = "password" id = "member_password2" name = "member_password2" class = "int" maxlength = "20" placeholder="최소6~최대20, 숫자와 알파벳만 사용해 주세요"
                onchange="checkpassword()">
            	<span id="alert-success1" style="display: none; color:#1ec700;">비밀번호가 일치합니다.</span>
   			    <span id="alert-danger1" style="display: none; color: #d92742; font-weight: bold; ">비밀번호가 일치하지 않습니다.</span>
            </div>
            
            <div class = "join_row">
                <label class = "join_title" text-align = "left">이메일</label>
                <div>
                    <input type="text" class = "int" id="email1" name="email1" size="35" style="ime-mode:inactive" placeholder="이메일 아이디">
                    <span>&nbsp;@&nbsp;</span>
                    <select name="email2" id = "email2">
                        <option value="">메일선택</option>
                        <option value="naver.com">naver.com</option>
                        <option value="daum.net">daum.net</option>
                        <option value="gmail.com">gmail.com</option>
                    </select>
                </div>
            </div>  
            <div class = "join_row">
                <label class = "join_title" text-align = "left">휴대 전화 번호</label>
                <input type = "text" id = "member_phone" name = "member_phone" class = "int" maxlength = "11" placeholder="'-' 없이 입력해 주세요">
            </div>
        </div>    
        <div class = "row_group">
            <div class = "join_row" style="margin-bottom: 0;">
                <h3 class = "join_title_title" text-align = "left">
                    &lt;추가 입력 사항&gt;
                </h3>
                <label class = "join_title" text-align = "left">주소</label><br>
                <input type="text" id="sample4_postcode" class = "int" name="sample4_postcode" placeholder="우편번호">
                <input type="button" class = "base_btn address" onclick="sample4_execDaumPostcode()" value="검색">
            </div>
        </div>
        <div class = "row_group">
            <div class = "join_row">
            <input type="text" class="int" id="sample4_roadAddress" name = "sample4_roadAddress" placeholder="도로명 주소">
            <input type="text" class="int" id="sample4_jibunAddress" name = "sample4_jibunAddress" placeholder="지번 주소">
            <span id="guide" style="color:#999;display:none;"></span>
            <input type="text" class="int" id="sample4_detailAddress" name = "sample4_detailAddress" placeholder="상세 주소를 입력해 주세요">
            </div>
        </div>
        <h3>
            <a href ="javascript:joinform.submit()" class = "base_btn submit" >회원가입</a> 
            <a href ="javascript:joinform.reset()" class = "base_btn cancel">다시작성</a>                         
        </h3> 
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
            
            // 2020-06-23 pm 03:55 추가
            // 실시간 시간 구하기
            setInterval(function(){

                let nowDate = new Date();
                let day = ['(일)', '(월)', '(화)', '(수)', '(목)', '(금)', '(토)'];
                let dayNum = nowDate.getDay();
                let year = nowDate.getFullYear();
                let month= nowDate.getMonth() + 1;
                let date = nowDate.getDate();
                let hour = nowDate.getHours();
                let min = nowDate.getMinutes();
                let sec = nowDate.getSeconds();

                /*
                // 오전 오후로 나누고 싶을 때
                let amPm = '오전';

                if(hour >= 12) {
                    amPm = '오후';
                    hour = hour - 12;
                }

                document.getElementById('clock').innerHTML = year + '년' + '&nbsp;' + month + '월' + '&nbsp;' + date + '일' + day[dayNum] + '&nbsp;' + amPm + '&nbsp;' + addZero(hour) + ":" + addZero(min) + ":" + addZero(sec);
                */

                document.getElementById('clock').innerHTML = year + '년' + '&nbsp;' + month + '월' + '&nbsp;' + date + '일' + day[dayNum] + '&nbsp;' + hour + ":" + addZero(min) + ":" + addZero(sec);
            },1000);

            // 일의 자리 숫자일 때 0 붙여 주기
            function addZero(i) {
                if (i < 10) {
                    i = '0' + i
                };
                return i;
            } // 2020-06-23 pm 03:55 추가
        });
    </script>
      
</c:otherwise>
</c:choose>
</form>

<!-- 비밀번호 재확인  -->   
<script>
function checkpassword() {
	
	var pwd1 = $("#member_password").val();
    var pwd2 = $("#member_password2").val();
    
	if (pwd1 == pwd2) {
	    $("#alert-success1").css('display', 'inline-block');
	    $("#alert-danger1").css('display', 'none');
	} else {
	    
	    $("#alert-success1").css('display', 'none');
	    $("#alert-danger1").css('display', 'inline-block');
	    $("#member_password").val('');
	    $("#member_password2").val('');
	    $("#member_password").focus();
	}

}
</script>


</body>
</html>