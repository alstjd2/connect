/**
 * 
 */

/*function printContent() {
    var printContents = document.querySelector('main').innerHTML;
    var originalContents = document.body.innerHTML;

    // body의 내용을 교체
    document.body.innerHTML = printContents;

    // 인쇄
    window.print();

    // 원래 페이지 내용 복원
    document.body.innerHTML = originalContents;
}
function printContent() {
    var printContents = document.querySelector('main').innerHTML;
    var printWindow = window.open('', '', 'height=600,width=800');
    
    printWindow.document.write('<html><head><title>Print</title>');
    //printWindow.document.write('<style>body{font-family: Arial, sans-serif;}</style>');  // 스타일 추가
    printWindow.document.write('</head><body>');
    printWindow.document.write(printContents);
    printWindow.document.write('</body></html>');
    
    printWindow.document.close();
    printWindow.focus();
    
    // 프린트 창을 연 뒤 프린트 명령을 실행
    printWindow.print();
    
    // 프린트 후 창을 닫음
    printWindow.close();
}*/


document.querySelector('#print').addEventListener('click', function() {
    const cPath = document.body.dataset.contextPath;
    
    const data = document.querySelector('main').innerHTML;
    const title = document.querySelector('#title').innerText; // #title의 내용을 가져옴

    fetch(`${cPath}/gw/document/documentPrint.do`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: new URLSearchParams({
            data: data,
            title: title // 제목을 추가
        })
    })
    .then(response => response.text())
    .then(html => {
        const printWindow = window.open();
        printWindow.document.open();
        printWindow.document.write(html);
        printWindow.document.close();
        
        printWindow.onload = () => {
            printWindow.print(); // 페이지가 로드되면 프린트 창을 띄웁니다.
            setTimeout(() => {
                printWindow.close(); // 일정 시간 후에 창을 닫습니다.
            }, 0); 
        };
    })
    .catch(error => console.error('Error:', error));
});
