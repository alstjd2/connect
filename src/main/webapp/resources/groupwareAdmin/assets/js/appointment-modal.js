$(function () {
	const contextPath = document.body.dataset.contextPath; // contextPath 가져옴
    const select2ShareProject = $('.share-project-select');
    const shareProject = document.getElementById('addPerson');
	const orgDepSelectContainer = $('#orgDepSelectContainer'); // 부서 선택 박스 컨테이너
	const orgDepSelect = $('#orgDepSelect'); // 부서 선택 드롭다운


	// 부서 목록을 서버로부터 가져와서 선택 박스를 업데이트하는 함수
    function updateDepartmentList() {
        $.ajax({
            url: contextPath + '/gw/organization/getDepartments', // 부서 목록을 가져오는 API 엔드포인트
            method: 'GET',
            dataType: 'json',
            success: function (data) {
                const orgDepSelect = $('#orgDepSelect');
                orgDepSelect.empty(); // 기존 옵션 제거
                orgDepSelect.append('<option value="" disabled selected>부서를 선택하세요</option>');

                // 서버로부터 받은 부서 목록을 순회하며 옵션 추가
                data.forEach(function (dept) {
                    orgDepSelect.append(`<option value="${dept.orgNo}">${dept.orgDep}</option>`);
                });
            },
            error: function () {
                alert('부서 목록을 업데이트하는 중 오류가 발생했습니다.');
            }
        });
    }




	// 발령 종류 선택 시 부서 이동 선택 확인
    $('#apmTypeSelect').on('change', function () {
        if ($(this).val() === 'EB01110') { // "부서이동" 값을 "apmType"의 실제 값으로 대체하세요
            orgDepSelectContainer.show();
        } else {
            orgDepSelectContainer.hide();
        }
    });


    // 모달이 보여질 때 실행되는 로직
	shareProject.addEventListener('show.bs.modal', function (event) {
	  // 부서 목록을 업데이트
      updateDepartmentList();
	  // 부서 선택 박스 보이기
      orgDepSelectContainer.hide();

      if (select2ShareProject.length) {
          function renderAvatar(option) {
              if (!option.id) {
                  return option.text;
              }
              var optionEle =
                  '<div class="d-flex align-items-center">' +
                  '<div class="name">' +
                      $(option.element).data('name') +
                  '</div>' +
                  '</div>';
              return optionEle;
          }

          function matchCustom(params, data) {
              if ($.trim(params.term) === '') {
                  return data;
              }

              if ($(data.element).data('name').toString().includes(params.term)) {
                  return data;
              }

              return null;
          }

          select2ShareProject.wrap('<div class="position-relative"></div>').select2({
              dropdownParent: shareProject,
              templateResult: renderAvatar,
              templateSelection: renderAvatar,
              placeholder: 'Add Project Members',
              escapeMarkup: function (es) {
                  return es;
              },
              matcher: matchCustom
          });
      	}
    });

	// 모달이 닫힐 때 실행되는 로직 추가
	shareProject.addEventListener('hidden.bs.modal', function () {
        // 부서 선택 박스 숨기기
        orgDepSelectContainer.hide();

		// 모달 내의 모든 입력 필드를 초기화
        $(this).find('form')[0].reset();

        // select 요소의 선택을 초기화 (초기 선택 옵션으로 변경)
        $('#selectEmployee').val('');
        $('#apmTypeSelect').val('');

        // 발령일자와 발령내용 필드를 초기화
        $('#apmDate').val('');
        $('#apmContent').val('');
    });



	// 새로 추가된 직원 이름 클릭 시 모달에 정보 로드
    $('.employee-name').on('click', function () {
        var apmNo = $(this).data('apmno');

        $.ajax({
            url: contextPath + '/gw/organization/getAppointmentsDetails',
            type: 'GET',
            data: { apmNo: apmNo },
            success: function (data) {
                // 날짜 형식이 올바른지 확인하는 로직 추가
                let apmDate = data.apmDate ? new Date(data.apmDate) : null;
                let apmEndate = data.apmEndate ? new Date(data.apmEndate) : null;

                const formattedDate = apmDate && !isNaN(apmDate.getTime()) ?
                    `${apmDate.getFullYear()}-${('0' + (apmDate.getMonth() + 1)).slice(-2)}-${('0' + apmDate.getDate()).slice(-2)}`
                    : 'N/A';

                const formattedEndDate = apmEndate && !isNaN(apmEndate.getTime()) ?
                    `${apmEndate.getFullYear()}-${('0' + (apmEndate.getMonth() + 1)).slice(-2)}-${('0' + apmEndate.getDate()).slice(-2)}`
                    : 'N/A';

                // 모달에 데이터 설정
                $('#modalEmployeeName').text(data.employeeName || 'N/A');
                $('#modalDepartmentName').text(data.departmentName || 'N/A');
                $('#modalPositionName').text(data.positionName || 'N/A');
                $('#modalOnePositionName').text(data.onePositionName || 'N/A');
                $('#modalApmType').text(data.apmType || 'N/A');
                $('#modalApmDate').text(formattedDate);
                $('#modalApmContent').text(data.apmContent || 'N/A');
                $('#modalEmpState').text(data.empState || 'N/A');
                $('#modalApmEndate').text(formattedEndDate);

                // 모달 표시
                $('#employeeDetailsModal').modal('show');
            },
            error: function () {
                alert('Error loading details.');
            }
        });
    });
});