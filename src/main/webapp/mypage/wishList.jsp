<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/wishList.css">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <title>All-tion</title>
</head>

<body>
    <!-- 모든 페이지 공통 영역 by 하나  -->
    <!-- top 키 -->
    <div id="topKey" class="topKey_btn" >
        <span class="material-icons">
            keyboard_arrow_up
        </span>
    </div>
    <!-- 헤더 -->
    <div class="header">
        <div class="upper_header">
            <div class="upper_header--nav">
                <p>
                    <a href="" id="clock"></a>
                </p>
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
                    <a class="category--drop">
                        <img src="resources/img/header/category_tab.png">
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
    <!-- !! 기재해야 될 코드 여기에서부터 입력 start -->

    <!-- 찜목록 시작 -->

    <section class="wishList">

        <!-- 타이틀 -->
        <div class="wishList--title">
            <h1>찜목록</h1>
        </div>

        <!-- 내용 -->
        <div class="wishList--container">
            <ul class="wishList--noticeList">
                <li>
                    회원님께서 관심물품으로 직접 등록하신 물품의 리스트입니다.
                </li>
                <li>
                    물품정보가 변경되었을 수 있으니 입찰하시기전에 반드시 경매정보 및 물품정보를 재확인하시기 바랍니다.
                </li>
                <li>
                    마감된 자료는 최대 7일간 저장됩니다.
                </li>
            </ul>

            <div class="wishList--caption">
                <p><span class="wishList--conut">관심물품</span>에 대해서 모두 <span class="wishList--conut">2</span>개가 검색되었습니다</p>
                <button class="wishList--TimeOuptBtn" type="button">남은시간 표기</button>
            </div>

            <div class="wishList--tableWarp">
                <div class="wishList--columnTitle">
                    <div class="wishList--deletCheck">
                        <input type="checkbox">
                    </div>
                    <div class="wishList--info">
                        <p>상품정보</p>
                    </div>
                    <div class="wishList--currentPrice">
                        <p>현재가</p>
                    </div>
                    <div class="wishList--delivery">
                        <p>배송</p>
                    </div>
                    <div class="wishList--endDate">
                        <p>마감시간</p>
                    </div>
                </div>
    
                <div class="wishList--contentsWarp">
                    <div class="wishList--contents">
                        <div class="wishList--deletCheck">
                            <input type="checkbox">
                        </div>
                        <div class="wishList--info">
                            <div class="wishList--thumbnail">
                                <img src="resources/img/product/1.jpg">
                            </div>
                            <div class="wishList--description">
                                <p class="wishList--description__category">출산/유아동 > 유아동의류</p>
                                <a class="wishList--description__subject">기저귀 100개 저렴하게 판매합니다</a>
                                <p class="wishList--description__seller">ingbeen / 실버(신용도 클릭할때 뜨게할건지 정해야됨)</p>
                            </div>
                        </div>
                        <div class="wishList--currentPrice">
                            <p class="wishList--currentPrice__currentPrice">45,000</p>
                            <p class="wishList--currentPrice__purchase_price">즉시구매가 : 55,000</p>
                            <p class="wishList--currentPrice__bids">입찰 : 13</p>
                        </div>
                        <div class="wishList--delivery">
                            <p class="wishList--delivery__delivery">착불</p>
                            <p class="wishList--delivery__transactionArea">직거래가능지역 : 없음</p>
                        </div>
                        <div class="wishList--endDate">
                            <p>2020.07.09 13시 14분</p>
                        </div>
                    </div>
                    
                    <div class="wishList--contents">
                        <div class="wishList--deletCheck">
                            <input type="checkbox">
                        </div>
                        <div class="wishList--info">
                            <div class="wishList--thumbnail">
                                <img src="resources/img/product/1.jpg">
                            </div>
                            <div class="wishList--description">
                                <p>(카테고리)</p>
                                <p>(상품명)</p>
                                <p>(판매자)</p>
                                <p>(신용도)</p>
                            </div>
                        </div>
                        <div class="wishList--currentPrice">
                            <p>(현재가격)</p>
                            <p>입찰 : (입찰수)</p>
                            <p>즉시구매가 : (즉시구매가)</p>
                        </div>
                        <div class="wishList--delivery">
                            <p>(배송비여부)</p>
                            <p>직거래가능지역 : (직거래가능지역)</p>
                        </div>
                    </div>
                </div>
            </div>
            
            
        </div>
            

    </section>

    <!-- 찜목록 끝 -->

    <!-- !! 기재해야 될 코드 여기에서부터 입력 end -->
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
    <script src="resources/js/common.js"></script>
    <script src="resources/js/wishList.js"></script>
</body>

</html>