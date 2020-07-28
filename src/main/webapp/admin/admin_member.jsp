<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <link rel="stylesheet" href="resources/css/admin_member.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <title>All-tion</title>
</head>
<body>
    <jsp:include page="admin_header.jsp" flush="false" />

    <section class="flex-column">

        <h1 class="title">회원 관리</h1>
        
        <div class="card memberListSearch--cardWarp">
            <p class="memberListSearch--title"><i class="fas fa-search"></i>검색 조건</p>
            <div class="flex-column memberListSearch--content">
                <form id="searchForm">
                    <div class="search-rowWarp">
                        <div class="search-row memberListSearch--id">
                            <div class="memberListSearch--subtitle">
                                <p>아이디</p>
                            </div>
                            <div class="memberListSearch--input">
                                <input name="searchId" type="text" maxlength="20">
                            </div>
                        </div>
                        <div class="search-row memberListSearch--name">
                            <div class="memberListSearch--subtitle">
                                <p>이름</p>
                            </div>
                            <div class="memberListSearch--input">
                                <input name="searchName" type="text" maxlength="5">
                            </div>
                        </div><div class="search-row memberListSearch--email">
                            <div class="memberListSearch--subtitle">
                                <p>이메일</p>
                            </div>
                            <div class="memberListSearch--input">
                                <input name="searchEmail" type="text" maxlength="30">
                            </div>
                        </div>
                    </div>

                    <div class="search-rowWarp">
                        <div class="search-row memberListSearch--phone">
                            <div class="memberListSearch--subtitle">
                                <p>연락처</p>
                            </div>
                            <div class="memberListSearch--input">
                                <input name="searchPhone" type="text" maxlength="13">
                            </div>
                        </div>
                        <div class="search-row memberListSearch--date">
                            <div class="memberListSearch--subtitle">
                                <p>가입 기간</p>
                            </div>
                            <div class="memberListSearch--input">
                                <input id="memberListSearch--startDate" name="startDate" type="text" readonly>
                                <span>~</span>
                                <input id="memberListSearch--endDate" name="endDate" type="text" readonly>
                            </div>
                        </div>
                    </div>

                    <div class="search-rowWarp">
                        <div class="search-row memberListSearch--status">
                            <div class="memberListSearch--subtitle">
                                <p>계정 상태</p>
                            </div>
                            <select name="searchStatus">
                                <option value="0" selected>정상</option>
                                <option value="1">탈퇴</option>
                                <option value="2">정상&탈퇴</option>
                                <option value="3">관리자</option>
                            </select>
                        </div>
                        <div class="search-row memberListSearch--sort">
                            <div class="memberListSearch--subtitle">
                                <p>정렬</p>
                            </div>
                            <select name="searchSort">
                                <option value="0" selected>가입일(내림차순)</option>
                                <option value="1">가입일(올림차순)</option>
                                <option value="2">아이디(내림차순)</option>
                                <option value="3">아이디(올림차순)</option>
                                <option value="4">이름(내림차순)</option>
                                <option value="5">이름(올림차순)</option>
                            </select>
                        </div>
                        <div class="search-row memberListSearch--btn">
                            <button class="memberListSearch--sendSearchBtn" type="button" 
                                onclick="sendSearch();">검색</button>
                            <button class="memberListSearch--sendResetBtn" type="button">초기화</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <div class="card memberList--cardWarp">
            <p class="memberList--title"><i class="fas fa-list-ul"></i>검색 결과</p>
            <div class="flex-column memberList--content">
                <table class="memberList--table">
                    <tr class="memberList--tableHeader">
                        <th style="width:15%">아이디</th>
                        <th style="width:15%">이름</th>
                        <th style="width:20%">이메일</th>
                        <th style="width:15%">연락처</th>
                        <th style="width:10%">계정상태</th>
                        <th style="width:15%">가입일</th>
                        <th style="width:10%">수정</th>
                    </tr>
                    <tr>
                        <td>ingbeen</td>
                        <td>이유빈</td>
                        <td>ingbeen@naver.com</td>
                        <td>01033333333</td>
                        <td>정상</td>
                        <td>2020-02-31</td>
                        <td class="flex-row memberList--update">
                            <button class="memberList--changeUpdateFormBtn" data-memberNumber="1" type="button">수정</button>
                        </td>
                    </tr>
                    <tr>
                        <td>dbzoqltm</td>
                        <td>이기자</td>
                        <td>dbzoqltm@naver.com</td>
                        <td>01077777777</td>
                        <td>정상</td>
                        <td>2020-03-29</td>
                        <td class="flex-row memberList--update">
                            <button class="memberList--changeUpdateFormBtn" data-memberNumber="2" type="button">수정</button>
                        </td>
                    </tr>
                    <tr>
                        <td>dbzoqltm</td>
                        <td>이기자</td>
                        <td>dbzoqltm@naver.com</td>
                        <td>01077777777</td>
                        <td>정상</td>
                        <td>2020-03-29</td>
                        <td class="flex-row memberList--update">
                            <button class="memberList--changeUpdateFormBtn" data-memberNumber="2" type="button">수정</button>
                        </td>
                    </tr>
                    <tr>
                        <td>dbzoqltm</td>
                        <td>이기자</td>
                        <td>dbzoqltm@naver.com</td>
                        <td>01077777777</td>
                        <td>정상</td>
                        <td>2020-03-29</td>
                        <td class="flex-row memberList--update">
                            <button class="memberList--changeUpdateFormBtn" data-memberNumber="1" type="button">수정</button>
                        </td>
                    </tr>
                    <tr>
                        <td>dbzoqltm</td>
                        <td>이기자</td>
                        <td>dbzoqltm@naver.com</td>
                        <td>01077777777</td>
                        <td>탈퇴</td>
                        <td>2020-03-29</td>
                        <td class="flex-row memberList--update">
                            <button class="memberList--changeUpdateFormBtn" data-memberNumber="1" type="button">수정</button>
                        </td>
                    </tr>
                    <tr>
                        <td>dbzoqltm</td>
                        <td>이기자</td>
                        <td>dbzoqltm@naver.com</td>
                        <td>01077777777</td>
                        <td>정상</td>
                        <td>2020-03-29</td>
                        <td class="flex-row memberList--update">
                            <button class="memberList--changeUpdateFormBtn" data-memberNumber="1" type="button">수정</button>
                        </td>
                    </tr>
                    <tr>
                        <td>admin</td>
                        <td>이기자</td>
                        <td>dbzoqltm@naver.com</td>
                        <td>01077777777</td>
                        <td>관리자</td>
                        <td>2020-03-29</td>
                        <td class="flex-row memberList--update">
                            <button class="memberList--changeUpdateFormBtn" data-memberNumber="1" type="button">수정</button>
                        </td>
                    </tr>
                    <tr>
                        <td>dbzoqltm</td>
                        <td>이기자</td>
                        <td>dbzoqltm@naver.com</td>
                        <td>01077777777</td>
                        <td>정상</td>
                        <td>2020-03-29</td>
                        <td class="flex-row memberList--update">
                            <button class="memberList--changeUpdateFormBtn" data-memberNumber="1" type="button">수정</button>
                        </td>
                    </tr>
                    <tr>
                        <td>dbzoqltm</td>
                        <td>이기자</td>
                        <td>dbzoqltm@naver.com</td>
                        <td>01077777777</td>
                        <td>정상</td>
                        <td>2020-03-29</td>
                        <td class="flex-row memberList--update">
                            <button class="memberList--changeUpdateFormBtn" data-memberNumber="1" type="button">수정</button>
                        </td>
                    </tr>
                </table></form>
                <div class="flex-row memberList--pagingWarp">
                    <p><span class="memberList--count">0</span>개의 회원정보가 검색되었습니다</p>
                    <ul class="memberList--paging">
                        <li class="memberList--nonActive" data-page="${pagination.prev}">
                            <span class="material-icons">keyboard_arrow_left</span>
                        </li>
                        <li id="memberList--active" class="number" data-page="${i}">
                            <span>1</span>
                        </li>
                        <li class="memberList--nonActive number" data-page="${i}">
                            <span>2</span>
                        </li>
                        <li class="memberList--nonActive" data-page="${pagination.next}">
                            <span class="material-icons">keyboard_arrow_right</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <!--  스크립트 영역  -->
    <script src="resources/js/admin_member.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="resources/js/datepicker-ko.js"></script>
</body>
</html>