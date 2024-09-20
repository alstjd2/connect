
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

function goBack() {
    history.back();
}



function Myalter(icon, title, text = '', param = '', apiUrl = '', confirmIcon = '', confirmTitle = '', confirmText = '') {
  let confirmButtonColor;

  if (icon === 'none' || icon === 'question') {
    confirmButtonColor = 'dark';
  } else if (icon === 'error') {
    confirmButtonColor = 'danger';
  } else {
    confirmButtonColor = icon;
  }

  // 인자의 개수에 따라 분기 처리
  if (text && apiUrl) {
    // 모든 인자가 전달된 경우 (전체 기능)
    Swal.fire({
      title: title,
      text: text,
      icon: icon !== 'none' ? icon : undefined,
      showCancelButton: true,
      confirmButtonText: '승인',
      cancelButtonText: '취소',
      customClass: {
        confirmButton: `btn btn-${confirmButtonColor} me-3`,
        cancelButton: 'btn btn-label-secondary'
      },
      buttonsStyling: false,
      showLoaderOnConfirm: true,
      preConfirm: (param) => {
        return fetch(apiUrl.replace('${param}', param))
          .then(response => {
            if (!response.ok) {
              throw new Error(response.statusText);
            }
            return response.json();
          })
          .catch(error => {
            Swal.showValidationMessage(`Request failed: ${error}`);
          });
      },
      allowOutsideClick: () => !Swal.isLoading()
    }).then(function (result) {
      if (result.value) {
        Swal.fire({
          icon: confirmIcon,
          title: confirmTitle,
          text: confirmText,
          customClass: {
            confirmButton: `btn btn-${confirmIcon !== 'none' ? confirmIcon : 'success'}`
          }
        });
      }
    });
  } else if (text) {
    // text까지만 전달된 경우 (확인 및 취소 버튼 포함)
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
      }
    });
  } else {
    // title과 icon만 전달된 경우 (확인 버튼만 포함)
    Swal.fire({
      title: title,
      icon: icon !== 'none' ? icon : undefined,
      confirmButtonText: '확인',
      customClass: {
        confirmButton: `btn btn-${confirmButtonColor} me-3`
      }
    });
  }
}

// icon 종류
// success, error, warning, info, question
// 버튼 클릭 이벤트 예제
const submit = document.querySelector('#submit');
if (submit) {
  submit.onclick = function (e) {
    Myalter('success', '문서번호변경완료');
	e.target.submit();
  };
}

