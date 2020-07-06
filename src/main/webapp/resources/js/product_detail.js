'use strict';
$(function() {
    // 스크롤 내릴 때 카테고리 고정하기 by 하나
    let topPosition = parseInt($(".list_sidebar").css('top')); // 기존 위치 값 저장
    let footerHeight = $('.footer').outerHeight(); // 푸터 영역에서 멈추게 하기 위해 높이 구함

    $(window).scroll(function() {
        let scrollTop = $(window).scrollTop(); // 현재 스크롤 위치 가지고 오기
        let newPosition = scrollTop + topPosition + "px";
        let stopArea = $(document).height() - $(window).height() - footerHeight;

        if (scrollTop + 120 > stopArea) { // 120 추가 이유: 카테고리 펼쳐져 있을 때도 푸터 위에서 멈추게 하기 위해
            $('.list_sidebar').css('position', 'normal');
        } else {
            $(".list_sidebar").stop().animate({
                "top" : newPosition
            }, 400);
        }
    }).scroll();

    // 아코디언 by 하나
    $(".mainmenu").click(function() {
        $(this).next().slideDown();
        $(this).next().siblings(".submenu").slideUp();
    });
});
        
// BEST 영역 by 민석
var index = 0; //이미지에 접근하는 인덱스
window.onload = function() {
    slideShow();
}

function slideShow() {
    var i;
    var x = document.getElementsByClassName("slide1");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < x.length; i++) {
        x[i].style.display = "none"; //처음에 전부 display를 none으로 설정
    }
    index++;
    if (index > x.length) {
        index = 1; //인덱스가 초과되면 1로 변경
    }
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    x[index - 1].style.display = "block"; // 해당 인덱스는 block으로
    dots[index - 1].className += " active";
    setTimeout(slideShow, 4000);
}