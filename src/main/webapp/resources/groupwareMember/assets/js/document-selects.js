/**
 * Selects & Tags
 */

'use strict';

$(function () {
	
  const selectPicker = $('.selectpicker'),
    //select2 = $('.select2'),
    select2Dcm = $('.select2-dcm'),
    select2Emp = $('.select2-emp'),
    select2Pos = $('.select2-pos'),
    select2Rec = $('.select2-rec'),
    select2Icons = $('.select2-icons');

  // Bootstrap Select
  // --------------------------------------------------------------------
  if (selectPicker.length) {
    selectPicker.selectpicker();
  }

  // Select2
  // --------------------------------------------------------------------

  // Default
  /*
	if (select2.length) {
    select2.each(function () {
      var $this = $(this);
      $this.wrap('<div class="position-relative"></div>').select2({
        placeholder: '내용을 선택하세요.',
        dropdownParent: $this.parent()
      });
    });
  }
  */

  // select2Dcm
  if (select2Dcm.length) {
    select2Dcm.each(function () {
      var $this = $(this);
      $this.wrap('<div class="position-relative"></div>').select2({
        placeholder: '관련 문서를 선택하세요.',
        dropdownParent: $this.parent()
      });
    });
  }

  // select2Dcm
  if (select2Emp.length) {
    select2Emp.each(function () {
      var $this = $(this);
      $this.wrap('<div class="position-relative w-100"></div>').select2({
        placeholder: '결재 인원을 선택하세요.',
        dropdownParent: $this.parent()
      });
    });
  }

  // select2Dcm
  if (select2Pos.length) {
    select2Pos.each(function () {
      var $this = $(this);
      $this.wrap('<div class="position-relative w-100"></div>').select2({
        placeholder: '전결 가능 직급을 선택하세요.',
        dropdownParent: $this.parent()
      });
    });
  }

  // select2Dcm
  if (select2Rec.length) {
    select2Rec.each(function () {
      var $this = $(this);
      $this.wrap('<div class="position-relative w-100"></div>').select2({
        placeholder: '수신자를 선택하세요.',
        dropdownParent: $this.parent()
      });
    });
  }

  // Select2 Icons
  if (select2Icons.length) {
    // custom template to render icons
    function renderIcons(option) {
      if (!option.id) {
        return option.text;
      }
      var $icon = "<i class='" + $(option.element).data('icon') + " me-2'></i>" + option.text;

      return $icon;
    }
    select2Icons.wrap('<div class="position-relative"></div>').select2({
      dropdownParent: select2Icons.parent(),
      templateResult: renderIcons,
      templateSelection: renderIcons,
      escapeMarkup: function (es) {
        return es;
      }
    });
  }



});
/*const dcmInsertForm = document.querySelector('#dcmInsertForm');
dcmInsertForm.addEventListener('submit', function(e) {
	
	const contextPath = document.body.dataset.contextPath;
	e.preventDefault();
    
    // content 영역의 HTML 내용을 가져오기
    let contentElement = document.getElementById('content');
    let contentHtml = contentElement.innerHTML;

    // content 영역의 모든 인풋, 텍스트 에리어, 셀렉트 요소를 찾아서 값을 텍스트로 치환
    contentElement.querySelectorAll('input, textarea, select').forEach(element => {
        let textValue = '';
        if (element.tagName === 'SELECT') {
            // 선택된 옵션의 텍스트를 사용
            textValue = element.options[element.selectedIndex].text;
        } else if (element.type === 'checkbox' || element.type === 'radio') {
            // 체크박스와 라디오 버튼의 경우 체크된 항목만 값을 가져옴
            if (element.checked) {
                textValue = element.value;
            }
        } else if (element.type === 'number') {
	        // 숫자 입력 필드의 경우 쉼표를 추가하여 포맷팅
	        if (element.value) {
	            let numberValue = parseFloat(element.value);
	            textValue = numberValue.toLocaleString(); // 천 단위로 쉼표를 추가
	        }
	    } else {
	        // 일반 텍스트 필드와 텍스트 에리어의 경우 값만 가져옴
	        textValue = element.value;
	    }

        // 해당 요소를 텍스트 노드로 대체
        let textNode = document.createTextNode(textValue);
        element.replaceWith(textNode);
    });

    // 태그를 치환한 후의 HTML을 가져오기
    contentHtml = contentElement.innerHTML;

    // textarea에 HTML 내용을 담기
    document.getElementById('htmlContent').value = contentHtml;

	// content 영역의 수신자 내용을 가져오기
	const recEmpInfo = document.querySelector("#select2-pmtDcmRecEmpno-container");
	const recEmp = recEmpInfo.title;

	// hidden input elements
	const recEmpnm = document.querySelector("input[name='pmtDcm.pmtDcmRecEmpnm']");
	const recEmpdep = document.querySelector("input[name='pmtDcm.pmtDcmRecEmpdep']");
	const recEmponepos = document.querySelector("input[name='pmtDcm.pmtDcmRecEmponepos']");

	
	// 값 설정
	const selectedText = recEmp.split(" ");
	const orgDep = selectedText[0].split("(")[0];
	const posNm = selectedText[0].split("(")[1].split("/")[0];
	
	recEmpnm.value = selectedText[1]; // 예시: 김철수
	recEmpdep.value = orgDep; // 예시: 과장
	recEmponepos.value = posNm; // 예시: 개발부서
	
	
	// 폼 데이터를 수집
    const formData = new FormData(dcmInsertForm); 

	formData.forEach((value, key) => {
	    console.log(`Key: ${key}, Value: ${value}`);
	});

    // FormData를 JSON 객체로 변환
    const jsonData = {};
    formData.forEach((value, key) => {
	    const keys = key.split('.'); // `.`으로 키를 나누기
	
	    keys.reduce((acc, part, index) => {
	        if (index === keys.length - 1) {
	            acc[part] = value; // 마지막 키에 값 설정
	        } else {
	            if (!acc[part]) acc[part] = {}; // 객체가 없으면 생성
	            acc = acc[part]; // 다음 레벨로 이동
	        }
	        return acc;
	    }, jsonData);
	});

    // `pmtDcmVO`의 필드들을 `pmtDcm` 객체에 넣기
    jsonData.pmtDcm = jsonData.pmtDcm || {};

	

    //jsonData.pmtDcm.pmtDcmPrfEmpList = JSON.parse(jsonData.pmtDcmPrfEmpList || '[]');

	// 태그 정보가 있는 경우 jsonData에 추가
    const tagifyUserList = window.TagifyUserList ? window.TagifyUserList.value : [];
    jsonData.pmtDcmPrfEmpList = tagifyUserList;
	
	Swal.fire({
        title: '기안 처리하시겠습니까?',
        text: "기안을 처리전에 문서를 확인해 보세요.",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: '확인',
        cancelButtonText: '취소',
        customClass: {
            confirmButton: `btn btn-success me-3`,
            cancelButton: `btn btn-label-secondary me-3`,
        },
        reverseButtons: false
    }).then((result) => {
        if (result.isConfirmed) {
            // 사용자가 '확인' 버튼을 클릭한 경우 JSON 데이터를 서버로 전송
            fetch(e.target.action, { 
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(jsonData)
            })
            .then(
				response => {
					console.log(`HTTP status code: ${response.status}`);
				    if (!response.ok) {
				        throw new Error(`Network response was not ok: ${response.statusText} (${response.status})`);
				    }
				    return response.json();
				}
			)
            .then(data => {
	
	
				if (data.status === 'success') {
			        Swal.fire({
			            title: '등록완료!',
			            text: '결재문서 등록이 완료되었습니다.',
			            icon: 'success',
			            confirmButtonText: '확인'
			        }).then(() => {
			            // 응답에 포함된 pmtDcmNo로 이동 ${contextPath}
			            window.location.href = `${contextPath}/gw/document/detail.do?what=${data.pmtDcmNo}`;
			        });
			    } else {
			        // success가 아닌 경우, 서버에서 예기치 않은 응답이 발생했습니다.
			        throw new Error('등록이 실패하였습니다.');
			    }
            })
            .catch((error) => {
				console.error('Fetch error:', error);
			    Swal.fire({
			        title: '등록실패',
			        text: error.message,
			        icon: 'error',
			        confirmButtonText: 'OK'
			    });
            });
        }
    });
});*/
const autoInput = document.querySelector('#autoInput');


