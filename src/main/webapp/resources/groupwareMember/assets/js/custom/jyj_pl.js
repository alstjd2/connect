(function () {  
	
    window.onload = function () {
        window.setTimeout(function(){
            fadeout();
        })
    }
	 function fadeout() {
        document.querySelector('.preloader').style.opacity = '0';
        document.querySelector('.preloader').style.display = 'none';
    }
})();

function Myalter(icon, title, text = '', confirmIcon = '', confirmTitle = '', confirmText = '', formId = 'dynamicForm') {
    let confirmButtonColor;

    if (icon === 'none' || icon === 'question') {
        confirmButtonColor = 'dark';
    } else if (icon === 'error') {
        confirmButtonColor = 'danger';
    } else {
        confirmButtonColor = icon;
    }

    if (text) {
        Swal.fire({
            title: title,
            text: text,
            icon: icon !== 'none' ? icon : undefined,
            showCancelButton: true,
            confirmButtonText: '확인',
            cancelButtonText: '취소',
            customClass: {
                confirmButton: `btn btn-${confirmButtonColor} me-3`,
                cancelButton: 'btn btn-label-secondary'
            },
            buttonsStyling: false,
            showLoaderOnConfirm: true,
            preConfirm: () => {
                return new Promise((resolve, reject) => {
                    const form = document.getElementById(formId);
                    const formData = new FormData(form);

                    fetch(form.action, {
                        method: form.method,
                        body: formData
                    })
                    .then(response => response.json())  // JSON으로 처리 (서버 응답에 맞게 변경)
                    .then(data => {
                        if (data.success) {
                            resolve(data);
                        } else {
                            reject(data);
                        }
                    })
                    .catch(error => {
                        reject(error);
                    });
                });
            }
        }).then((result) => {
            if (result.value) {
                return Swal.fire({
                    icon: confirmIcon,
                    title: confirmTitle,
                    text: confirmText,
                    confirmButtonText: '확인',
                    customClass: {
                        confirmButton: `btn btn-${confirmIcon !== 'none' ? confirmIcon : 'success'}`
                    },
                    showCancelButton: false
                });
            }
        }).then(() => {
            // 성공적인 응답 후 페이지 새로고침
            location.reload();
        }).catch((error) => {
            Swal.fire({
                icon: 'error',
                title: '오류 발생',
                text: error.message || '서버 요청 처리 중 오류가 발생했습니다.',
                showCancelButton: error.showCancelButton || false,
                confirmButtonText: error.confirmButtonText || '확인',
                customClass: {
                    confirmButton: 'btn btn-danger'
                }
            }).then(() => {
                // 오류 발생 후 페이지 새로고침
                location.reload();
            });
        });
    } else {
        Swal.fire({
            title: title,
            icon: icon !== 'none' ? icon : undefined,
            confirmButtonText: '확인',
            customClass: {
                confirmButton: `btn btn-${confirmButtonColor} me-3`
            },
            showCancelButton: false
        });
    }
}


let surveyCount = 1;
const maxSurveys = 10;
const maxQuestions = 15;

$('#svyAllYn').on('change',function(){
	$('#svyEndDate').val('');
	$('#endDate').toggleClass('d-flex');
	$('#endDate').toggleClass('d-none');
})


