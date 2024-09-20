/**
 * App Chat
 */

'use strict';

document.addEventListener('DOMContentLoaded', function () {
	const contextPath = document.body.dataset.contextPath;
  	let socket = null;  // WebSocket 변수를 전역으로 정의하여 여러 채팅방에서 사용할 수 있도록 수정
	let chatHistoryCache = {}; // 전역 변수로 채팅 기록을 캐시

    const chatContactsBody = document.querySelector('.app-chat-contacts .sidebar-body'),
      chatContactListItems = [].slice.call(
        document.querySelectorAll('.chat-contact-list-item:not(.chat-contact-list-item-title)')
      ),
      chatHistoryBody = document.querySelector('.chat-history-body'),
      chatSidebarLeftBody = document.querySelector('.app-chat-sidebar-left .sidebar-body'),
      chatSidebarRightBody = document.querySelector('.app-chat-sidebar-right .sidebar-body'),
      chatUserStatus = [].slice.call(document.querySelectorAll(".form-check-input[name='chat-user-status']")),
      chatSidebarLeftUserAbout = $('.chat-sidebar-left-user-about'),
      formSendMessage = document.querySelector('.form-send-message'),
      messageInput = document.querySelector('.message-input'),
      searchInput = document.querySelector('.chat-search-input'),
      speechToText = $('.speech-to-text'), // ! jQuery dependency for speech to text

      userStatusObj = {
        active: 'avatar-online',
        offline: 'avatar-offline',
        away: 'avatar-away',
        busy: 'avatar-busy'
      };


    // Chat contacts scrollbar
    if (chatContactsBody) {
      new PerfectScrollbar(chatContactsBody, {
        wheelPropagation: false,
        suppressScrollX: true
      });
    }

    // Chat history scrollbar
    if (chatHistoryBody) {
      new PerfectScrollbar(chatHistoryBody, {
        wheelPropagation: false,
        suppressScrollX: true
      });
    }

    // Sidebar left scrollbar
    if (chatSidebarLeftBody) {
      new PerfectScrollbar(chatSidebarLeftBody, {
        wheelPropagation: false,
        suppressScrollX: true
      });
    }

    // Sidebar right scrollbar
    if (chatSidebarRightBody) {
      new PerfectScrollbar(chatSidebarRightBody, {
        wheelPropagation: false,
        suppressScrollX: true
      });
    }

	// 페이지 로드 시 첫 번째 채팅방 자동 선택 및 웹소켓 연결
    if (chatContactListItems.length > 0) {
      const firstChatRoom = chatContactListItems[0];  // 첫 번째 채팅방을 선택
      firstChatRoom.classList.add('active');  // 해당 채팅방에 'active' 클래스 추가

      const chatRoomId = firstChatRoom.querySelector('a').getAttribute('data-room-id');
	  const chatRoomName = firstChatRoom.querySelector('.chat-contact-name').textContent;  // 첫 번째 채팅방 이름 가져오기

	  // 상단 레이아웃에 채팅방 이름 표시하기
      document.querySelector('.chat-room-header-name').textContent = chatRoomName;  // 채팅방 이름을 상단에 표시


      // WebSocket 연결 설정
      socket = new WebSocket(`ws://localhost${contextPath}/ws/chat/${chatRoomId}`);

      socket.onmessage = function (event) {
        try {
	          console.log("Raw WebSocket message data:", event.data);
	          const message = JSON.parse(event.data);
	          console.log("Received message:", message);
	          showMessage(message);  // 받은 메시지를 채팅창에 표시
			  chatHistoryCache[chatRoomId].push(message); // 추가한 메시지를 캐시에 저장
        } catch (e) {
          	  console.error("Received message is not valid JSON:", event.data);
        }
      };

      	// 페이지를 다시 로드해도 이전 채팅 기록이 사라지지 않도록 기록 캐싱
	    if (chatHistoryCache[chatRoomId]) {
	      updateChatHistory(chatHistoryCache[chatRoomId]);
	    } else {
	      fetchChatHistory(chatRoomId);
	    }
	  }

		// 창 크기 변경 이벤트 처리
	  window.addEventListener('resize', function () {
	    const activeChatRoom = document.querySelector('.chat-contact-list-item.active');
	    if (activeChatRoom) {
	      const chatRoomId = activeChatRoom.querySelector('a').getAttribute('data-room-id');

	      // 이전 기록이 있을 경우 다시 로드하지 않고 캐시된 기록 사용
	      if (chatHistoryCache[chatRoomId]) {
	        updateChatHistory(chatHistoryCache[chatRoomId]);
	      }
	    }
	  });



	// 채팅방을 클릭할 때마다 해당 채팅방 WebSocket 연결 및 채팅 기록 로드
    chatContactListItems.forEach(chatContactListItem => {
      chatContactListItem.addEventListener('click', e => {
        e.preventDefault();

        // 모든 항목에서 활성화 클래스 제거
        chatContactListItems.forEach(item => item.classList.remove('active'));
        // 현재 항목에 활성화 클래스 추가
        e.currentTarget.classList.add('active');

		// 클릭한 채팅방의 이름 가져오기
        const chatRoomName = e.currentTarget.querySelector('.chat-contact-name').textContent;

        // 상단 레이아웃에 채팅방 이름 표시하기
        document.querySelector('.chat-room-header-name').textContent = chatRoomName;



        // AJAX 요청으로 채팅 기록 로드
        const chatRoomId = e.currentTarget.querySelector('a').getAttribute('data-room-id');

		// 이전 WebSocket 연결이 있다면 닫기
		if (socket) {
			socket.close();
		}

		// 새로운 WebSocket 연결 설정 (채팅방 ID를 기반으로)
		socket = new WebSocket(`ws://localhost${contextPath}/ws/chat/${chatRoomId}`);

		// WebSocket에서 받은 메시지 처리하는 이벤트 부분
		socket.onmessage = function (event) {
			try {
				// 수신한 원본 데이터 로그 찍기
				console.log("Raw WebSocket message data:", event.data);

				const message = JSON.parse(event.data);  // 수신한 데이터를 JSON으로 파싱 시도
				console.log("Received message:", message);
				showMessage(message);  // 받은 메시지를 채팅창에 표시
			  	chatHistoryCache[chatRoomId].push(message); // 새로운 메시지가 들어올 때 캐시에 추가
			} catch (e){
				console.error("Received message is not valid JSON:", event.data);
        		// JSON 형식이 아닌 메시지를 처리할 때 필요한 다른 로직이 있으면 추가
			}
		};

//			 if (chatHistoryCache[chatRoomId]) {
//	        	updateChatHistory(chatHistoryCache[chatRoomId]);
//	      	} else {
	        	fetchChatHistory(chatRoomId);
//	      	}
	     });
	   });


	// 채팅 기록을 가져오는 AJAX 함수
    function fetchChatHistory(chatRoomId) {
      console.log("Fetching chat history for room ID:", chatRoomId);
      fetch(`${contextPath}/gw/chat/${chatRoomId}/history`)
        .then(response => response.json())
        .then(data => {
		  chatHistoryCache[chatRoomId] = data; // 채팅 기록을 캐시에 저장
          console.log("Chat history data:", data);
          updateChatHistory(data);
        })
        .catch(error => console.error('채팅 기록 로드 실패:', error));
    }


	// DOM을 업데이트하는 함수
    function updateChatHistory(messages) {
      chatHistoryBody.innerHTML = ''; // 기존 채팅 기록 지우기
      messages.forEach(showMessage);
		// 채팅 기록을 최신 메시지로 스크롤
      scrollToBottom();
    }


	// WebSocket을 통해 메시지를 전송할 때, 캐시에 기록을 추가
    formSendMessage.addEventListener('submit', e => {
        e.preventDefault();

        const message = messageInput.value.trim();  // 입력된 메시지 값
		const roomId = document.querySelector('.chat-contact-list-item.active a').getAttribute('data-room-id');  // 현재 채팅방 ID

        if (message && socket) {  // WebSocket 연결 상태 확인
			const msgLog = {
	            msglogContent: message,   // 실제 메시지 내용
	            msgrmNo: roomId,          // 채팅방 ID
	            msglogWtdate: new Date().toLocaleString('sv-SE', { timeZone: 'Asia/Seoul' }).replace(' ', 'T'),  // 메시지 작성 시간
				empNm: loggedInEmpNm, // 메시지 작성자의 이름 설정
        		empNo: loggedInEmpNo  // 메시지 작성자의 번호 설정
        };

		console.log('Sending message:', msgLog); // 디버깅용 로그 추가

		// WebSocket을 통해 메시지 전송
		socket.send(JSON.stringify(msgLog)); // WebSocket을 통해 메시지 전송

		// Fetch를 통해 서버에 메시지 저장요청
        fetch(`${contextPath}/gw/chat/${roomId}/send`, {
            method: 'POST',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify(msgLog)
        })
		.then(response => response.text())  // 'response.json()' 대신 'response.text()' 사용
        .then(data => {
			if (data === 'success') {
                // 서버 응답이 성공적일 때, 메시지 입력란 초기화
                console.log('Message sent successfully');
            }
        })
        .catch(error => {
            console.error('메시지 전송 실패:', error);
        })
        .finally(() => {
            // 성공 여부에 관계없이 메시지 입력란 초기화
            messageInput.value = '';
        });
    }
});

    //  WebSocket을 통해 받은 메시지를 채팅창에 표시하는 함수
    function showMessage(message) {
        const messageElement = document.createElement('li');
        messageElement.classList.add('chat-message');

		// 로그인한 직원 번호와 메시지 작성자의 직원 번호를 비교하여 본인 메시지인지 확인
    	const isMyMessage = message.empNo === loggedInEmpNo;

		// 메시지 스타일을 본인 메시지인지 아닌지에 따라 다르게 적용
	    if (isMyMessage) {
	        messageElement.classList.add('my-message'); // 본인이 보낸 메시지
	    } else {
	        messageElement.classList.add('other-message'); // 다른 사람이 보낸 메시지
	    }

		const messageDate = new Date(Date.parse(message.msglogWtdate));
	    const formattedDate = messageDate.toLocaleString('ko-KR', {
	      year: 'numeric',
	      month: '2-digit',
	      day: '2-digit',
	      hour: '2-digit',
	      minute: '2-digit',
	      second: '2-digit'  // 초까지 표시, 밀리초 제외
	    });

		// empNm이 제대로 출력되는지 확인하는 로그 추가
    	console.log("Displaying empNm in showMessage:", message.empNm);



		// 로그로 empNm이 어떻게 들어오는지 확인
    	console.log("Received empNm:", message.empNm);


		// 메시지 객체의 msglogContent 속성을 출력하도록 수정
        messageElement.innerHTML = `
	      <div class="chat-message-wrapper">
            <div class="chat-sender-name">
                <strong>${message.empNm || "알 수 없는 사용자"}</strong>
            </div>
            <div class="chat-message-text">
                <p class="mb-0">${message.msglogContent}</p>
            </div>
            <div class="text-muted mt-1">
                <small>${formattedDate}</small>
            </div>
        </div>
	    `;
	    document.querySelector('.chat-history-body').appendChild(messageElement);
	    scrollToBottom();
	}

    // Scroll to bottom function
    function scrollToBottom() {
      chatHistoryBody.scrollTo(0, chatHistoryBody.scrollHeight);
    }

	// 새 채팅방 생성 관련 기능 추가
    const TagifyUserListEl = document.querySelector('#TagifyUserList');
    const createChatRoomButton = document.querySelector('.create-chatroom-btn');
    const chatRoomNameInput = document.querySelector('#chatRoomName');

	// Tagify 인스턴스 초기화
	if (TagifyUserListEl) {
	    const TagifyUserList = new Tagify(TagifyUserListEl, {
	      tagTextProp: 'empNm',
	      enforceWhitelist: true,
	      skipInvalid: true,
	      placeholder: "그룹멤버를 선택해주세요",
	      dropdown: {
	        closeOnSelect: false,
	        enabled: 0,
	        classname: 'users-list',
	        maxItems: 100,
	        searchKeys: ['empNm', 'orgDep', 'posNm', 'onePosNm']
	      }
	    });
	} else {
    	console.error('TagifyUserListEl 요소가 존재하지 않습니다.');
	}


	// 직원 목록 불러오기
    async function loadInitialData() {
      try {
        const response = await fetch(`${contextPath}/gw/jsongroupemployee.do`);
        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`);
        }
        const data = await response.json();
        if (Array.isArray(data)) {
          const formattedData = data.map(item => ({
            value: item.empNo,
            empNm: item.empNm,
            orgDep: item.orgDep,
            posNm: item.posNm,
            onePosNm: item.onePosNm
          }));
          TagifyUserList.settings.whitelist = formattedData;
          TagifyUserList.loadWhitelist();
        }
      } catch (error) {
        console.error('Error loading employee data:', error);
      }
    }
    loadInitialData();

	// 채팅방 생성 버튼 클릭 이벤트
    createChatRoomButton.addEventListener('click', async function () {
      const selectedUsers = TagifyUserList.value;  // 선택된 사용자 정보
      const chatRoomName = chatRoomNameInput.value.trim(); // 입력된 채팅방 이름

      if (!chatRoomName || selectedUsers.length === 0) {
        alert('채팅방 이름과 멤버를 선택하세요!');
        return;
      }

      // 서버로 전송할 데이터
      const requestData = {
        chatRoomName: chatRoomName,
        members: selectedUsers.map(user => ({
          empNo: user.value // 직원 번호만 추출
        }))
      };

      try {
        const response = await fetch(`${contextPath}/gw/chat/createRoom`, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify(requestData)
        });

        const result = await response.json();

        if (response.ok && result.status === 'success') {
          alert('채팅방이 생성되었습니다.');
          location.reload(); // 새로 생성된 채팅방 목록을 로드
        } else {
          alert('채팅방 생성에 실패했습니다.');
        }
      } catch (error) {
        console.error('Error creating chat room:', error);
      }
    });


    // User About Maxlength Init
    if (chatSidebarLeftUserAbout.length) {
      chatSidebarLeftUserAbout.maxlength({
        alwaysShow: true,
        warningClass: 'label label-success bg-success text-white',
        limitReachedClass: 'label label-danger',
        separator: '/',
        validate: true,
        threshold: 120
      });
    }

    // Update user status
    chatUserStatus.forEach(el => {
      el.addEventListener('click', e => {
        let chatLeftSidebarUserAvatar = document.querySelector('.chat-sidebar-left-user .avatar'),
          value = e.currentTarget.value;
        //Update status in left sidebar user avatar
        chatLeftSidebarUserAvatar.removeAttribute('class');
        Helpers._addClass(
          'avatar avatar-xl chat-sidebar-avatar ' + userStatusObj[value] + '',
          chatLeftSidebarUserAvatar
        );
        //Update status in contacts sidebar user avatar
        let chatContactsUserAvatar = document.querySelector('.app-chat-contacts .avatar');
        chatContactsUserAvatar.removeAttribute('class');
        Helpers._addClass('flex-shrink-0 avatar ' + userStatusObj[value] + ' me-3', chatContactsUserAvatar);
      });
    });

    // Select chat or contact
    chatContactListItems.forEach(chatContactListItem => {
      // Bind click event to each chat contact list item
      chatContactListItem.addEventListener('click', e => {
        // Remove active class from chat contact list item
        chatContactListItems.forEach(chatContactListItem => {
          chatContactListItem.classList.remove('active');
        });
        // Add active class to current chat contact list item
        e.currentTarget.classList.add('active');
      });
    });

    // Filter Chats
    if (searchInput) {
      searchInput.addEventListener('keyup', e => {
        let searchValue = e.currentTarget.value.toLowerCase(),
          searchChatListItemsCount = 0,
          searchContactListItemsCount = 0,
          chatListItem0 = document.querySelector('.chat-list-item-0'),
          contactListItem0 = document.querySelector('.contact-list-item-0'),
          searchChatListItems = [].slice.call(
            document.querySelectorAll('#chat-list li:not(.chat-contact-list-item-title)')
          ),
          searchContactListItems = [].slice.call(
            document.querySelectorAll('#contact-list li:not(.chat-contact-list-item-title)')
          );

        // Search in chats
        searchChatContacts(searchChatListItems, searchChatListItemsCount, searchValue, chatListItem0);
        // Search in contacts
        searchChatContacts(searchContactListItems, searchContactListItemsCount, searchValue, contactListItem0);
      });
    }

    // Search chat and contacts function
    function searchChatContacts(searchListItems, searchListItemsCount, searchValue, listItem0) {
      searchListItems.forEach(searchListItem => {
        let searchListItemText = searchListItem.textContent.toLowerCase();
        if (searchValue) {
          if (-1 < searchListItemText.indexOf(searchValue)) {
            searchListItem.classList.add('d-flex');
            searchListItem.classList.remove('d-none');
            searchListItemsCount++;
          } else {
            searchListItem.classList.add('d-none');
          }
        } else {
          searchListItem.classList.add('d-flex');
          searchListItem.classList.remove('d-none');
          searchListItemsCount++;
        }
      });
      // Display no search fount if searchListItemsCount == 0
      if (searchListItemsCount == 0) {
        listItem0.classList.remove('d-none');
      } else {
        listItem0.classList.add('d-none');
      }
    }



    // on click of chatHistoryHeaderMenu, Remove data-overlay attribute from chatSidebarLeftClose to resolve overlay overlapping issue for two sidebar
    let chatHistoryHeaderMenu = document.querySelector(".chat-history-header [data-target='#app-chat-contacts']"),
      chatSidebarLeftClose = document.querySelector('.app-chat-sidebar-left .close-sidebar');
    chatHistoryHeaderMenu.addEventListener('click', e => {
      chatSidebarLeftClose.removeAttribute('data-overlay');
    });


    // Speech To Text
    if (speechToText.length) {
      var SpeechRecognition = SpeechRecognition || webkitSpeechRecognition;
      if (SpeechRecognition !== undefined && SpeechRecognition !== null) {
        var recognition = new SpeechRecognition(),
          listening = false;
        speechToText.on('click', function () {
          const $this = $(this);
          recognition.onspeechstart = function () {
            listening = true;
          };
          if (listening === false) {
            recognition.start();
          }
          recognition.onerror = function (event) {
            listening = false;
          };
          recognition.onresult = function (event) {
            $this.closest('.form-send-message').find('.message-input').val(event.results[0][0].transcript);
          };
          recognition.onspeechend = function (event) {
            listening = false;
            recognition.stop();
          };
        });
      }
    }
});
