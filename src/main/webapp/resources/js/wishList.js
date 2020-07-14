/* 찜목록 시작 by.유빈 */

let endDateFormStatus = false; // form의 현재상태
const _second = 1000; // 1초
const _minute = _second * 60; // 1분
const _hour = _minute * 60; // 1시간
const _day = _hour * 24; // 1일

$('.wishList--ChangeEndDateFormBtn').on('click', () => {
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
})

// 종료시간 -> 남은시간
function chanageEndDateToTimeLeft (element) {
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
function chanageTimeLeftToEndDate (element) {
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
        url : "getWishList.yb", // test.jsp 에서 받아옴
        dataType :"json", // 데이터타입을 json 으로 받아옴
        success : (wishList) => console.log(wishList),
        error : () => alert("찜목록 불러오기에 실패했습니다")
    });
}

$('document').ready(() => {
	getWishList();
})

/* 찜목록 끝 by.유빈 */