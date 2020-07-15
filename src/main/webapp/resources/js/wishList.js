/* 찜목록 시작 by.유빈 */

let endDateFormStatus = true; // form의 현재상태
const _second = 1000; // 1초
const _minute = _second * 60; // 1분
const _hour = _minute * 60; // 1시간
const _day = _hour * 24; // 1일

$('.wishList--ChangeEndDateFormBtn').on('click', chageEndDate)

function chageEndDate() {
	// 'wishList--endDate__endDate' 태그 갯수만큼 반복실행한다
    $('.wishList--endDate__endDate').each(function () {
        if (!endDateFormStatus) {
            chanageEndDateToTimeLeft($(this)); // 종료시간 -> 남은시간
        } else {
            chanageTimeLeftToEndDate($(this)); // 남은시간 -> 종료시간
        }
    })

    // 버튼의 상태를 바꿔준다
    if (!endDateFormStatus) {
        $('.wishList--ChangeEndDateFormBtn').html("종료시간 표기");
    } else {
        $('.wishList--ChangeEndDateFormBtn').html("남은시간 표기");
    }

    // form의 현재상태를 바꿔준다
    endDateFormStatus = !endDateFormStatus;
}

// 종료시간 -> 남은시간
function chanageEndDateToTimeLeft(element) {
    let now = new Date(); // 현재시간
    let endDate = new Date(element.attr("data-endDate")); // 마감시간
    let resultTime = ""; // 남은시간

    // 마감시간에서 현재시간을 차감해준다
    let subtractTime = endDate - now;
    
    // 남은시간이 마이너스라면 마감처리
    if(subtractTime < 0) {
        element.html("마감되었습니다");
        return;
    }
    
    // 소수점버림(남은시간 / 1일)
    // 예) 1일 1시간 1분 / 1일 = 1일 1시간 1분
    // 소수점을 버리기에 "1일"이 된다
    let days = Math.floor(subtractTime / _day);
    if (days > 0) {
        resultTime += days + "일 "
    }
    
    // 소수점버림(남은시간 % 1일 / 1시간)
    // 예) 1일 1시간 1분 % 1일 = 1시간 1분
    // 1시간 1분 / 1시간 = 1시간 1분 
    // 소수점을 버리기에 "1시간"이 된다
    let hours = Math.floor((subtractTime % _day) / _hour);
    if (hours > 0) {
        resultTime += hours + "시간 "
    }
    let minutes = Math.floor((subtractTime % _hour) / _minute);
    if (minutes > 0) {
        resultTime += minutes + "분 "
    }
    
    // 마감시간 화면에 출력
    element.html(resultTime);
}

// 남은시간 -> 종료시간
function chanageTimeLeftToEndDate(element) {
    // 현재시간을 얻어온다
    let now = new Date();
    let dataEndDate = element.attr("data-endDate"); // 태그에 저장된 마감시간
    let endDate = new Date(dataEndDate); // Date형식의 마감시간

    // 마감시간에서 현재시간을 차감해준다
    let subtractTime = endDate - now;

    // 남은시간이 마이너스라면 마감처리
    if(subtractTime < 0) {
        element.html("마감되었습니다");
        return;
    }
    
    // 마감시간 화면에 출력
    element.html(dataEndDate);
}

function getWishList() {
    $.ajax({
        url : "getWishList.yb",
        dataType :"json",
        success : (wishList) => wishListOutput(wishList),
        error : () => $('.wishList--conut').last().html(0)
    });
}

function wishListOutput (wishList) {
	let wishListContents = "";
	let wishListCount = 0;
	
	$.each(wishList, (idx, vo) => {
		wishListCount += 1;
		wishListContents += `
<div class="wishList--contents">
    <div class="wishList--deleteCheck">
        <input class="wishList--deleteCheck__deleteCheck" type="checkbox" value="${vo.product_number}">
    </div>
    <div class="wishList--info">
        <div class="wishList--thumbnail">
            <img src="${vo.product_img_1}">
        </div>
        <div class="wishList--description">
            <p class="wishList--description__category">${vo.product_category_1} &gt; ${vo.product_category_2}</p>
            <p class="wishList--description__subject"><a>${vo.product_subject}</a></p>
            <p class="wishList--description__seller">${vo.product_id} / ${vo.product_credit_score}(수정 : 클릭여부, 신용도등급변환)</p>
        </div>
    </div>
    <div class="wishList--currentPrice">
        <p class="wishList--currentPrice__currentPrice">${vo.product_current_price}</p>
        <div class="wishList--purchase_priceWarp">
            <p class="wishList--purchase_priceWarp__purchase_price">즉시구매가 : ${vo.product_purchase_price}</p>
            <p class="wishList--purchase_priceWarp__bids">입찰 : ${vo.product_bids}</p>
        </div>
    </div>
    <div class="wishList--delivery">
        <p class="wishList--delivery__delivery">${vo.product_delivery}</p>
        <p class="wishList--delivery__transactionArea">직거래가능지역 : ${vo.product_transaction_area}</p>
    </div>
    <div class="wishList--endDate">
        <p class="wishList--endDate__endDate" data-endDate="${vo.product_end_date}">${vo.product_end_date}</p>
        <button class="wishList--bidBtn" type="button" onclick="location.href='./boarddetail.hs?product_number=${vo.product_number}'">응찰하기</button>
    </div>
</div>
		`;
	})
	
	$('.wishList--contentsWarp').html(wishListContents);
	$('.wishList--conut').last().html(wishListCount)
	chageEndDate();
}

/* 체크박스 전체선택, 전체해제 */
function checkAll() {
	if( $(".wishList--deleteCheck__allDeleteCheck").is(':checked') ){
		$(".wishList--deleteCheck__deleteCheck").prop("checked", true);
	} else {
		$(".wishList--deleteCheck__deleteCheck").prop("checked", false);
	}
}

function wishListDelete() {
	let wishList = new Array();
	
	$('.wishList--deleteCheck__deleteCheck:checked').each((idx, element) => {
		wishList.push(element.value);
	});
	
	$.ajax({
        url : "wishListDelete.yb",
        type : "POST",
        data : { "wishList" : wishList },
        success : () => {},
        error : () => {}
    });
	
}

$('document').ready(() => {
	getWishList();
})

/* 찜목록 끝 by.유빈 */