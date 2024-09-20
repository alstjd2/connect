/**
 * 
 */
function submitForm(actionType) {
    const contextPath = document.body.dataset.contextPath;
    var form = document.getElementById('todoCate');
    var actionUrl = "";

    if (actionType === 'update') {
        actionUrl = contextPath + '/gw/todoList/todoCateUpdate.do';
        Swal.fire({
            title: '수정하시겠습니까?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '예, 수정합니다!',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.isConfirmed) {
                form.action = actionUrl;
                form.submit();
            }
        });
    } else if (actionType === 'delete') {
        actionUrl = contextPath + '/gw/todoList/todoCateDelete.do';
        Swal.fire({
            title: '삭제하시겠습니까?',
            text: "이 작업은 되돌릴 수 없습니다!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '예, 삭제합니다!',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.isConfirmed) {
                form.action = actionUrl;
                form.submit();
            }
        });
    }
}