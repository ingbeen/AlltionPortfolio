<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "com.spring.alltion.login.MemberVO" %>
<%
	MemberVO membervo = (MemberVO)request.getAttribute("membervo");

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./resources/css/style.css">
    <link rel="stylesheet" href="./resources/css/update.css">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <title>Alltion 회원 정보 수정</title>
    
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
<script>
function modal_display() {
  
        var member_update_modal = document.getElementById('member_update_modal');
        var close0 = document.getElementsByClassName('close')[0];
        member_update_modal.style.display = "block";
        close0.onclick = function(event) {
        	member_update_modal.style.display = "none";
        }


    // ↓↓모달창 외부 클릭시 모달창 닫아짐.
    window.onclick = function(event) {
        if (event.target == member_update_modal) {
        	member_update_modal.style.display = "none";
        }
        if (event.target == bid_notify_modal) {
            bid_notify_modal.style.display = "none";
        }
    }
}
</script>  
 
<script>
function checkpassword() {
	
	var pwd1 = $("#member_password").val();
    var pwd2 = $("#member_password2").val();
    
    if ( pwd1 != '' && pwd2 == '' ) {
        null;
    } else if (pwd1 != "" || pwd2 != "") {
        if (pwd1 == pwd2) {
            $("#alert-success1").css('display', 'inline-block');
            $("#alert-danger1").css('display', 'none');
        } else {
            
            $("#alert-success1").css('display', 'none');
            $("#alert-danger1").css('display', 'inline-block');
            document.getElementsClassName("base_btn").disabled = true;
        }
    }
}
</script>


</head>

<body>
    <!-- 모든 페이지 공통 영역 by 하나  -->
    <!-- top 키 -->
    <div id="topKey" class="topKey_btn" >
        <p class="material-icons">
            keyboard_arrow_up
    </div>
    <!-- 헤더 -->
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
                </ul>
            </div>
        </div>
        <div class="lower_header">
            <div class="lower_header--nav">
                <h1 class="logo">
                    <a href="#">ALL-TION</a>
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
    <!-- 회원 정보 수정 -->
        <div class="member_update--form">
            <h3>회원 정보 수정</h3>
            <div class="member_update--content">
                <ul class="update_form list">
                    <li>
                        <div class="update_form__list title">
                            <span>아이디</span>
                        </div>
                        <div class="update_form__list content">
                            <span><%=membervo.getMember_id() %></span>
                        </div>
                    </li>
                    <li>
                        <div class="update_form__list title">
                            <span>이름</span>
                        </div>
                        <div class="update_form__list content">
                            <span><%=membervo.getMember_name() %></span>
                        </div>
                    </li>
                    <form name = "updatePassword" action="./updatePassword.kj" method="post">
                    <ul>
                    <li>
                        <div class="update_form__list title">
                            <span>비밀번호 변경</span>
                        </div>
                        <div class="update_form__list content">
                            <input type="password" id="member_password" name = "member_password" class= "int"><br>
                            <input type="password" id="member_password2"  name = "member_password2" class = "int" onchange="checkpassword()">
                            <span id="alert-success1" style="display: none; color: #1ec700;">비밀번호가 일치합니다.</span>
    						<span id="alert-danger1" style="display: none; color: #d92742; font-weight: bold; ">비밀번호가 일치하지 않습니다.</span>
                            <button type = "submit" class="update_btn pw" >변경하기</button>
                        </div>
                    </li>  
                    </ul>
                    </form>                  
                    <form name="updateEmail" action="./updateEmail.kj" method="post">
                    <ul>
                    <li>
                        <div class="update_form__list title">
                            <span>이메일</span>
                        </div>
                        <div class="update_form__list content">
                            <span><%=membervo.getEmail() %></span>&nbsp;&nbsp;&nbsp;
                            	<input type ="button" onclick = "modal_display()"  value = "이메일 변경">                         
                            		<div id="member_update_modal" class="modal_email">
                               		 <div class="modal-content">
                                   		 <span class="close">&times;</span>
                                    		<fieldset id="member_update">
                                       		 <legend>이메일 변경</legend>
                                        		<ul>
                                            		<li>
                                                	 <label>이메일&nbsp;&nbsp;:&nbsp;</label>
                                                  <input type="text"  id="email"  name ="email" style="ime-mode:inactive; width:356px;" placeholder="변경할 이메일을 입력하세요." >     
				                                  <a href="javascript:updateEmail.submit()">이메일 변경</a>&nbsp;&nbsp;
                                            </li>   
                                        </ul>
                                   </fieldset>
                                </div>
                            </div>	
            				</div> 
            			</li>
            			</ul>
            			</form>	
            			<form name = "updatePhone" action = "./updatePhone.kj" method = "post">
                    	<ul>
                    	<li>                   	
                        <div class="update_form__list title">
                            <span>휴대 전화 번호</span>
                        </div>
                        <div class="update_form__list content">
                           <span><%=membervo.getMember_phone() %></span>&nbsp;&nbsp;&nbsp;                
                           <span>'-' 없이 입력해 주세요"</span>&nbsp;&nbsp;&nbsp;
                           <input type ="button" onclick = "modal_display()" value = "휴대전화 변경"> 
                           <div id="member_update_modal" class="modal_phone">
                           	<div class="modal-content1">
                                   		 <span class="close">&times;</span>
                                    		<fieldset id="member_update">
                                       		 <legend>휴대전화 변경</legend>
                                        		<ul>
                                            		<li>
                                                	 <label>휴대전화&nbsp;&nbsp;:&nbsp;</label>
                                                  <input type="text"  id="member_phone"  name ="member_phone"  placeholder="휴대전화를 입력하세요." >     
				                                  <a href="javascript:updatePhone.submit()">휴대전화 변경</a>&nbsp;&nbsp;
                                            </li>   
                                        </ul>
                                   </fieldset>
                                </div>
                        </div>                        
                    </li>
                    </ul>
                    </form>
                    <li>
                        <div class="update_form__list title">
                            <p class = "join_title" text-align = "left">주소</span>
                        </div>
                        <div class="update_form__list content">
                            <span><%=membervo.getSample4_postcode() %></span><br>
                            <span><%=membervo.getSample4_roadAddress() %>&nbsp;
								  <%=membervo.getSample4_jibunAddress() %>&nbsp;                            
	                              <%=membervo.getSample4_detailAddress() %>&nbsp;&nbsp;
                            </span>
                            
                            <button class="update_btn">변경하기</button>
                            <!--  
                            <div>
                                <input type="text" id="sample4_postcode" class = "int" name="sample4_postcode" placeholder="우편번호">
                                <input type="button" class = "base_btn address" onclick="sample4_execDaumPostcode()" value="검색"><br>
                                <input type="text" class="int" id="sample4_roadAddress" name = "sample4_roadAddress" placeholder="도로명 주소">
                                <input type="text" class="int" id="sample4_jibunAddress" name = "sample4_jibunAddress" placeholder="지번 주소"><br>
                                <span id="guide" style="color:#999;display:none;"></span><br>
                                <input type="text" class="int" id="sample4_detailAddress" name = "sample4_detailAddress" placeholder="상세 주소를 입력해 주세요">
                            </div>
                            -->
                        </div>
                    </li>
                </ul>
            </div>
            <div class="member_update--btn">
               	 <button class="update_btn__submit" onclick="history.back()">뒤로 가기</button>
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
        </div>        
    </div>
    
    <!--  스크립트 영역  -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
    <script src="./resources/js/update.js"></script>
</body>
</html>