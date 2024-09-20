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
//document.querySelector('#print').addEventListener('click', function() {
//  // Create temporary print styles
//const data = document.querySelector('main').innerHTML;
//  const style = document.createElement('style');
//  style.textContent = `
//    @media print {
//      body { font-size: 12px; }
//      .no-print { display: none; }
//    }
//	@page {
//	    size: A4;
//	    margin: 1cm;
//	    margin-top: 2cm;
//	    margin-bottom: 2cm;
//	}
//  `;
//  document.head.appendChild(style);
//
//  // Select printable content (main element)
//  const printableContent = document.querySelector('main');
//
//  // Temporarily replace body content
//  const originalBody = document.body.innerHTML;
//  document.body.innerHTML = printableContent.innerHTML;
//
//  window.print();
//
//  // Restore original body content
//  document.body.innerHTML = originalBody;
//
//  // Remove temporary styles
//  document.head.removeChild(style);
//});



document.querySelector('#print').addEventListener('click', function() {
	const cPath = document.body.dataset.contextPath;

    const data = document.querySelector('main').innerHTML;
    //const url = `${cPath}//gw/document/documentPrint.do?data=${encodeURIComponent(data)}`;
    //window.location.href = url;

	 fetch(`${cPath}/gw/myInfo/applicationPrint.do`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: new URLSearchParams({
            data: data
        })
    })
    .then(response => response.text())
    .then(html => {
        // 새로운 창을 열어 프린트 페이지를 로드합니다.
        const printWindow = window.open();
        printWindow.document.open();
        printWindow.document.write(html);
        printWindow.document.close();
		printWindow.onload = () => {
            printWindow.print(); // 페이지가 로드되면 프린트 창을 띄웁니다.
            printWindow.onafterprint = () => {
                printWindow.close(); // 프린트 후 창을 닫습니다.
            };
        };
    })
    .catch(error => console.error('Error:', error));

});

