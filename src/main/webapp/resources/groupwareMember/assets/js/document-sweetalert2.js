/**
 * Sweet Alerts
 */

'use strict';


// icon 종류
// success, error, warning, info, question
// 버튼 클릭 이벤트 예제

const ok = document.querySelector('#ok-btn');
const pre = document.querySelector('#pre-ok-btn');
const no = document.querySelector('#no-btn');
const proOk = document.querySelector('#process-ok-btn');

if (ok) {
  ok.onclick = function () {
	dynamicForm.action = `${document.body.dataset.contextPath}/gw/document/insert/app/ok`;
    Myalter('success', '승인 하시겠습니까?', '문서의 결재를 승인합니다.', 'success', '문서승인완료', '문서 승인을 완료하였습니다.', 'dynamicForm');
  };
}
if (pre) {
  pre.onclick = function () {
	dynamicForm.action = `${document.body.dataset.contextPath}/gw/document/insert/app/pre`;
    Myalter('success', '전결처리 하시겠습니까?', '문서를 전결 처리 합니다.', 'success', '전결처리완료', '전결 처리를 완료하였습니다.', 'dynamicForm');
  };
}
if (no) {
  no.onclick = function () {
	dynamicForm.action = `${document.body.dataset.contextPath}/gw/document/insert/app/no`;
    Myalter('error', '반려처리 하시겠습니까?', '문서를 반려 처리 합니다.', 'error', '반려처리완료', '반려 처리를 완료하였습니다.', 'dynamicForm');
  };
}
if(proOk){
	proOk.onclick = function(){
		recForm.action = `${document.body.dataset.contextPath}/gw/document/insert/rec/ok`;
		Myalter('success', '문서를 처리 완료하겠습니까?', '수신 받은 문서를 처리 완료합니다. ', 'success', '문서처리완료', '문서를 처리 완료하였습니다.', 'recForm');
	};
}