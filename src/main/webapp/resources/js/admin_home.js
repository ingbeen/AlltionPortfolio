/* admin_home by.유빈 */

$(() => {
    $.ajax({
        url : "getAdminHomeData.yb",
        dataType :"json",
        success : (adminHomeData) => {
        	setMainConut(adminHomeData);
        	dailyAuction(adminHomeData.dailyAuctioCountList);
        },
        error : () => {}
    });
})

function setMainConut(adminHomeData) {
	let countDataArr = [];
	
	countDataArr.push(adminHomeData.memberCount);
	countDataArr.push(adminHomeData.productCount);
	countDataArr.push(adminHomeData.tradingCount);
	countDataArr.push(adminHomeData.bidCount);
	countDataArr.push(adminHomeData.paySum);
	
	for (let i = 0; i < countDataArr.length; i++) {
		countDataArr[i] = addCommas(countDataArr[i]);
	}
	
	$('.memberCount').html(countDataArr[0]);
	$('.productCount').html(countDataArr[1]);
	$('.tradingCount').html(countDataArr[2]);
	$('.bidCount').html(countDataArr[3]);
	$('.paySum').html(countDataArr[4]);
}

function addCommas(value) {
    return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g,  ",");
}

// 최근 일주일 경매등록수
function dailyAuction(dailyAuctioCountList) {
	c3.generate({
	    bindto: '.dailyAuction--chart',
	    data: {
	        x : 'x',
	        columns: [
	            ['x', 'D-7', 'D-6', 'D-5', 'D-4', 'D-3', 'D-2', 'D-1'],
	            ['dailyAuction', 
            	  dailyAuctioCountList[0], 
            	  dailyAuctioCountList[1], 
            	  dailyAuctioCountList[2],
            	  dailyAuctioCountList[3],
            	  dailyAuctioCountList[4], 
            	  dailyAuctioCountList[5], 
            	  dailyAuctioCountList[6]
	            ]
	        ],
	        types: {
	            'dailyAuction': 'area-spline'
	            // 'line', 'spline', 'step', 'area', 'area-step' are also available to stack
	        },
	        names: {
	            dailyAuction: '일일 경매등록수'
	        },
	        colors: {
	            dailyAuction: '#00b9f1'
	        }
	    },
	    axis: {
	        x: {
	            type: 'category' // this needed to load string x value
	        }
	    },
	    padding: {
	        top: 20,
	        right: 50,
	        bottom: 20,
	        left: 50,
	    },
	    legend: {
	        show: false
	    }
	});
}


// 카태고리별 상품수
let cateCountChart = c3.generate({
    bindto: '.cateCount--chart',
    data: {
        columns: [
            ['cate01', 150],
            ['cate02', 330],
            ['cate03', 212],
            ['cate04', 75],
            ['cate05', 123],
            ['cate06', 353],
            ['cate07', 444],
            ['cate08', 123],
            ['cate08', 33],
            ['cate09', 94],
            ['cate10', 112],
            ['cate11', 268],
            ['cate12', 88],
        ],
        names: {
            cate01: '패션',
            cate02: '뷰티',
            cate03: '출산/유아동',
            cate04: '전자기기',
            cate05: '가전제품',
            cate06: '가구/인테리어',
            cate07: '반려동물/취미',
            cate08: '도서/음반/문구',
            cate09: '티켓/쿠폰',
            cate10: '스포츠',
            cate11: '공구/산업용품',
            cate12: '기타잡화',
        },
        type : 'pie',
    },
    padding: {
        top: 20,
        bottom: 20
    },
    legend: {
        position: 'right'
    }
});

// 최근 일주일 가입자수
let dailySubscribersChart = c3.generate({
    bindto: '.dailySubscribers--chart',
    data: {
        x : 'x',
        columns: [
            ['x', 'D-7', 'D-6', 'D-5', 'D-4', 'D-3', 'D-2', 'D-1'],
            ['dailySubscribers', 150, 200, 300, 40, 60, 120, 170]
        ],
        names: {
            dailySubscribers: '일일 가입자'
        },
        type: 'bar',
        colors: {
            dailySubscribers: '#ff7f0ebb'
        }
    },
    axis: {
        x: {
            type: 'category' // this needed to load string x value
        }
    },
    padding: {
        top: 20,
        right: 50,
        bottom: 20,
        left: 50,
    },
    legend: {
        show: false
    }
});

/* admin_home 끝 by.유빈 */