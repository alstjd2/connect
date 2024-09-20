/**
 * 
 */
document.addEventListener("DOMContentLoaded", function() {
$(document).ready(function() {
	const contextPath = document.body.dataset.contextPath;
    $.ajax({
        url: `${contextPath}/roomReservationData`, // 컨트롤러 URL
        method: 'GET',
        dataType: 'json',
        success: function(data) {
            const reservationData = data;

            $('.reserv-table tbody td').each(function() {
                const cell = $(this);
                const roomNo = cell.data('drr-no').trim();
                const startTime = cell.data('drt_time');
                const cellDate = today; // Assuming today's date is set correctly

                reservationData.forEach(function(reservation) {
                    if (reservation.roomNo === roomNo && reservation.startTime === startTime && reservation.roomDate === cellDate) {
                        // Disable the cell
                        cell.css({
                            'background-color': '#f5f5f5',
                            'pointer-events': 'none',
                            'color': '#ccc'
                        });

                        // Show the EMP_NO
                        cell.html('Reserved by ' + reservation.empNo);
                    }
                });
            });
        },
        error: function(xhr, status, error) {
            console.error('Error fetching reservation data:', status, error);
        }
    });
});


            function delete_reservation(drt_time) {
                var drr_idx = $('#drr_idx').val();
                var drt_idx = $('#drt_idx').val();
                var drl_user_pw = $('#drl_user_pw').val();
                if (drl_user_pw.trim() == '') {
                    alert('취소용 비밀번호를 입력해 주세요.');
                    return false;
                }
                $.ajax({
                    type: 'post',
                    dataType: 'json',
                    url: '/ddit/function/reservation_func.php?divide=delete_reservation',
                    data: {
                        drr_idx: drr_idx,
                        drt_idx: drt_idx,
                        drt_time: drt_time,
                        drl_user_pw: drl_user_pw,
                        drl_date: '2024-08-12',
                    },
                    async: false,
                    success: function (data) {
                        console.log(data);
                        if (!data.check) {
                            alert(data.reason);
                        } else {
                            alert('예약 취소 되었습니다.');
                            location.reload();
                        }
                    }
                });
            }
            function insert_reservation(drt_time) {
                // 예약 정보를 서버로 전송
                $.ajax({
                    type: 'post',
                    dataType: 'json',
                    url: '/ddit/function/reservation_func.php?divide=insert_reservation',
                    data: {
                        drr_idx: $('#drr_idx').val(),
                        drt_idx: $('#drt_idx').val(),
                        drt_time: drt_time,
                        drl_user_nm: $('#drl_user_nm').val().trim(),
                        drl_user_pw: $('#drl_user_pw').val(),
                        drl_date: '2024-08-12',
                    },
                    async: false,
                    success: function (data) {
                        if (!data.check) {
                            alert(data.reason);
                        } else {
                            alert('예약되었습니다.');
                            location.reload();
                        }
                    }
                });
            }

            function modal_setval(el) {
                console.log(el.attr('rowspan'));
                $('#drr_idx').val(el.data('drr_idx'));
                // 	$('#drt_idx').val(el.data('drt_idx'));
                var rowspan = el.attr('rowspan') * 1;
                var options = '';
                for (var i = 0; i < rowspan; i++) {
                    options += '<option value="' + ((el.data('drt_idx') * 1) + i) + '">' + ((el.data('drt_time') * 1) + i) + '시 부터 ' + ((el.data('drt_time') * 1) + (i + 1)) + '시 전 까지</option>';
                }
                $('#drt_idx').html(options);
                var drr_type = el.data('drr_type');
                var drr_type_str = '';
                switch (drr_type) {
                    case '01': drr_type_str = '분임 토의실'; break;
                    case '02': drr_type_str = '세미나실'; break;
                }
                $('#drr_num').val(drr_type_str + ' ' + el.data('drr_num') + '호');
                $('#drt_time').val(el.data('drt_time') + '시 부터 ' + ((el.data('drt_time') * 1) + 1) + '시 전 까지');
                $('#drl_user_pw').val('');
                var html = '';
                if (el.hasClass('disable')) {
                } else
                    if (el.hasClass('reservated')) {
                        $('#drl_user_nm').attr('readonly', true);
                        $('#drl_user_nm').val(el.find('a').text().trim());
                        html += '<button type="button" class="btn btn-danger" onclick="delete_reservation(\'' + el.data('drt_time') + '\');">예약 취소</button>';
                    } else {
                        $('#drl_user_nm').attr('readonly', false);
                        $('#drl_user_nm').val('');
                        html += '<button type="button" class="btn btn-info" onclick="insert_reservation(\'' + el.data('drt_time') + '\');">예약 저장</button>';
                    }
                $('#reservation_form_modal .modal-footer').html(html);

            }
            function key_toggle(drl_idx, div, flag) {
                $.ajax({
                    type: 'post',
                    dataType: 'json',
                    url: '/ddit/function/reservation_func.php?divide=key_toggle',
                    data: {
                        drl_idx: drl_idx,
                        div: div,
                        value: flag ? 'Y' : 'N'
                    },
                    async: false,
                    success: function (data) {
                        console.log(data);
                        // 			location.reload();
                    }
                });
            }
            // $('body').css('padding', '0px');
            $('#reservation_form_modal').on('show.bs.modal', function (event) {
                // 	$('body').css('padding-right', '-17px');
            });
            $('#reservation_form_modal').on('shown.bs.modal', function (event) {
                // 	$('body').css('padding-right', '0px');
            });

function modal_setval(tdElement) {
    const roomNum = tdElement.data('drr_num');
    const time = tdElement.data('drt_time');
    const endTime = parseInt(time) + 1;
    
    // 예약 시간을 설정하고 모달을 보여줌
    $('#drr_num').val(roomNum);
    $('#drt_idx').html(`<option value="${time}">${time}시 ~ ${endTime}시</option>`);
    $('#reservation_form_modal').modal('show');
}

        function move_date(div, value) {
            if (div == 'Y') cur_date_01.setFullYear(cur_date_01.getFullYear() + (value * 1));
            if (div == 'M') cur_date_01.setMonth(cur_date_01.getMonth() + (value * 1));
            if (div == 'D') cur_date.setDate(cur_date.getDate() + (value * 1));
            location.href = '/room?Y=' + cur_date_01.getFullYear() + '&M=' + (cur_date_01.getMonth() + 1) + '&D=' + (cur_date.getDate());
        }
        
        document.addEventListener("DOMContentLoaded", function() {
            // Create a new Date object to get the current date
            var today = new Date();
            
            // Define options for date formatting
            var options = { year: 'numeric', month: 'long', day: 'numeric' };
            
            // Format the date as a string
            var formattedDate = today.toLocaleDateString('ko-KR', options);
            
            // Set the content of the <h2> element to the formatted date
            document.getElementById('current-date').textContent = formattedDate;
        });
function modal_setval(tdElement) {
    const roomNum = tdElement.data('drr_num');
    const time = tdElement.data('drt_time');
    const endTime = parseInt(time) + 1;
    
    // 예약 시간을 설정하고 모달을 보여줌
    $('#drr_num').val(roomNum);
    $('#drt_idx').html(`<option value="${time}">${time}시 ~ ${endTime}시</option>`);
    $('#reservation_form_modal').modal('show');
}
});