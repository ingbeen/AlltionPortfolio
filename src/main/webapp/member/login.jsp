<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="./resources/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
    <title>All-tion</title>
    

   <style >
.login {
    margin: 160px auto;
    width: 490px;
    border: 1px solid #FEE7C5;
    border-radius: 4px;
    }
       
    .login-screen {
        width: 356px;
        margin: 0 auto;
    }
       
    .app-title {text-align: center;}
       
    .app-title h2 {
        margin-top: 24px;
        margin-bottom: 70px;
        font-size: 28px;
    }
        
    .login-form {
    text-align: center;
    }
       
    .control-group {
        margin: 0 auto;
        margin-bottom: 42px;
        text-align: left;
    }

    .control-group input {
        margin-top: 14px;
        border-bottom: 1px solid rgba(0, 0, 0, 0.25);
        font-size: 16px;
        width: 100%;
        padding: 4px;
        transition: border .2s;
    }

    input:focus {
    border: 2px solid  #F9A825;
    box-shadow: none;
    }
       
    .btn {
        background: #F8C436;
        color: #ffffff;
        font-size: 16px;
        line-height: 25px;
        padding: 12px 0;
        text-decoration: none;
        text-shadow: none;
        border-radius: 3px;
        box-shadow: none;
        transition: 0.25s;
        display: block;
        width: 100%;
        margin-top: 76px;
        margin-bottom: 16px;
        height: auto;
    }

    .btn:hover {
      background-color:  #F9A825;
    }
    
    .login-form p {
       font-size: 14px; 
       margin-bottom:  18px;
    }
       
    .login-link {color: #A77731}
    
    .login-link:hover {font-weight: bold;}
    </style>
<script>
function enterkey() {
        if (window.event.keyCode == 13) {
 
             // 엔터키가 눌렸을 때 실행할 내용
             login();
        }
}
</script>
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
                        <a href="#">로그인</a>
                    </li>
                    <li>
                        <a href="./naverjoin.kj">회원 가입</a>
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
                        <a href="#">
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

<form name = "login" action = "./login.kj" method = "post">    
    <!-- 로그인 영역 by 계정 -->
	<div class="login">
        <div class="login-screen">
            <div class="app-title">
                <h2>로그인</h2>
            </div>

            <div class="login-form">
                <div class="control-group id">
                    <label class="login-field-icon fui-user" for="login-name">아이디</label><br>
                    <input type="text" name = "member_id" class="login-field" id="member_id"  placeholder="아이디를 입력해 주세요" >
                </div>

                <div class="control-group pw">
                    <label class="login-field-icon fui-lock" for="login-pass">비밀번호</label><br>
                    <input type="password" name = "member_password" class="login-field" id="member_password"  placeholder="비밀번호를 입력해 주세요" >
                </div>

                <a class="btn btn-primary btn-large btn-block" onclick = "check_input()" onkeyup="enterkey();">로그인</a>
                <p>아직 회원이 아니신가요?&nbsp;
                    <a class="login-link" href = "./naverjoin.kj">회원가입 바로 가기</a>
                </p>
                
                
            </div>
        </div>
    </div>
	
 <script>
function check_input()
{
	var str, i, ch;
	// 아이디 체크 ---->
	if (document.login.member_id.value == "")
	{
		alert("아이디를 입력하세요!!!");
		document.login.member_id.focus();
		return;
	}
	else
	{
		str = document.login.member_id.value;
		
		for (i=0; i<str.length; i++)
		{
			ch = str.substring(i, i+1);
			if (!((ch >= "0" && ch <= "9") || (ch >= "a" && ch <= "z") 
					|| (ch >= "A" && ch <= "Z")))
			{
				alert("특수문자가 포함, 다시 입력!!!");
				document.login.member_id.focus();
				return;
			}
		}
	} // 아이디 체크 <------
	
	// 패스워드 체크 ------>
	if (document.login.member_password.value == "")
	{
		alert("패스워드를 입력하세요!!!");
		document.login.member_password.focus();
		return;
	}
	else
	{
		str = document.login.member_password.value;
		
		for (i=0; i<str.length; i++)
		{
			ch = str.substring(i, i+1);
			if (!((ch >= "0" && ch <= "9") || (ch >= "a" && ch <= "z") 
					|| (ch >= "A" && ch <= "Z")))
			{
				alert("특수문자가 포함, 다시 입력!!!");
				document.login.member_password.focus();
				return;
			}
		}
	} // 패스워드 체크 <------
	
	login.submit();
}
</script>   
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