function submitForm() {
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
            //showCancelButton: true,
            confirmButtonText: '확인',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.isConfirmed) {
                document.getElementById('surveyCreate').submit(); // 폼 제출
            }
        });
    }
}
function populateForm() {
    // Clear existing surveys
    const surveyContainer = document.getElementById('survey-list');
    while (surveyContainer.firstChild) {
        surveyContainer.removeChild(surveyContainer.firstChild);
    }

    // Set default values
    document.getElementById('svyNm').value = '20일 회식 일정/메뉴';
    document.getElementById('svyAllYn').checked = true;
	$('#endDate').addClass('d-none');
	$('#endDate').removeClass('d-flex');
    const today = new Date();
    const day = String(today.getDate()).padStart(2, '0');
    const month = String(today.getMonth() + 1).padStart(2, '0');
    const year = today.getFullYear();
    const formattedDate = `${year}-${month}-${day}`;
    
    document.getElementById('svyStrDate').value = formattedDate;
    document.getElementById('svyEndDate').value = '';

    // Add the first survey with no multiple selection
    const surveyContainer1 = document.createElement('tr');
    surveyContainer1.className = 'survey-container border-white border-bottom-10';
    surveyContainer1.id = 'chiList[0]';
    surveyContainer1.innerHTML = `
        <td class=" p-5 bg-light-subtle rounded">
            <div class="form-check form-switch mb-3">
                <input class="form-check-input" type="checkbox" id="chiList[0].chiOvlYn" name="chiList[0].chiOvlYn">
                <label class="form-check-label" for="chiList[0].chiOvlYn">복수 선택 여부</label>
            </div>
            <input type="text" class="form-control bg-white mb-4" id="chiList[0].chiNm" name="chiList[0].chiNm" placeholder="*설문1 |" value="회의에 참석하시나요?">
            <div class="questions-list" id="questions-list-1">
                <div class="question-container mb-2 ms-0 row w-100">
                    <label for="chiList[0].clsList[0].clsCnt" class="col-md-1 col-form-label text-center fw-bold p-0">*1</label>
                    <div class="col-md-11 p-0">
                        <input type="text" name="chiList[0].clsList[0].clsCnt" id="chiList[0].clsList[0].clsCnt" class="form-control bg-white" placeholder="항목을 입력하세요" value="예">
                    </div>
                </div>
                <div class="question-container mb-2 ms-0 row w-100">
                    <label for="chiList[0].clsList[1].clsCnt" class="col-md-1 col-form-label text-center fw-bold p-0">*2</label>
                    <div class="col-md-11 p-0">
                        <input type="text" name="chiList[0].clsList[1].clsCnt" id="chiList[0].clsList[1].clsCnt" class="form-control bg-white" placeholder="항목을 입력하세요" value="아니오">
                    </div>
                </div>
            </div>
        </td>
    `;

    // Add the second survey with multiple selection
    const surveyContainer2 = document.createElement('tr');
    surveyContainer2.className = 'survey-container border-white border-bottom-10';
    surveyContainer2.id = 'chiList[1]';
    surveyContainer2.innerHTML = `
        <td class=" p-5 bg-light-subtle rounded">
            <div class="form-check form-switch mb-3">
                <input class="form-check-input" type="checkbox" id="chiList[1].chiOvlYn" name="chiList[1].chiOvlYn" checked>
                <label class="form-check-label" for="chiList[1].chiOvlYn">복수 선택 여부</label>
            </div>
            <input type="text" class="form-control bg-white mb-4" id="chiList[1].chiNm" name="chiList[1].chiNm" placeholder="*설문2" value="회식 메뉴를 선택해 주세요.">
            <div class="questions-list" id="questions-list-2">
                <div class="question-container mb-2 ms-0 row w-100">
                    <label for="chiList[1].clsList[0].clsCnt" class="col-md-1 col-form-label text-center fw-bold p-0">*1</label>
                    <div class="col-md-11 p-0">
                        <input type="text" name="chiList[1].clsList[0].clsCnt" id="chiList[1].clsList[0].clsCnt" class="form-control bg-white" placeholder="항목을 입력하세요" value="삼겹살">
                    </div>
                </div>
                <div class="question-container mb-2 ms-0 row w-100">
                    <label for="chiList[1].clsList[1].clsCnt" class="col-md-1 col-form-label text-center fw-bold p-0">*2</label>
                    <div class="col-md-11 p-0">
                        <input type="text" name="chiList[1].clsList[1].clsCnt" id="chiList[1].clsList[1].clsCnt" class="form-control bg-white" placeholder="항목을 입력하세요" value="소고기">
                    </div>
                </div>
                <div class="question-container mb-2 ms-0 row w-100">
                    <label for="chiList[1].clsList[2].clsCnt" class="col-md-1 col-form-label text-center fw-bold p-0">*3</label>
                    <div class="col-md-11 p-0">
                        <input type="text" name="chiList[1].clsList[2].clsCnt" id="chiList[1].clsList[2].clsCnt" class="form-control bg-white" placeholder="항목을 입력하세요" value="해물찜">
                    </div>
                </div>
                <div class="question-container mb-2 ms-0 row w-100">
                    <label for="chiList[1].clsList[3].clsCnt" class="col-md-1 col-form-label text-center fw-bold p-0">*4</label>
                    <div class="col-md-11 p-0">
                        <input type="text" name="chiList[1].clsList[3].clsCnt" id="chiList[1].clsList[3].clsCnt" class="form-control bg-white" placeholder="항목을 입력하세요" value="회">
                    </div>
                </div>
                <div class="question-container mb-2 ms-0 row w-100">
                    <label for="chiList[1].clsList[4].clsCnt" class="col-md-1 col-form-label text-center fw-bold p-0">*5</label>
                    <div class="col-md-11 p-0">
                        <input type="text" name="chiList[1].clsList[4].clsCnt" id="chiList[1].clsList[4].clsCnt" class="form-control bg-white" placeholder="항목을 입력하세요" value="조개구이">
                    </div>
                </div>
                <div class="question-container mb-2 ms-0 row w-100">
                    <label for="chiList[1].clsList[5].clsCnt" class="col-md-1 col-form-label text-center fw-bold p-0">*6</label>
                    <div class="col-md-11 p-0">
                        <input type="text" name="chiList[1].clsList[5].clsCnt" id="chiList[1].clsList[5].clsCnt" class="form-control bg-white" placeholder="항목을 입력하세요" value="오리고기">
                    </div>
                </div>
            </div>
            <button type="button" class="btn btn-label-secondary btn-sm w-100" onclick="addQuestion(2)">
                <span class='tf-icons bx bx-plus bx-18px me-2'></span>
                항목 추가
            </button>
        </td>
    `;

    // Append the new surveys
    surveyContainer.appendChild(surveyContainer1);
    surveyContainer.appendChild(surveyContainer2);
}
