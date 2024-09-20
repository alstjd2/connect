/**
 * 
 */

document.addEventListener("DOMContentLoaded", function() {
	document.querySelectorAll('.emp-info').forEach(function(element) {
		element.addEventListener('click', function() {
			var adrNo = this.getAttribute('data-adr-no');
	
			fetch(`trashDetail.do?what=${adrNo}`)
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
