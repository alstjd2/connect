$(document).ready(function() {
	
	const contextPath = document.body.dataset.contextPath;	
    // 모달에서 버튼 클릭 시 데이터 채우기
    $('#ansMethods').on('show.bs.modal', function (event) {
        let button = $(event.relatedTarget); // 클릭된 버튼
        let empNo = button.data('pmt-emp-no'); // 버튼에서 pmtDcmNo 값을 가져옵니다.
        let svyNo = button.data('pmt-svy-no');

        // AJAX 요청을 보내서 데이터를 가져옵니다.
        $.ajax({
            url: `${contextPath}/gw/survey/ansList?what=${svyNo}&what2=${empNo}`, // 실제 JSON 파일 경로로 변경
            method: 'GET',
            dataType: 'json',
            success: function(item) {
				if (item && item.length > 0 && item[0]){
                	// 모달 내용 채우기
	                let chiList = item[0].chiList;
					let clsList = item[0].clsList;
					let content = "<div>";
					
					content += '<div class="d-flex justify-content-sm-between align-items-center border-bottom pb-4 mb-4"><div class="d-flex gap-4 align-items-center"><h6 class="m-0">' + '직원명' + ':</h6></div> <p class="m-0 d-none d-sm-block">' + item[0].empNm + '</p></div>';
					content += '<div class="d-flex justify-content-sm-between align-items-center border-bottom pb-4 mb-4"><div class="d-flex gap-4 align-items-center"><h6 class="m-0">' + '소속' + ':</h6></div> <p class="m-0 d-none d-sm-block">' + item[0].empDepNm + '</p></div>';
					content += '<div class="d-flex justify-content-sm-between align-items-center border-bottom pb-4 mb-4"><div class="d-flex gap-4 align-items-center"><h6 class="m-0">' + '직급' + ':</h6></div> <p class="m-0 d-none d-sm-block">' + item[0].empOneposNm + '</p></div>';
					content += '<div class="d-flex justify-content-sm-between align-items-center border-bottom pb-4 mb-4"><div class="d-flex gap-4 align-items-center"><h6 class="m-0">' + '답변일시' + ':</h6></div> <p class="m-0 d-none d-sm-block">' + item[0].svyAnsDate + '</p></div>';
					
					for(let i= 0; i<chiList.length; i+=1){
						content+='<div class="d-flex justify-content-sm-between align-items-center border-bottom pb-4 mb-4"><div class="d-flex gap-4 align-items-center"><h6 class="m-0">' + chiList[i].chiNm + '</h6></div> <p class="m-0 d-none d-sm-block">';
						for(let j= 0; j<clsList.length; j+=1){
							if(chiList[i].chiNo === clsList[j].chiNo){
								content+=clsList[j].clsCnt;
							}
						}
						content+='</p></div>';
					}
					content += '</div>';
                    $('#ansMethods .modal-body').html(content);
                } else {
                    $('#ansMethods .modal-body').html('<p>답변을 작성하지 않았습니다.</p>');
                }
            },
            error: function() {
                $('#ansMethods .modal-body').html('<p>데이터를 가져오는 데 오류가 발생했습니다.</p>');
            }
        });
    });

});