$(document).ready(function() {
    // 페이지 로드 후, Tagify 인스턴스 초기화
    const tagifyInput = document.querySelector('#TagifyUserList');
    let tagifyInstance;

    if (tagifyInput) {
        tagifyInstance = new Tagify(tagifyInput);
    } else {
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
                tagifyInstance.addTags(transformedData.map(tag => tag.value)); // `addTags` 메소드는 `value` 필드를 사용합니다
            } else {
            }
        },
        error: function(xhr, status, error) {
	
        }
    });
});
