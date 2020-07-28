/* admin_member 시작 by.유빈 */

let updateFormStatus = false;

$(function() {
    $("#memberListSearch--startDate").datepicker({
        showOn: "both",
        buttonImage: "resources/img/admin/calendar.png",
        buttonImageOnly: true,
    });
});

$(function() {
    $("#memberListSearch--endDate").datepicker({
        showOn: "both",
        buttonImage: "resources/img/admin/calendar.png",
        buttonImageOnly: true,
    });
});

function sendSearch() {

    if (searchFormCheck()) {
        return;
    }

    let formData = $('#searchForm').serialize();
    console.log(decodeURI(formData));
};

function searchFormCheck() {
    const phoneRegexp = /^[0-9]*$/;
    let searchPhone = $('input[name="searchPhone"]').val();
    if(!phoneRegexp.test(searchPhone)) {
        alert("연락처에는 숫자만 입력해주세요");
        return true;
    }

    let v_startDate = $('input[name="startDate"]').val();
    let v_endDate = $('input[name="endDate"]').val();
    let startDate = new Date(v_startDate);
    let endDate = new Date(v_endDate);
    let subtractDate = endDate - startDate;
    if (subtractDate < 0) {
        alert("가입기간의 시작하는 날짜는 끝나는날짜보다 빨라야 합니다");
        return true;
    }

    return false;
};

let originData = [];

$(document).on('click','.memberList--changeUpdateFormBtn', function() {
    if (updateFormStatus) {
        alert("수정은 한개의 데이터씩 가능합니다");
        return;
    }
    updateFormStatus = true;

    let tr = $(this).closest('tr');

    for(let i = 0; i < 7; i ++) {
        if (i == 6) {
            originData.push(tr.find('button').attr('data-memberNumber'));
        } else {
            originData.push(tr.children().eq(i).html());
        }
    }

    let updateFormOutput = `
        <td>${originData[0]}</td>
        <td><input type="text" value="${originData[1]}"></td>
        <td><input type="text" value="${originData[2]}"></td>
        <td><input type="text" value="${originData[3]}"></td>
        <td>
            <select>`;

    if (originData[4] == "정상") {
        updateFormOutput += `
            <option value="0" selected>정상</option>
            <option value="1">탈퇴</option>
            <option value="2">관리자</option>`;
    } else if (originData[4] == "탈퇴") {
        updateFormOutput += `
            <option value="0">정상</option>
            <option value="1" selected>탈퇴</option>
            <option value="2">관리자</option>`;
    } else {
        updateFormOutput += `
            <option value="0" selected>정상</option>
            <option value="1">탈퇴</option>
            <option value="2" selected>관리자</option>`;
    }

    updateFormOutput += `
            </select>
        </td>
        <td><input id="memberListSearch--updateDate" name="updateDate" type="text" 
            value="${originData[5]}" readonly style="width: 81%;"></td>
        <td class="flex-row memberList--update">
            <button class="memberList--updateBtn" data-memberNumber="${originData[6]}" type="button">수정</button>
            <button class="memberList--cancelUpdateFormBtn" type="button">취소</button>
        </td>`;

    tr.html(updateFormOutput);

    $(function() {
        $("#memberListSearch--updateDate").datepicker({
            showOn: "both",
            buttonImage: "resources/img/admin/calendar.png",
            buttonImageOnly: true,
        });
    });
});

$(document).on('click','.memberList--cancelUpdateFormBtn', function() {
    let tr = $(this).closest('tr');

    let updateFormOutput = `
        <td>${originData[0]}</td>
        <td>${originData[1]}</td>
        <td>${originData[2]}</td>
        <td>${originData[3]}</td>
        <td>${originData[4]}</td>
        <td>${originData[5]}</td>
        <td class="flex-row memberList--update">
            <button class="memberList--changeUpdateFormBtn" data-memberNumber="<td>${originData[6]}</td>" type="button">수정</button>
        </td>`;

    tr.html(updateFormOutput);

    originData = [];
    updateFormStatus = false;
});

$(document).on('click','.memberList--updateBtn', function() {
    let tr = $(this).closest('tr');

    let updateData = [];

    for(let i = 1; i < 7; i ++) {
        if (i == 6) {
            updateData.push(tr.find('button').attr('data-memberNumber'));
        } else {
            updateData.push(tr.children().eq(i).children().val());
        }
    }

    let formData = new FormData();
    formData.append('updateName', updateData[0]);
    formData.append('updateEmail', updateData[1]);
    formData.append('updatePhone', updateData[2]);
    formData.append('updateStatus', updateData[3]);
    formData.append('updateDate', updateData[4]);
    formData.append('updateNumber', updateData[5]);

    // let updateFormOutput = `
    //     <td>${originData[0]}</td>
    //     <td><input type="text" value="${originData[1]}"></td>
    //     <td><input type="text" value="${originData[2]}"></td>
    //     <td><input type="text" value="${originData[3]}"></td>
    //     <td><input type="text" value="${originData[4]}"></td>
    //     <td><input id="memberListSearch--updateDate" name="updateDate" type="text" 
    //         value="${originData[5]}" readonly style="width: 81%;"></td>
    //     <td class="flex-row memberList--update">
    //         <button class="memberList--updateBtn" data-memberNumber="${originData[6]}" type="button">수정</button>
    //         <button class="memberList--cancelUpdateFormBtn" type="button">취소</button>
    //     </td>`;

    // tr.html(updateFormOutput);

    // $(function() {
    //     $("#memberListSearch--updateDate").datepicker({
    //         showOn: "both",
    //         buttonImage: "resources/img/admin/calendar.png",
    //         buttonImageOnly: true,
    //     });
    // });
});

/* admin_member 끝 by.유빈 */