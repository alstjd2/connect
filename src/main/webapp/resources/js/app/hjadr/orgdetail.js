

document.addEventListener("DOMContentLoaded", function() {
	// 부모 요소에 이벤트 리스너를 붙여서 동적으로 생성된 .emp-info 요소를 타겟으로 합니다.
	document.body.addEventListener('click', function(event) {
		// 클릭된 요소에서 가장 가까운 .emp-info 요소를 찾습니다.
		var empInfoElement = event.target.closest('.emp-info');
		
		// 클릭된 요소와 찾아낸 .emp-info 요소를 콘솔에 출력합니다.
		console.log('Clicked element:', event.target);
		console.log('Closest .emp-info element:', empInfoElement);
		
		// 만약 .emp-info 요소를 찾았다면, 아래 로직을 실행합니다.
		if (empInfoElement) {
			var empNo = empInfoElement.getAttribute('data-emp-no');
			console.log('Employee Number:', empNo);
	
			fetch(`orgaddressDetail.do?what=${empNo}`)
				.then(response => response.text())
				.then(html => {
					const sidebarRight = document.getElementById('app-addr-sidebar-right');
					sidebarRight.innerHTML = html;
					sidebarRight.classList.add('active');
	
					const sidebarLeft = document.getElementById('app-addr-sidebar');
					if (sidebarLeft) {
						sidebarLeft.classList.add('active');
					}
					addCloseSidebarEvent();
					
					var colorClasses = ['success', 'danger', 'warning', 'info', 'dark', 'primary', 'secondary'];
			        var avatarInitial = document.querySelector('#app-addr-sidebar-right .avatar-initial');
			        var empNameElement = document.querySelector('#app-addr-sidebar-right .emp_name');
			        
			        console.log('avatarInitial:', avatarInitial);
			        console.log('empNameElement:', empNameElement);
			        
			        if (avatarInitial && empNameElement) {
			            // 이름의 첫 글자를 추출합니다.
			            var empName = empNameElement.textContent.trim();
			            if (empName) {
			                var firstLetter = empName.charAt(0);
			                avatarInitial.textContent = firstLetter;
			            }
			
			            // 랜덤 색상 클래스를 적용합니다.
			            var randomColorClass = colorClasses[Math.floor(Math.random() * colorClasses.length)];
			            avatarInitial.classList.add('bg-label-' + randomColorClass);
			        } else {
				
			        }
					
				})
				.catch(error => console.error('Error fetching details:', error));
		}
	});
});
function addCloseSidebarEvent() {
    const sidebarRight = document.getElementById('app-addr-sidebar-right');
    const closeIcons = document.getElementsByClassName('close-sidebar');
	const chatSidebarLeftClose = document.querySelector('#app-addr');
    const overlay = document.querySelector(".app-overlay");

    if (!sidebarRight || closeIcons.length === 0) {
        console.error("Sidebar or close icons not found after loading");
        return;
    }

    for (let i = 0; i < closeIcons.length; i++) {
        closeIcons[i].addEventListener('click', function() {
            console.log("Close sidebar clicked");
            console.log("Sidebar closed");
			chatSidebarLeftClose.classList.remove('layout-act');
            overlay.classList.remove('show');
        });
    }
}

