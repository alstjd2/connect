$(document).ready(function() {
    // 페이지 로드 후, Tagify 인스턴스 초기화
    const tagifyInput = document.querySelector('#TagifyUserList');
    let tagifyInstance;

    if (tagifyInput) {
        tagifyInstance = new Tagify(tagifyInput);
    } else {
        console.error('Tagify input element is not found.');
    }

    // AJAX 요청으로 데이터를 가져옵니다
    $.ajax({
        url: 'jsongroupemployee.do',
        type: 'GET',
        dataType: 'json',
        success: function(data) {
            console.log('Received data:', data); // 서버에서 받은 데이터 확인

            // 서버에서 받은 데이터를 원하는 형식으로 변환합니다
            const transformedData = data.map(emp => ({
                value: emp.empNo || 'Unknown', // Tagify는 'value' 필드를 사용합니다
                empNm: emp.empNm || 'Unknown', // 추가 필드 (Tagify의 내부에서 사용되지 않을 수 있음)
                orgDep: emp.company.organizationList[0].orgDep || 'N/A',
                posNm: emp.company.positionList[0].posNm || 'N/A',
                onePosNm: emp.company.positionList[0].oneposnm || 'N/A',
                empNo: emp.empNo || 'N/A'
            }));

            console.log('Transformed data:', transformedData); // 변환된 데이터 확인

            if (tagifyInstance) {
                tagifyInstance.whitelist = transformedData;
//                tagifyInstance.addTags(transformedData.map(tag => tag.empNm)); // `addTags` 메소드는 `value` 필드를 사용합니다

					
					var grpNo = document.querySelector('#jsongrp').value;
					
					$.ajax({
                    url: 'jsongroupemployeeUd.do',
                    type: 'GET',
                    dataType: 'json',
					data: { grpNo: grpNo },
                    success: function(data2) {
                        console.log('Received data 2:', data2); // 서버에서 받은 데이터 확인

                        // JSON 데이터 2를 변환합니다
                        const transformedData2 = data2.map(emp => ({
                            value: emp.value || 'Unknown',
                            label: emp.label || 'Unknown'
                        }));

                        console.log('Transformed data 2:', transformedData2); // 변환된 데이터 확인

                        // JSON 데이터 1과 JSON 데이터 2 비교
                        const tagsToAdd = transformedData2.filter(tag2 => 
                            transformedData.some(tag => tag.empNm === tag2.label)
                        );

                        console.log('Tags to add:', tagsToAdd); // 추가할 태그 확인

                        // 이미 추가된 태그를 포함하도록 설정
                        tagifyInstance.addTags(tagsToAdd.map(tag => tag.label));

                    },
                    error: function(xhr, status, error) {
                        console.error('Error fetching data 2:', error);
                    }
                });
					


				
            } else {
                console.error('Tagify instance is not initialized.');
            }
        },
        error: function(xhr, status, error) {
            console.error('Error fetching data:', error);
        }
    });
});
