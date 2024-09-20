/**
 *
 */
 const deleteButtons = document.querySelectorAll('.deleteButton');

        deleteButtons.forEach(button => {
            button.addEventListener('click', function () {
                const form = this.closest('form');

                Swal.fire({
                    title: '삭제하시겠습니까?',
                    text: "이 작업은 되돌릴 수 없습니다!",
                    icon: 'warning',
                    showCancelButton: false,
					showDenyButton: false,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '예, 삭제합니다!',
                    cancelButtonText: '취소'
                }).then((result) => {
                    if (result.isConfirmed) {
                        form.submit();
                    }
                });
            });
        });
