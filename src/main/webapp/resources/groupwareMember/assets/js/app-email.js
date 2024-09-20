/**
 * App Email
 */

'use strict';

//document.addEventListener('DOMContentLoaded', function () {
  (function () {
    const emailList = document.querySelector('.email-list'),
      emailListItems = [].slice.call(document.querySelectorAll('.email-list-item')),
      emailListItemInputs = [].slice.call(document.querySelectorAll('.email-list-item-input')),
      emailView = document.querySelector('.app-email-view-content'),
      emailFilters = document.querySelector('.email-filters'),
      emailFilterByFolders = [].slice.call(document.querySelectorAll('.email-filter-folders li')),
//      emailEditor = document.querySelector('.email-editor'),
      appEmailSidebar = document.querySelector('.app-email-sidebar'),
      appOverlay = document.querySelector('.app-overlay'),
//      emailReplyEditor = document.querySelector('.email-reply-editor'),
      bookmarkEmail = [].slice.call(document.querySelectorAll('.email-list-item-bookmark')),
      selectAllEmails = document.getElementById('email-select-all'),
      emailSearch = document.querySelector('.email-search-input'),
      toggleCC = document.querySelector('.email-compose-toggle-cc'),
      toggleBCC = document.querySelector('.email-compose-toggle-bcc'),
      emailCompose = document.querySelector('.app-email-compose'),
      emailListDelete = document.querySelector('.email-list-delete'),
      emailListRead = document.querySelector('.email-list-read'),
      emailListEmpty = document.querySelector('.email-list-empty'),
      refreshEmails = document.querySelector('.email-refresh'),
      emailViewContainer = document.getElementById('app-email-view'),
      emailFilterFolderLists = [].slice.call(document.querySelectorAll('.email-filter-folders li')),
      emailListItemActions = [].slice.call(document.querySelectorAll('.email-list-item-actions li'));

	const send =  document.querySelector("#sendBtn"),
		sendMailBtn =  document.querySelector("#sendMailBtn"),
		saveMailBtn =  document.querySelector("#saveMailBtn"),
		mailFrom =document.querySelector("#mailFrom"),
		mailContent =document.querySelector("#mailContent"),
		mailDate =document.querySelector("#mailDate");

// 메일 전송 클릭시
	sendMailBtn.addEventListener("click",function(){

		Swal.fire({
                    icon: 'info',
                    title: '메일 전송하시겠습니까?',
                    showCancelButton: true,
                    confirmButtonText: '예',
                    cancelButtonText: '아니오',
                    confirmButtonColor: '#429f50',
                    cancelButtonColor: '#d33',

                }).then(result => {
                    if (result.isConfirmed) {	//예 -> DB에 반영
					//fetch로 다녀오기 mail 전송

		            const text = editor.getMarkdown();
					const mailTitle = document.querySelector("#email-subject");
					var emailAdd=[];
					$('#emailContacts option:selected').each(function(index,obj){

						var sendObj = obj.value+'_'+obj.innerText;
						emailAdd.push(sendObj);
						console.log(sendObj);
					})

						fetch("/connect/gw/sendMail.do", {
							method: "POST",
							headers: {
								'Content-Type': 'application/json'
							},
							body: JSON.stringify({
								add: emailAdd,
								title: mailTitle.value,
								content: text,
							}),
						}).then(res => {
							console.log(res.status);
						});

					location.href = "/connect/gw/gmail";
					}
				});
	})

// 임시저장 클릭시
	saveMailBtn.addEventListener("click",function(){

		Swal.fire({
                    icon: 'info',
                    title: '임시저장 하시겠습니까?',
                    text: '제목 및 내용만 저장됩니다.',
                    showCancelButton: true,
                    confirmButtonText: '예',
                    cancelButtonText: '아니오',
                    confirmButtonColor: '#429f50',
                    cancelButtonColor: '#d33',

                }).then(result => {
                    if (result.isConfirmed) {	//예 -> DB에 반영
					//fetch로 다녀오기 데이터 DB 반영
						fetch("/connect/gw/mail/save.do", {
							method: "POST",
							headers: {
								'Content-Type': 'application/json'
							},
							body: JSON.stringify({
								title: '제목',
								content: '내용'
							}),
						})
							.then(res => {
								console.log(res.status);
								console.log("돌아왔습니다. ")
							});
//                        location.href = routes.login
                    } else if (result.isDismissed) {
						 console.log("not ");
//                        location.href = routes.home
                    }

                })
		console.log("보 내기?");
	})



	  function sweet(text) {
		  Swal.fire({
			  icon: 'info',
			  title: text,
              confirmButtonText: '확인'
		  })
	  }


    // PerfectScrollbar 초기화
    // ------------------------------
    // 이메일 목록 스크롤바
    if (emailList) {
      let emailListInstance = new PerfectScrollbar(emailList, {
        wheelPropagation: false,
        suppressScrollX: true
      });
    }

    // 사이드바 필터 스크롤바
    if (emailFilters) {
      new PerfectScrollbar(emailFilters, {
        wheelPropagation: false,
        suppressScrollX: true
      });
    }

    // 이메일 보기 스크롤바
    if (emailView) {
      new PerfectScrollbar(emailView, {
        wheelPropagation: false,
        suppressScrollX: true
      });
    }

    // 이메일 북마크
    if (bookmarkEmail) {
      bookmarkEmail.forEach(emailItem => {
        emailItem.addEventListener('click', e => {
          let emailItem = e.currentTarget.parentNode.parentNode.parentNode;
          let starredAttr = emailItem.getAttribute('data-starred');
          e.stopPropagation();
          if (!starredAttr) {
            emailItem.setAttribute('data-starred', 'true');
          } else {
            emailItem.removeAttribute('data-starred');
          }
        });
      });
    }

    // 전체 선택
    if (selectAllEmails) {
      selectAllEmails.addEventListener('click', e => {
        if (e.currentTarget.checked) {
          emailListItemInputs.forEach(c => (c.checked = 1));
        } else {
          emailListItemInputs.forEach(c => (c.checked = 0));
        }
      });
    }

    // 개별 이메일 선택
    if (emailListItemInputs) {
      emailListItemInputs.forEach(emailListItemInput => {
        emailListItemInput.addEventListener('click', e => {
          e.stopPropagation();
          // 선택된 이메일 개수로 불완전 상태 리셋
          let emailListItemInputCount = 0;
          emailListItemInputs.forEach(emailListItemInput => {
            if (emailListItemInput.checked) {
              emailListItemInputCount++;
            }
          });

          if (emailListItemInputCount < emailListItemInputs.length) {
            if (emailListItemInputCount == 0) {
              selectAllEmails.indeterminate = false;
            } else {
              selectAllEmails.indeterminate = true;
            }
          } else {
            if (emailListItemInputCount == emailListItemInputs.length) {
              selectAllEmails.indeterminate = false;
              selectAllEmails.checked = true;
            } else {
              selectAllEmails.indeterminate = false;
            }
          }
        });
      });
    }

    // 이메일 검색
    if (emailSearch) {
      emailSearch.addEventListener('keyup', e => {
        let searchValue = e.currentTarget.value.toLowerCase(),
          searchEmailListItems = {},
          selectedFolderFilter = document.querySelector('.email-filter-folders .active').getAttribute('data-target');

        // 선택된 폴더에 따른 이메일 필터링
        if (selectedFolderFilter != 'inbox') {
          searchEmailListItems = [].slice.call(
            document.querySelectorAll('.email-list-item[data-' + selectedFolderFilter + '="true"]')
          );
        } else {
          searchEmailListItems = [].slice.call(document.querySelectorAll('.email-list-item'));
        }

        searchEmailListItems.forEach(searchEmailListItem => {
          let searchEmailListItemText = searchEmailListItem.textContent.toLowerCase();
          if (searchValue) {
            if (-1 < searchEmailListItemText.indexOf(searchValue)) {
              searchEmailListItem.classList.add('d-block');
            } else {
              searchEmailListItem.classList.add('d-none');
            }
          } else {
            searchEmailListItem.classList.remove('d-none');
          }
        });
      });
    }

    // 폴더 유형에 따른 필터링 (받은편지함, 발신함, 초안 등)
    emailFilterByFolders.forEach(emailFilterByFolder => {
      emailFilterByFolder.addEventListener('click', e => {
        let currentTarget = e.currentTarget,
          currentTargetData = currentTarget.getAttribute('data-target');

        appEmailSidebar.classList.remove('show');
        appOverlay.classList.remove('show');

        // 폴더 필터에서 활성화된 클래스 제거
        Helpers._removeClass('active', emailFilterByFolders);
        // 선택된 폴더 필터에 활성화 클래스 추가
        currentTarget.classList.add('active');
        emailListItems.forEach(emailListItem => {
          // 폴더 필터가 받은편지함인 경우
          if (currentTargetData == 'inbox') {
            emailListItem.classList.add('d-block');
            emailListItem.classList.remove('d-none');
          } else if (emailListItem.hasAttribute('data-' + currentTargetData)) {
            emailListItem.classList.add('d-block');
            emailListItem.classList.remove('d-none');
          } else {
            emailListItem.classList.add('d-none');
            emailListItem.classList.remove('d-block');
          }
        });
      });
    });

    // CC/BCC 입력 토글
    if (toggleBCC) {
      toggleBCC.addEventListener('click', e => {
        Helpers._toggleClass(document.querySelector('.email-compose-bcc'), 'd-block', 'd-none');
      });
    }

    if (toggleCC) {
      toggleCC.addEventListener('click', e => {
        Helpers._toggleClass(document.querySelector('.email-compose-cc'), 'd-block', 'd-none');
      });
    }

    // 이메일 작성 후 모달이 숨겨질 때 입력 초기화
    emailCompose.addEventListener('hidden.bs.modal', event => {
      document.querySelector('.email-editor .ql-editor').innerHTML = '';
      $('#emailContacts').val('');
      initSelect2();
    });

    // 다수 이메일 삭제
    if (emailListDelete) {
      emailListDelete.addEventListener('click', e => {
        emailListItemInputs.forEach(emailListItemInput => {
          if (emailListItemInput.checked) {
            emailListItemInput.parentNode.closest('li.email-list-item').remove();
          }
        });
        selectAllEmails.indeterminate = false;
        selectAllEmails.checked = false;
        var emailListItem = document.querySelectorAll('.email-list-item');
        if (emailListItem.length == 0) {
          emailListEmpty.classList.remove('d-none');
        }
      });
    }

    // 읽음으로 표시
    if (emailListRead) {
      emailListRead.addEventListener('click', e => {
        emailListItemInputs.forEach(emailListItemInput => {
          if (emailListItemInput.checked) {
            emailListItemInput.checked = false;
            emailListItemInput.parentNode.closest('li.email-list-item').classList.add('email-marked-read');
            let emailItemEnvelop = emailListItemInput.parentNode
              .closest('li.email-list-item')
              .querySelector('.email-list-item-actions li');

            if (Helpers._hasClass('email-read', emailItemEnvelop)) {
              emailItemEnvelop.classList.remove('email-read');
              emailItemEnvelop.classList.add('email-unread');
              emailItemEnvelop.querySelector('i').classList.remove('bx-envelope-open');
              emailItemEnvelop.querySelector('i').classList.add('bx-envelope');
            }
          }
        });
        selectAllEmails.indeterminate = false;
        selectAllEmails.checked = false;
      });
    }

    // 이메일 새로고침
    if (refreshEmails && emailList) {
      let emailListJq = $('.email-list'),
        emailListInstance = new PerfectScrollbar(emailList, {
          wheelPropagation: false,
          suppressScrollX: true
        });
      // ? BlockUI jQuery 의존성으로 인해 jQuery 변수 사용
      refreshEmails.addEventListener('click', e => {
        emailListJq.block({
          message: '<div class="spinner-border text-primary" role="status"></div>',
          timeout: 1000,
          css: {
            backgroundColor: 'transparent',
            border: '0'
          },
          overlayCSS: {
            backgroundColor: '#000',
            opacity: 0.1
          },
          onBlock: function () {
            emailListInstance.settings.suppressScrollY = true;
          },
          onUnblock: function () {
            emailListInstance.settings.suppressScrollY = false;
          }
        });
      });
    }

    // 이전 메시지
    // ? jQuery 애니메이션 의존성으로 인해 jQuery 변수 사용
    let earlierMsg = $('.email-earlier-msgs');
    if (earlierMsg.length) {
      earlierMsg.on('click', function () {
        let $this = $(this);
        $this.parents().find('.email-card-last').addClass('hide-pseudo');
        $this.next('.email-card-prev').slideToggle();
        $this.remove();
      });
    }

    // 이메일 연락처 (select2)
    // ? select2 jQuery 의존성으로 인해 jQuery 변수 사용
    let emailContacts = $('#emailContacts');
    function initSelect2() {
      if (emailContacts.length) {
        function renderContactsAvatar(option) {
          if (!option.id) {
            return option.text;
          }
          let $avatar =
            "<div class='d-flex flex-wrap align-items-center'>" +
            "<div class='avatar avatar-xs me-2 w-px-20 h-px-20'>" +
           /* "<img src='" +
            assetsPath +
            'img/avatars/' +
            $(option.element).data('avatar') +
            "' alt='avatar' class='rounded-circle' />" +*/
            '</div>' +
            option.text +
            '</div>';

          return $avatar;
        }
        emailContacts.wrap('<div class="position-relative"></div>').select2({
          placeholder: '값을 선택하세요',
          dropdownParent: emailContacts.parent(),
          closeOnSelect: false,
          templateResult: renderContactsAvatar,
          templateSelection: renderContactsAvatar,
          escapeMarkup: function (es) {
            return es;
          }
        });
      }
    }
    initSelect2();

    // 답장 클릭 시 스크롤 아래로 이동
    // ? jQuery 애니메이션 의존성으로 인해 jQuery 변수 사용
    let emailViewContent = $('.app-email-view-content');
    emailViewContent.find('.scroll-to-reply').on('click', function () {
      if (emailViewContent[0].scrollTop === 0) {
        emailViewContent.animate(
          {
            scrollTop: emailViewContent[0].scrollHeight
          },
          1500
        );
      }
    });

    // 이메일 필터 폴더 목록 클릭 시 보기 닫기
    if (emailFilterFolderLists) {
      emailFilterFolderLists.forEach(emailFilterFolderList => {
        emailFilterFolderList.addEventListener('click', e => {
          emailViewContainer.classList.remove('show');
        });
      });
    }

    // 이메일 목록 아이템 액션
    if (emailListItemActions) {
      emailListItemActions.forEach(emailListItemAction => {
        emailListItemAction.addEventListener('click', e => {
          e.stopPropagation();
          let currentTarget = e.currentTarget;
          if (Helpers._hasClass('email-delete', currentTarget)) {
            currentTarget.parentNode.closest('li.email-list-item').remove();
            var emailListItem = document.querySelectorAll('.email-list-item');
            if (emailListItem.length == 0) {
              emailListEmpty.classList.remove('d-none');
            }
          } else if (Helpers._hasClass('email-read', currentTarget)) {
            currentTarget.parentNode.closest('li.email-list-item').classList.add('email-marked-read');
            Helpers._toggleClass(currentTarget, 'email-read', 'email-unread');
            Helpers._toggleClass(currentTarget.querySelector('i'), 'bx-envelope-open', 'bx-envelope');
          } else if (Helpers._hasClass('email-unread', currentTarget)) {
            currentTarget.parentNode.closest('li.email-list-item').classList.remove('email-marked-read');
            Helpers._toggleClass(currentTarget, 'email-read', 'email-unread');
            Helpers._toggleClass(currentTarget.querySelector('i'), 'bx-envelope-open', 'bx-envelope');
          }
        });
      });
    }
  })();