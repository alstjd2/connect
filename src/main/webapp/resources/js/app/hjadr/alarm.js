// WebSocket 이벤트 핸들러
function connectWebSocket() {
    const contextPath = document.body.dataset.contextPath; 
    const domainName = location.href.split("/")[2]; 
    let ws = new WebSocket(`ws://${domainName}${contextPath}/ws/notifications`);

    ws.onopen = function() {
//        console.log("Connected to WebSocket");
        updateBadge(); 
    };

    ws.onclose = function() {
//        console.log("WebSocket closed.");
    };

    ws.onmessage = function(event) {
        updateBadge(1); 
//        console.log("Message : " + event.data);
        updateBadge(1); 
        showToast(event.data);
        updateBadge(1); 
    };
}

connectWebSocket();

function showToast(message) {
    const toastContainer = document.getElementById('toast-container');
    const toastTemplate = document.getElementById('toast-template');

    const newToast = toastTemplate.cloneNode(true);
    newToast.id = ''; 
    newToast.querySelector('.toast-body').innerText = message;

    const bsToast = new bootstrap.Toast(newToast, { delay: 3000 });
    bsToast.show();

    toastContainer.appendChild(newToast);

    newToast.addEventListener('hidden.bs.toast', function () {
        newToast.remove();
    });
}

function formatDateTime(dateTimeArray) {
    if (!Array.isArray(dateTimeArray) || dateTimeArray.length < 5) {
        console.error('Invalid dateTime format:', dateTimeArray);
        return '';
    }

    const [year, month, day, hour, minute] = dateTimeArray;
    const date = new Date(year, month - 1, day, hour, minute);

    let yearStr = date.getFullYear();
    let monthStr = (date.getMonth() + 1).toString().padStart(2, '0');
    let dayStr = date.getDate().toString().padStart(2, '0');
    let hourStr = date.getHours().toString().padStart(2, '0');
    let minuteStr = date.getMinutes().toString().padStart(2, '0');

    let ampm = hourStr >= 12 ? '오후' : '오전';
    let hour12 = (hourStr % 12) || 12;

    return `${yearStr}-${monthStr}-${dayStr} ${ampm} ${hour12.toString().padStart(2, '0')}:${minuteStr}`;
}

function updateBadge() {
    fetch(`${contextPath}/gw/notifications`)
        .then(response => response.json())
        .then(data => {
            const badge = document.querySelector('.badge-notifications');
            const unreadCount = data.filter(notification => notification.alarmChk === 'N').length;
//            console.log("Unread Count:", unreadCount);
            if (unreadCount > 0) {
                badge.classList.add('bg-danger'); 
            } else {
                badge.classList.remove('bg-danger'); 
            }
        })
        .catch(error => console.error('Error fetching notifications:', error));
}

