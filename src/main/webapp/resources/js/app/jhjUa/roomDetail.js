/**
 * 앱 간반 (Kanban)
 */

document.addEventListener('DOMContentLoaded', function(e) {
	const myOffcanvas = document.getElementById('offcanvasRight');
  if (myOffcanvas) { // Check if element exists
    myOffcanvas.addEventListener('show.bs.offcanvas', event => {
		let offcanvas = event.target;
		let offcanvasBody = offcanvas.querySelector(".offcanvas-body");
		console.log(event);
		let aTag = event.relatedTarget;
		let url = aTag.dataset.detailUrl;
		console.log(url);
		fetch(url, {
			headers: {
				"accept": "text/html"
			}
		}).then(resp => {
			if (resp.ok) {
				return resp.text();
			} else {
				throw new Error(`상태코드 : ${resp.status}, ${resp.statusText}`);
			}
		}).then((html) => {
			offcanvasBody.innerHTML = html
		}).catch(err => console.error(err));
	})
	}

	});


