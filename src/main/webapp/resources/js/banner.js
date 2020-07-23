$(document).ready(function(){

    $(".banner > div:gt(0)").hide();
    let interval = setInterval(slide, 3000);

    function intslide(func) {
        if (func == 'start') { 
            interval = setInterval(slide, 3000);
        } else {
            clearInterval(interval);		
        }
    }

    function slide() {
            sact('next', 0, 1200);
    }
        
    function sact(a, ix, it) {
    var currentSlide = $('.current');
    var nextSlide = currentSlide.next('.banner_slide');
    var prevSlide = currentSlide.prev('.banner_slide');
        var reqSlide = $('.banner_slide').eq(ix);

        var currentDot = $('.active');
        var nextDot = currentDot.next();
        var prevDot = currentDot.prev();
        var reqDot = $('.dot').eq(ix);

    if (nextSlide.length == 0) {
        nextDot = $('.dot').first();
        nextSlide = $('.banner_slide').first();
        }

    if (prevSlide.length == 0) {
        prevDot = $('.dot').last();
        prevSlide = $('.banner_slide').last();
        }
        
    if (a == 'next') {
        var Slide = nextSlide;
        var Dot = nextDot;
        }
        else if (a == 'prev') {
            var Slide = prevSlide;
            var Dot = prevDot;
            }
            else {
                var Slide = reqSlide;
                var Dot = reqDot;
                }

        currentSlide.fadeOut(it).removeClass('current');
        Slide.fadeIn(it).addClass('current');
        
        currentDot.removeClass('active');
        Dot.addClass('active');
    }	

    $('.next').on('click', function(){
            intslide('stop');						
            sact('next', 0, 400);
            intslide('start');						
        });//next

    $('.prev').on('click', function(){
            intslide('stop');						
            sact('prev', 0, 400);
            intslide('start');						
        });//prev

    $('.dot').on('click', function(){
            intslide('stop');
            var index  = $(this).index();
            sact('dot', index, 400);
            intslide('start');						
        });//prev
    //slideshow
});