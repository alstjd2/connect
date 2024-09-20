/**
 *
 */
//document.addEventListener('DOMContentLoaded', function () {
//    var contentDisplayed = false;
//	let content = document.querySelectorAll('.content-wrapper');
//    const contextPath = document.body.dataset.contextPath;
//
//    if (!content) {
//        Swal.fire({
//            icon: 'error',
//            title: '권한 없음',
//            text: '해당 내용을 볼 권한이 없습니다.'
//        }).then(() => {
//            // SweetAlert 확인 후 index 페이지로 이동
//            location.href = `${contextPath}/gw/index.do`;
//        });
//    }
//});

 document.addEventListener('DOMContentLoaded', function() {
 let contentWrapper = document.querySelector('.content-wrapper');
const contextPath = document.body.dataset.contextPath;
if (!contentWrapper || contentWrapper.innerHTML.trim() === '') {
            Swal.fire({
              icon: 'error',
              title: '권한 없음',
              text: '해당 내용을 볼 권한이 없습니다.'
            }).then(() => {
              // SweetAlert 확인 후 index 페이지로 이동
              location.href = `${contextPath}/gw/index.do`;
            });
          }
        });