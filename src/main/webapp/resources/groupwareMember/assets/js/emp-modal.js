$(document).ready(function() {
	
	const contextPath = document.body.dataset.contextPath;	
    // 모달에서 버튼 클릭 시 데이터 채우기
    $('#empMethods').on('show.bs.modal', function (event) {
        let button = $(event.relatedTarget); // 클릭된 버튼
        let pmtEmpNo = button.data('pmt-emp-no'); // 버튼에서 pmtDcmNo 값을 가져옵니다.

        // AJAX 요청을 보내서 데이터를 가져옵니다.
        $.ajax({
            url: `${contextPath}/gw/document/empList?what=${pmtEmpNo}`, // 실제 JSON 파일 경로로 변경
            method: 'GET',
            dataType: 'json',
            success: function(item) {
            //success: function(response) {
                //let dataArray = response; // 실제 데이터 배열 추출
				//console.log(dataArray);
                //let item = dataArray.find(item => item.empNo == pmtDcmNo); // pmtDcmNo로 해당 아이템을 찾습니다.
                if (item) {
                // 모달 내용 채우기
                let content = '<div>';
					//if(item.empDelyn=='N'){
						$.each(item, function(key, value) {
							
							if(key=="empNm"){							
	                        	content += '<div class="d-flex justify-content-sm-between align-items-center border-bottom pb-4 mb-4"><div class="d-flex gap-4 align-items-center"><h6 class="m-0">' + '직원명' + ':</h6></div> <p class="m-0 d-none d-sm-block">' + value + '</p></div>';
							}
							if(key=="empId"){							
	                        	content += '<div class="d-flex justify-content-sm-between align-items-center border-bottom pb-4 mb-4"><div class="d-flex gap-4 align-items-center"><h6 class="m-0">' + '직원ID' + ':</h6></div> <p class="m-0 d-none d-sm-block">' + value + '</p></div>';
							}
							if(key=="empTel"){							
	                        	content += '<div class="d-flex justify-content-sm-between align-items-center border-bottom pb-4 mb-4"><div class="d-flex gap-4 align-items-center"><h6 class="m-0">' + '전화번호' + ':</h6></div> <p class="m-0 d-none d-sm-block">' + value + '</p></div>';
							}
							if(key=="empCommail"){							
	                        	content += '<div class="d-flex justify-content-sm-between align-items-center border-bottom pb-4 mb-4"><div class="d-flex gap-4 align-items-center"><h6 class="m-0">' + '내부메일' + ':</h6></div> <p class="m-0 d-none d-sm-block">' + value + '</p></div>';
							}
							if(key=="empMail"){							
	                        	content += '<div class="d-flex justify-content-sm-between align-items-center border-bottom pb-4 mb-4"><div class="d-flex gap-4 align-items-center"><h6 class="m-0">' + '개인메일' + ':</h6></div> <p class="m-0 d-none d-sm-block">' + value + '</p></div>';
							}
							if(key=="empBir"){							
	                        	content += '<div class="d-flex justify-content-sm-between align-items-center border-bottom pb-4 mb-4"><div class="d-flex gap-4 align-items-center"><h6 class="m-0">' + '생일' + ':</h6></div> <p class="m-0 d-none d-sm-block">' + value + '</p></div>';
							}
							if(key=="empJoindate"){							
	                        	content += '<div class="d-flex justify-content-sm-between align-items-center border-bottom pb-4 mb-4"><div class="d-flex gap-4 align-items-center"><h6 class="m-0">' + '입사일' + ':</h6></div> <p class="m-0 d-none d-sm-block">' + value + '</p></div>';
							}
							if(key=="company"){		
								if(value.organizationList.length != 0){
									content += '<div class="d-flex justify-content-sm-between align-items-center border-bottom pb-4 mb-4"><div class="d-flex gap-4 align-items-center"><h6 class="m-0">' + '소속' + ':</h6></div> <p class="m-0 d-none d-sm-block">' + value.organizationList[0].orgDep + '</p></div>';
								}else{
									content += '<div class="d-flex justify-content-sm-between align-items-center border-bottom pb-4 mb-4"><div class="d-flex gap-4 align-items-center"><h6 class="m-0">' + '소속' + ':</h6></div> <p class="m-0 d-none d-sm-block">소속이 없습니다.</p></div>';
								}				
	                        	content += '<div class="d-flex justify-content-sm-between align-items-center border-bottom pb-4 mb-4"><div class="d-flex gap-4 align-items-center"><h6 class="m-0">' + '직급' + ':</h6></div> <p class="m-0 d-none d-sm-block">' + value.positionList[0].posNm + '</p></div>';
								content += '<div class="d-flex justify-content-sm-between align-items-center border-bottom pb-4 mb-4"><div class="d-flex gap-4 align-items-center"><h6 class="m-0">' + '직책' + ':</h6></div> <p class="m-0 d-none d-sm-block">' + value.positionList[0].oneposnm + '</p></div>';
								
							}
							//if(key=="atchFile"){							
	                        	//content += '<div class="d-flex justify-content-sm-between align-items-center border-bottom pb-4 mb-4"><div class="d-flex gap-4 align-items-center"><h6 class="m-0">' + '이미지' + ':</h6></div> <p class="m-0 d-none d-sm-block"> <img src="'+value.fileDetails[0].fileStreCours + '"/></p></div>';
							//}
	                    });
					//}
                    
                    content += '</div>';
                    $('#empMethods .modal-body').html(content);
                } else {
                    $('#empMethods .modal-body').html('<p>데이터가 없습니다.</p>');
                }
            },
            error: function() {
                $('#empMethods .modal-body').html('<p>데이터를 가져오는 데 오류가 발생했습니다.</p>');
            }
        });
    });

});