function addSurvey() {
    if (surveyCount >= maxSurveys) {
        alert('설문은 최대 10개까지 추가할 수 있습니다.');
        return;
    }
    surveyCount++;
    const surveyContainer = document.createElement('tr');
    surveyContainer.className = 'survey-container border-white border-bottom-10';
    surveyContainer.id = `chiList[${surveyCount-1}]`;
//chiNo[0]
    surveyContainer.innerHTML = `
        <td class=" p-5 bg-light-subtle rounded">
            <div class="form-check form-switch mb-3">
                <input class="form-check-input" type="checkbox" id="chiList[${surveyCount-1}].chiOvlYn" name="chiList[${surveyCount-1}].chiOvlYn">
                <label class="form-check-label" for="chiList[${surveyCount-1}].chiOvlYn">복수 선택 여부</label>
            </div>
            <input type="text" class="form-control bg-white mb-4" id="chiList[${surveyCount-1}].chiNm" name="chiList[${surveyCount-1}].chiNm" placeholder="*설문${surveyCount} | 제목을 입력하세요.">
            <div class="questions-list" id="questions-list-${surveyCount}">
                <div class="question-container mb-2 ms-0 row w-100">
                    <label for="chiList[${surveyCount-1}].clsList[0].clsCnt" class="col-md-1 col-form-label text-center fw-bold p-0">*1</label>
                    <div class="col-md-11 p-0">
                        <input type="text" name="chiList[${surveyCount-1}].clsList[0].clsCnt" id="chiList[${surveyCount-1}].clsList[0].clsCnt" class="form-control bg-white" placeholder="항목을 입력하세요">
                    </div>
                </div>
                <div class="question-container mb-2 ms-0 row w-100">
                    <label for="chiList[${surveyCount-1}].clsList[1].clsCnt" class="col-md-1 col-form-label text-center fw-bold p-0">*2</label>
                    <div class="col-md-11 p-0">
                        <input type="text" name="chiList[${surveyCount-1}].clsList[1].clsCnt" id="chiList[${surveyCount-1}].clsList[1].clsCnt" class="form-control bg-white" placeholder="항목을 입력하세요">
                    </div>
                </div>
                <!-- 항목이 추가되는 영역 -->
            </div>
            <button type="button" class="btn btn-label-secondary btn-sm w-100" onclick="addQuestion(${surveyCount})">
                <span class='tf-icons bx bx-plus bx-18px me-2'></span>
                항목 추가
            </button>
        </td>
    `;

    document.getElementById('survey-list').appendChild(surveyContainer);
}

function addQuestion(surveyId) {
    const questionsList = document.getElementById(`questions-list-${surveyId}`);
    const questionCount = questionsList.children.length + 1;
    if (questionCount > maxQuestions) {
        alert('항목은 설문당 최대 15개까지 추가할 수 있습니다.');
        return;
    }
    
    const questionContainer = document.createElement('div');
    questionContainer.className = 'question-container mb-2 ms-0 row w-100';
    questionContainer.innerHTML = `
        <label for="chiList[${surveyId-1}].clsList[${questionCount-1}].clsCnt" class="col-md-1 col-form-label text-center fw-bold p-0">*${questionCount}</label>
        <div class="col-md-11 p-0">
            <input type="text" name="chiList[${surveyId-1}].clsList[${questionCount-1}].clsCnt" id="chiList[${surveyId-1}].clsList[${questionCount-1}].clsCnt" class="form-control bg-white" placeholder="항목을 입력하세요">
        </div>
    `;

    questionsList.appendChild(questionContainer);
}

let currentUrl = window.location.href;

function goBack() {
    history.back();

    setTimeout(function() {
        if (window.location.href === currentUrl) {
            // 현재 페이지와 동일하면 한 번 더 back 호출
            history.back();
        }
    }, 100); // 페이지 전환이 완료된 후 확인하기 위해 setTimeout 사용
}


function validateForm() {
    // 설문에서 질문들에 대한 입력 검증
    const questions = document.querySelectorAll('input[type="text"]');
	const svyStrDate = document.querySelector('#svyStrDate');
	const svyAllYn = document.querySelector('#svyAllYn');
	
    let isValid = true;
    let isValidStrDate = true;
    let isValidEndDate = true;

    questions.forEach((question, index) => {
		
        // 단일 선택 질문의 경우
        if (question.value.length <= 0) {
            isValid = false;
        }

		const today = new Date();
	    today.setHours(0, 0, 0, 0);
		if(svyStrDate.value.length<=0 || new Date(svyStrDate.value) < today){
			isValidStrDate = false;
		}
		if(!svyAllYn.checked && (svyEndDate.value.length<=0 || new Date(svyEndDate.value) <= new Date(svyStrDate.value))){
			isValidEndDate = false;
		}
    });

    if (!isValid) {
        // 선택하지 않은 경우 경고 메시지
        Swal.fire({
            icon: 'warning',
            title: '모든 내용을 작성해 주세요.',
            confirmButtonText: '확인'
        });
    } else if (!isValidStrDate) {
        Swal.fire({
            icon: 'warning',
            title: '시작일시를 확인해 주세요.',
            confirmButtonText: '확인'
        });
    } else if (!isValidEndDate) {
        Swal.fire({
            icon: 'warning',
            title: '종료일시를 확인해 주세요.',
            confirmButtonText: '확인'
        });
    }else {
        // 모든 질문에 답변을 한 경우 확인 메시지
        Swal.fire({
            title: '설문을 제출하시겠습니까?',
            icon: 'question',
            showCancelButton: true,
            confirmButtonText: '확인',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.isConfirmed) {
                document.getElementById('surveyCreate').submit(); // 폼 제출
            }
        });
    }
}