autoInput.addEventListener('click', function() {
    title.value = "[도서구입신청] 신입 역량 강화를 위한 도서 구입 신청";
    reason.value = "입사한 신입의 역량 강화를 위해 도서를 구입하고자 합니다.";
    bookName1.value = "이것이 리눅스다";
    bookWriter1.value = "우재남";
    bookPublisher1.value = "한빛미디어";    
    bookAmount1.value = "3";    
    bookPrice1.value = "32400";    
	bookTotal1.value = "97200";    
    bookName2.value = "모던 자바스크립트 Deep Dive";
    bookWriter2.value = "이웅모";
    bookPublisher2.value = "위키북스";    
    bookAmount2.value = "3";    
    bookPrice2.value = "40500";   
	bookTotal2.value = "121500";     
    bookName3.value = "오라클 성능 고도화 원리와 해법 2";
    bookWriter3.value = "조시형";
    bookPublisher3.value = "디비안(주)";    
    bookAmount3.value = "3";    
    bookPrice3.value = "49000";    
	bookTotal3.value = "147000";     
});

const dcmInsertForm = document.querySelector('#dcmInsertForm');
dcmInsertForm.addEventListener('submit', function(e) {
	
	const contextPath = document.body.dataset.contextPath;
	e.preventDefault();
    
    // content 영역의 HTML 내용을 가져오기
    let contentElement = document.getElementById('content');
    let contentHtml = contentElement.innerHTML;

    // content 영역의 모든 인풋, 텍스트 에리어, 셀렉트 요소를 찾아서 값을 텍스트로 치환
    contentElement.querySelectorAll('input, textarea, select').forEach(element => {
        let textValue = '';
        if (element.tagName === 'SELECT') {
            // 선택된 옵션의 텍스트를 사용
            textValue = element.options[element.selectedIndex].text;
        } else if (element.type === 'checkbox' || element.type === 'radio') {
            // 체크박스와 라디오 버튼의 경우 체크된 항목만 값을 가져옴
            if (element.checked) {
                textValue = element.value;
            }
        } else if (element.type === 'number') {
	        // 숫자 입력 필드의 경우 쉼표를 추가하여 포맷팅
	        if (element.value) {
	            let numberValue = parseFloat(element.value);
	            textValue = numberValue.toLocaleString(); // 천 단위로 쉼표를 추가
	        }
	    } else {
	        // 일반 텍스트 필드와 텍스트 에리어의 경우 값만 가져옴
	        textValue = element.value;
	    }

        // 해당 요소를 텍스트 노드로 대체
        let textNode = document.createTextNode(textValue);
        element.replaceWith(textNode);
    });

    // 태그를 치환한 후의 HTML을 가져오기
    contentHtml = contentElement.innerHTML;

    // textarea에 HTML 내용을 담기
    document.getElementById('htmlContent').value = contentHtml;

	// content 영역의 수신자 내용을 가져오기
	const recEmpInfo = document.querySelector("#select2-pmtDcmRecEmpno-container");
	const recEmp = recEmpInfo.title;

	// hidden input elements
	const recEmpnm = document.querySelector("input[name='pmtDcm.pmtDcmRecEmpnm']");
	const recEmpdep = document.querySelector("input[name='pmtDcm.pmtDcmRecEmpdep']");
	const recEmponepos = document.querySelector("input[name='pmtDcm.pmtDcmRecEmponepos']");

	
	// 값 설정
	const selectedText = recEmp.split(" ");
	const orgDep = selectedText[0].split("(")[0];
	const posNm = selectedText[0].split("(")[1].split("/")[0];
	
	recEmpnm.value = selectedText[1]; // 예시: 김철수
	recEmpdep.value = orgDep; // 예시: 과장
	recEmponepos.value = posNm; // 예시: 개발부서
	
	
	// 폼 데이터를 수집
    const formData = new FormData(dcmInsertForm); 

	formData.forEach((value, key) => {
	    console.log(`Key: ${key}, Value: ${value}`);
	});

    // FormData를 JSON 객체로 변환
    const jsonData = { pmtDcm: {}, atchFile: {} };
    formData.forEach((value, key) => {
	    const keys = key.split('.'); // `.`으로 키를 나누기
	
	    keys.reduce((acc, part, index) => {
	        if (index === keys.length - 1) {
	            acc[part] = value; // 마지막 키에 값 설정
	        } else {
	            if (!acc[part]) acc[part] = {}; // 객체가 없으면 생성
	            acc = acc[part]; // 다음 레벨로 이동
	        }
	        return acc;
	    }, jsonData);
	});

    // `pmtDcmVO`의 필드들을 `pmtDcm` 객체에 넣기
    jsonData.pmtDcm = jsonData.pmtDcm || {};

	 // `atchFile` 초기화
    jsonData.atchFile = { fileDetails: [] };

    //jsonData.pmtDcm.pmtDcmPrfEmpList = JSON.parse(jsonData.pmtDcmPrfEmpList || '[]');

	// 태그 정보가 있는 경우 jsonData에 추가
    const tagifyUserList = window.TagifyUserList ? window.TagifyUserList.value : [];
    jsonData.pmtDcmPrfEmpList = tagifyUserList;
	
	// JSON 데이터를 Blob으로 변환하여 `FormData`에 추가
	const jsonBlob = new Blob([JSON.stringify(jsonData)], { type: 'application/json' });
	
	const formDataWithFiles = new FormData();
	formDataWithFiles.append('jsonData', jsonBlob);
	
	// 파일 데이터 추가
	const fileInputs = dcmInsertForm.querySelectorAll('input[type="file"]');
	// FormData에 파일 데이터를 "atchFile"로 추가
	fileInputs.forEach(fileInput => {
        Array.from(fileInput.files).forEach(file => {
            jsonData.atchFile.fileDetails.push({
                uploadFile: file, // 실제 파일을 JSON 데이터에 추가하지 않음, FormData로 직접 추가
                // 다른 속성들 필요에 따라 추가 가능
            });
            formDataWithFiles.append('atchFile', file); // 파일을 atchFile로 추가
        });
    });

	formDataWithFiles.forEach((value, key) => {
	    console.log(`Key: ${key}, Value: ${value}`);
	});
	
	Swal.fire({
        title: '기안 처리하시겠습니까?',
        text: "기안을 처리전에 문서를 확인해 보세요.",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: '확인',
        cancelButtonText: '취소',
        customClass: {
            confirmButton: `btn btn-success me-3`,
            cancelButton: `btn btn-label-secondary me-3`,
        },
        reverseButtons: false
    }).then((result) => {
        if (result.isConfirmed) {
            // 사용자가 '확인' 버튼을 클릭한 경우 JSON 데이터를 서버로 전송
             fetch(e.target.action, { 
                method: 'POST',
                body: formDataWithFiles
            })
            .then(
				response => {
					console.log(`HTTP status code: ${response.status}`);
				    if (!response.ok) {
				        throw new Error(`Network response was not ok: ${response.statusText} (${response.status})`);
				    }
				    return response.json();
				}
			)
            .then(data => {
	
	
				if (data.status === 'success') {
			        Swal.fire({
			            title: '등록완료!',
			            text: '결재문서 등록이 완료되었습니다.',
			            icon: 'success',
			            confirmButtonText: '확인'
			        }).then(() => {
			            // 응답에 포함된 pmtDcmNo로 이동 ${contextPath}
			            window.location.href = `${contextPath}/gw/document/detail.do?what=${data.pmtDcmNo}`;
			        });
			    } else {
			        // success가 아닌 경우, 서버에서 예기치 않은 응답이 발생했습니다.
			        throw new Error('등록이 실패하였습니다.');
			    }
            })
            .catch((error) => {
				console.error('Fetch error:', error);
			    Swal.fire({
			        title: '등록실패',
			        text: error.message,
			        icon: 'error',
			        confirmButtonText: 'OK'
			    });
            });
        }
    });
});

