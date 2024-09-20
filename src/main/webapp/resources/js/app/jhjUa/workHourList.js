/**
 *
 */

document.addEventListener('DOMContentLoaded', function () {
    const toggleBtn = document.getElementById('toggleRows');
    const rows = document.querySelectorAll('.attendance-row');
    const itemsToShow = 8;  // 처음에 보이는 항목 수
    let isExpanded = false; // 더보기 상태를 추적

    function showInitialRows() {
        rows.forEach((row, index) => {
            if (index < itemsToShow) {
                row.classList.remove('d-none');
            } else {
                row.classList.add('d-none');
            }
        });
        toggleBtn.textContent = '+ 더보기';
        isExpanded = false;
    }

    function showAllRows() {
        rows.forEach(row => row.classList.remove('d-none'));
        toggleBtn.textContent = '- 닫기';
        isExpanded = true;
    }

    toggleBtn.addEventListener('click', function () {
        if (isExpanded) {
            showInitialRows();
        } else {
            showAllRows();
        }
    });

    // 초기 로드 시 처음 8개 항목만 표시
    showInitialRows();
});