document.addEventListener("DOMContentLoaded", function() {
    document.querySelector('.dropdown-notifications').addEventListener('click', function() {
        fetch(`${contextPath}/gw/notifications`)
            .then(response => response.json())
            .then(data => {
                let notificationsList = document.querySelector('.dropdown-notifications-list ul');
                notificationsList.innerHTML = ''; 

                const badge = document.querySelector('.badge.bg-label-primary');
                const newCount = data.length > 0 ? data[0].newCount : 0;

                if (newCount > 0) {
                    badge.textContent = `${newCount} New`;
                    badge.classList.add('bg-danger');
                } else {
                    badge.textContent = '';
                    badge.classList.remove('bg-danger');
                }

                if (data.length === 0) {
                    const noNotificationsMessage = document.createElement('li');
                    noNotificationsMessage.className = 'list-group-item';
                    noNotificationsMessage.textContent = '알림이 없습니다.';
                    notificationsList.appendChild(noNotificationsMessage);
                } else {
                    data.forEach(notification => {
                        let iconHtml = '';

                        switch(String(notification.alarmCode)) {
                            case '1':
                                iconHtml = '<i class=" tf-icons bx bx-clipboard"></i>';
                                break;
                            case '2':
                                iconHtml = '<i class="tf-icons bx bx-spreadsheet"></i>';
                                break;
                            case '3':
                                iconHtml = '<i class="tf-icons bx bxs-user-detail"></i>';
                                break;
                            case '4':
                                iconHtml = '<i class="tf-icons bx bx-chat"></i>';
                                break;
                            case '5':
                                iconHtml = '<i class="tf-icons bx bx-message-square-check"></i>';
                                break;
                            case '6':
                                iconHtml = '<i class="tf-icons bx bx-calendar-check"></i>';
                                break;
                            case '7':
                                iconHtml = '<i class="tf-icons bx bx-group"></i>';
                                break;
                            case '8':
                                iconHtml = '<i class="tf-icons bx bx-group"></i>';
                                break;
                            case '9':
                                iconHtml = '<i class="tf-icons bx bx-user"></i>';
                                break;
                            case '11':
                                iconHtml = '<i class="tf-icons bx bx-envelope"></i>';
                                break;
                            default:
                                iconHtml = '<i class="tf-icons bx bx-bell"></i>';
                        }

                        let formattedDate = formatDateTime(notification.alarmDate);

                        let listItem = document.createElement('li');
                        listItem.className = `list-group-item list-group-item-action dropdown-notifications-item ${notification.alarmChk === 'Y' ? 'marked-as-read' : ''}`;
                        listItem.innerHTML = `
                            <div class="d-flex">
                                <div class="flex-shrink-0 me-3">
                                    <div class="avatar">
                                        <span class="avatar-initial rounded-circle bg-label-primary">
                                            ${iconHtml}
                                        </span>
                                    </div>
                                </div>
                                <div class="flex-grow-1">
                                    <a href="javascript:void(0)" class="notification-link text-decoration-none" data-alarm-no="${notification.alarmNo}" data-alarm-link="${contextPath}/${notification.alarmLink}">
                                        <h6 class="small mb-0">${notification.alarmHeader}</h6>
                                        <small class="mb-1 d-block text-body">${notification.alarmComncode}</small>
                                        <small class="text-muted">${formattedDate}</small>
                                    </a>
                                </div>
                                <div class="flex-shrink-0 dropdown-notifications-actions">
                                    <a href="javascript:void(0)" class="dropdown-notifications-read"><span class="badge badge-dot"></span></a>
                                    <a href="javascript:void(0)" class="dropdown-notifications-archive"  data-alarm-no="${notification.alarmNo}"><span class="bx bx-x"></span></a>
                                </div>
                            </div>
                        `;
                        notificationsList.appendChild(listItem);
                    });

                    // 삭제 버튼 클릭 이벤트 처리
                    document.querySelectorAll('.dropdown-notifications-archive').forEach(function(element) {
                        element.addEventListener('click', function() {
                            const alarmNo = this.getAttribute('data-alarm-no');
                            deleteNotification(alarmNo, this);
                        });
                    });

                    // 알림 링크 클릭 이벤트 처리
                    document.querySelectorAll('.notification-link').forEach(function(element) {
                        element.addEventListener('click', function() {
                            const alarmNo = this.getAttribute('data-alarm-no');
                            const alarmLink = this.getAttribute('data-alarm-link');
//                            if (confirm('해당 페이지로 이동하시겠습니까?')) {
//                                markNotificationAsRead(alarmNo, alarmLink);
//                            }
							 Swal.fire({
                                title: '해당 페이지로 이동하시겠습니까?',
                                text: "확인 후 페이지가 이동됩니다.",
                                icon: 'question',
                                showCancelButton: true,
                                confirmButtonColor: '#3085d6',
                                cancelButtonColor: '#BDBDBD',
                                confirmButtonText: '확인',
                                cancelButtonText: '취소',
                                position: 'top-center'
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    markNotificationAsRead(alarmNo, alarmLink);
                                }
                            });
                        });
                    });
                }
            })
            .catch(error => console.error('Error fetching notifications:', error));
    });
});

function deleteNotification(alarmNo) {
    fetch(`${contextPath}/gw/notificationsDelete/${alarmNo}`, {
        method: 'DELETE'
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('정상적으로 알림을 삭제하지 못했습니다');
        }
        return response.json();
    })
    .then(data => {
        if (data.success) {
			updateBadge(); 
            // 알림 삭제 후 UI 업데이트 로직 추가
        } else {
            console.error('정상적으로 알림을 삭제하지 못했습니다');
        }
    })
    .catch(error => {
        console.error('정상적으로 알림을 삭제하지 못했습니다 :', error);
    });
}

function markNotificationAsRead(alarmNo, alarmLink) {
    fetch(`${contextPath}/gw/notificationsRead/${alarmNo}`, {
        method: 'POST'
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('정상적으로 알림을 읽지 못했습니다');
        }
        return response.json();
    })
    .then(data => {
        if (data.success) {
            window.location.href = alarmLink; // 알림을 읽음 처리한 후 페이지 이동
        } else {
            console.error('정상적으로 알림을 읽지 못했습니다');
        }
    })
    .catch(error => {
        console.error('정상적으로 알림을 읽지 못했습니다 : ', error);
    });
}