document.addEventListener('DOMContentLoaded', function() {
    const addButton = document.getElementById('addApp');
    const appInputs = [
        document.getElementById('appInput2'),
        document.getElementById('appInput3'),
        document.getElementById('appInput4'),
        document.getElementById('appInput5')
    ];
    let currentIndex = 0;

    addButton.addEventListener('click', function() {
        if (currentIndex < appInputs.length) {	
			if( 
				(currentIndex > 0 && appInputs[currentIndex-1].querySelector('select').value)
				 ||
			 	(currentIndex == 0 && document.querySelector('#appInput1 select').value)
			 ){
	            appInputs[currentIndex].style.display = 'flex';
	            currentIndex++;
			}else{
				Myalter('error', '결재인원을 입력후 생성해주세요.');
			}
            if (currentIndex === appInputs.length) {
                addButton.setAttribute('style','display:none!important');
            }
        }
    });
	const addAtchButton = document.getElementById('addAtchBtn');
    const appAtchInputs = [
        document.getElementById('atch2'),
        document.getElementById('atch3'),
        document.getElementById('atch4'),
        document.getElementById('atch5')
    ];
    let current = 0;

    addAtchButton.addEventListener('click', function() {
        if (current < appAtchInputs.length) {	
            appAtchInputs[current].style.display = 'flex';
            current++;
            if (current === appAtchInputs.length) {
                addAtchButton.setAttribute('style','display:none!important');
            }
        }
    });
});
