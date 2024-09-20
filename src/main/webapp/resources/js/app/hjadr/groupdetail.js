document.addEventListener("DOMContentLoaded", function() {
	document.querySelectorAll('.emp-info').forEach(function(element) {
		element.addEventListener('click', function() {
			
			var grpNo = this.getAttribute('data-grp-no');
			console.log(grpNo);
	
			fetch(`addressgroupDetail.do?what=${grpNo}`)
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
			        var avatarInitial2 = document.querySelector('#app-addr-sidebar-right .avatar-initial2');
			        var masterNameElement = document.querySelector('#app-addr-sidebar-right .master_name');
			        
			        console.log('avatarInitial:', avatarInitial);
			        console.log('empNameElement:', empNameElement);
			        console.log('avatarInitial2:', avatarInitial2);
			        console.log('masterNameElement:', masterNameElement);
			        
			        if (avatarInitial && empNameElement) {
			            var empName = empNameElement.textContent.trim();
			            if (empName) {
			                var firstLetter = empName.charAt(0);
			                avatarInitial.textContent = firstLetter;
			            }
			
			            var randomColorClass = colorClasses[Math.floor(Math.random() * colorClasses.length)];
			            avatarInitial.classList.add('bg-label-' + randomColorClass);
			        } else {
			        }
			        if (avatarInitial2 && masterNameElement) {
			            var masterName = masterNameElement.textContent.trim();
			            if (masterName) {
			                var firstLetter = masterName.charAt(0);
			                avatarInitial2.textContent = firstLetter;
			            }
			            var randomColorClass = colorClasses[Math.floor(Math.random() * colorClasses.length)];
			            avatarInitial2.classList.add('bg-label-' + randomColorClass);
			        } else {
			        }

					// 프로필 사진이 없는 멤버들을 반복해서 처리
					document.querySelectorAll('#app-addr-sidebar-right .avatar-initial3').forEach(function(avatarInitial) {
						var nameElement = avatarInitial.closest('li').querySelector('.member_name');
						if (nameElement) {
							var name = nameElement.textContent.trim();
							if (name) {
								var firstLetter = name.charAt(0);
								avatarInitial.textContent = firstLetter;
							}
						}
						var randomColorClass = colorClasses[Math.floor(Math.random() * colorClasses.length)];
						avatarInitial.classList.add('bg-label-' + randomColorClass);
					});
					
					
				
			        
					
				})
				.catch(error => console.error('Error fetching details:', error));
				
		});
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


