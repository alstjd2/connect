document.addEventListener("DOMContentLoaded", () => {
	const calendarEl = document.querySelector('#calendar');
	const contextPath = document.body.dataset.contextPath;

	const calendarsColor = {
		company: 'warning',
		dep: 'success',
		employee: 'info'
	};

	const todoCode = document.querySelector('#todoCode');
	const selectAll = document.querySelector('.select-all');
	const filterInput = [].slice.call(document.querySelectorAll('.input-filter'));

	function selectedCalendars() {
		let selected = [];
		let filterInputChecked = [].slice.call(document.querySelectorAll('.input-filter:checked'));
		filterInputChecked.forEach(item => {
			selected.push(item.getAttribute('data-value'));
		});
		return selected;
	}

	const headerToolbar = {
		left: 'prevYear,prev,next,nextYear today',
		center: 'title',
		right: 'dayGridMonth,dayGridWeek,timeGridDay'
	}

	const calendarOption = {
		height: '700px',
		expandRows: true,
		slotMinTime: '09:00',
		slotMaxTime: '18:00',
		headerToolbar: headerToolbar,
		initialView: 'dayGridMonth',
		locale: 'ko',
		selectable: true,
		selectMirror: true,
		navLinks: true,
		weekNumbers: false,
		dayMaxEventRows: true,
		views: {
			dayGridMonth: {
				dayMaxEventRows: 2
			}
		},
		nowIndicator: true,
		eventSources: [
			{
				id: 'employee',
				url: `${contextPath}/gw/todoList/empCalendarList.do`,
			},
			{
				id: 'company',
				url: `${contextPath}/gw/todoList/comCalendarList.do`,
			},
			{
				id: 'dep',
				url: `${contextPath}/gw/todoList/depCalendarList.do`,
			}
		],
		locale: 'ko',
		eventClassNames: function({ event: calendarEvent }) {
			const colorName = calendarsColor[calendarEvent._def.extendedProps.calendar];
			return ['fc-event-' + colorName];
		}
	}

	let addEventSidebar = document.querySelector('#addEventSidebar');
	let eventTitle = document.querySelector('#eventTitle');
	let eventStartDate = document.querySelector('#eventStartDate');
	let eventEndDate = document.querySelector('#eventEndDate');
	let eventContent = document.querySelector('#eventContent');
	const bsAddEventSidebar = new bootstrap.Offcanvas(addEventSidebar);

	function disableFlatpickr() {
		if (eventStartDate) {
			eventStartDate.addEventListener('click', e => e.preventDefault());
		}
		if (eventEndDate) {
			eventEndDate.addEventListener('click', e => e.preventDefault());
		}
	}

	const calendar = new FullCalendar.Calendar(calendarEl, calendarOption);
	calendar.render();

	calendar.on("eventClick", info => {
		let eventToUpdate = info.event;
		bsAddEventSidebar.show();

		document.querySelector('#eventTitle').textContent = eventToUpdate.title;
		document.querySelector('#eventStartDate').textContent = formatDate(eventToUpdate.start, 'Y-m-d H:i');
		document.querySelector('#eventEndDate').textContent = eventToUpdate.end ? formatDate(eventToUpdate.end, 'Y-m-d H:i') : formatDate(eventToUpdate.start, 'Y-m-d H:i');
		document.querySelector('#eventContent').textContent = eventToUpdate.extendedProps.content;

		let todoText = '';
		let showEmpBtn = false;
		let showDepBtn = false;

		switch (eventToUpdate.extendedProps.calendar) {
			case 'employee':
				todoText = '내 일정';
				showEmpBtn = true;
				showDepBtn = false;
				break;
			case 'dep':
				todoText = '부서 일정';
				showEmpBtn = false;
				showDepBtn = true;
				break;
			case 'company':
				todoText = '회사 일정';
				showEmpBtn = false;
				showDepBtn = false;
				break;
			default:
				todoText = '알 수 없는 일정';
				showEmpBtn = false;
		}

		document.querySelector('#todoCode').textContent = todoText;

		const empBtn = document.querySelector('#empBtn');
		if (showEmpBtn) {
			empBtn.classList.remove('d-none');
		} else {
			empBtn.classList.add('d-none');
		}
		const depBtn = document.querySelector('#depBtn');
		if (showDepBtn) {
			depBtn.classList.remove('d-none');
		} else {
			depBtn.classList.add('d-none');
		}

		console.log("eClick:", info);
		console.log('Event: ', info.event.extendedProps);

		const updateButton = document.querySelector('#empBtn .btn-primary');
		if (updateButton) {
			updateButton.addEventListener('click', () => {
				const updateUrl = `${contextPath}/gw/todoList/caltodoListUpdate.do?what=${eventToUpdate.extendedProps.todoNo}`;
				window.location.href = updateUrl;
			});
		}
		const updateBtn = document.querySelector('#depBtn .btn-primary');
		if (updateBtn) {

			updateBtn.addEventListener('click', () => {
				window.location.href = `${contextPath}/gw/todoList/calDeptodoListUpdate.do?what=${eventToUpdate.extendedProps.todoNo}`;
			});
		}

		const deleteButton = document.querySelector('#empBtn .btn-danger');
		if (deleteButton) {
			deleteButton.addEventListener('click', () => {
				Swal.fire({
					title: '정말로 삭제하시겠습니까?',
					text: '이 작업은 취소할 수 없습니다!',
					icon: 'warning',
					showCancelButton: true,
					confirmButtonText: '삭제',
					cancelButtonText: '취소'
				}).then((result) => {
					if (result.isConfirmed) {
						const deleteUrl = `${contextPath}/gw/todoList/emptodoListDelete.do?todoNo=${eventToUpdate.extendedProps.todoNo}`;
						fetch(deleteUrl, {
							method: 'POST',
							headers: {
								'Content-Type': 'application/x-www-form-urlencoded'
							},
							body: new URLSearchParams({ todoNo: eventToUpdate.extendedProps.todoNo })
						})
							.then(response => response.json())
							.then(data => {
								if (data.success) {
									Swal.fire({
										title: '삭제 완료!',
										text: '일정이 성공적으로 삭제되었습니다.',
										icon: 'success',
										timer: 1500,
										showConfirmButton: false
									}).then(() => {
										// 오프캔버스 닫기 후 페이지 리디렉션
										bsAddEventSidebar.hide();
										setTimeout(() => {
											window.location.href = `${contextPath}/gw/todoList/calendar.do`;
										}, 300); // 300ms 지연
									});
								} else {
									Swal.fire('삭제 실패', '일정 삭제에 실패했습니다.', 'error');
								}
							})
							.catch(error => {
								console.error('Error:', error);
								Swal.fire('삭제 실패', '일정 삭제에 실패했습니다.', 'error');
							});
					}
				});
			});
		}
		const deleteBtn = document.querySelector('#depBtn .btn-danger');
		if (deleteBtn) {
			deleteBtn.addEventListener('click', () => {
				Swal.fire({
					title: '정말로 삭제하시겠습니까?',
					text: '이 작업은 취소할 수 없습니다!',
					icon: 'warning',
					showCancelButton: true,
					confirmButtonText: '삭제',
					cancelButtonText: '취소'
				}).then((result) => {
					if (result.isConfirmed) {
						const depdeleteUrl = `${contextPath}/gw/todoList/calDeptodoListDelete.do?todoNo=${eventToUpdate.extendedProps.todoNo}`;
						fetch(depdeleteUrl, {
							method: 'POST',
							headers: {
								'Content-Type': 'application/x-www-form-urlencoded'
							},
							body: new URLSearchParams({ todoNo: eventToUpdate.extendedProps.todoNo })
						})
							.then(response => {
								// Check if the response is in JSON format
								const contentType = response.headers.get('Content-Type');
								if (contentType && contentType.includes('application/json')) {
									return response.json();
								} else {
									throw new Error('Unexpected response format');
								}
							})
							.then(data => {
								if (data.success) {
									Swal.fire({
										title: '삭제 완료!',
										text: '일정이 성공적으로 삭제되었습니다.',
										icon: 'success',
										timer: 1500,
										showConfirmButton: false
									}).then(() => {
										bsAddEventSidebar.hide();
										setTimeout(() => {
											window.location.href = `${contextPath}/gw/todoList/calendar.do`;
										}, 300);
									});
								} else {
									Swal.fire('삭제 실패', '일정 삭제에 실패했습니다.', 'error');
								}
							})
							.catch(error => {
								console.error('Error:', error);
								Swal.fire('삭제 실패', '일정 삭제에 실패했습니다.', 'error');
							});
					}
				});
			});
		}
	});


	function formatDate(date, format = 'Y-m-d H:i') {
		return flatpickr.formatDate(date, format, 'ko');
	}

	calendar.on("dateClick", info => console.log("dateClick:", info));
	calendar.on("select", info => {
		console.log("체킁:", info);
	});

	function calendarAdd(value) {
		if (value == 'employee') {
			calendar.addEventSource({
				id: 'employee',
				url: `${contextPath}/gw/todoList/empCalendarList.do`
			});
		} else if (value == 'company') {
			calendar.addEventSource({
				id: 'company',
				url: `${contextPath}/gw/todoList/comCalendarList.do`
			});
		} else if (value == 'dep') {
			calendar.addEventSource({
				id: 'dep',
				url: `${contextPath}/gw/todoList/depCalendarList.do`
			});
		}
	}

	console.log(calendar.getEventSources(''));

	if (selectAll) {
		selectAll.addEventListener('click', e => {
			if (e.currentTarget.checked) {
				document.querySelectorAll('.input-filter').forEach(c => {
					if (!c.checked) calendarAdd(c.dataset.value);
					c.checked = 1;
				});
			} else {
				document.querySelectorAll('.input-filter').forEach(c => {
					let cVal = c.dataset.value;
					calendar.getEventSourceById(`${cVal}`).remove();
					c.checked = 0;
				});
			}
		});
	}

	if (filterInput) {
		filterInput.forEach(item => {
			item.addEventListener('click', () => {
				document.querySelectorAll('.input-filter:checked').length < document.querySelectorAll('.input-filter').length
					? (selectAll.checked = false)
					: (selectAll.checked = true);
				let calValue = item.dataset.value;
				if (item.checked) {
					calendarAdd(calValue);
				} else {
					calendar.getEventSourceById(`${calValue}`).remove();
				}
			});
		});
	}

	disableFlatpickr();
});
