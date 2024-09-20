/**
 * 앱 간반 (Kanban)
 */

'use strict';

(async function () {
  let boards;
  const kanbanSidebar = document.querySelector('.kanban-update-item-sidebar'),
    kanbanWrapper = document.querySelector('.kanban-wrapper'),
    commentEditor = document.querySelector('.comment-editor'),
    kanbanAddNewBoard = document.querySelector('.kanban-add-new-board'),
    kanbanAddNewInput = [].slice.call(document.querySelectorAll('.kanban-add-board-input')),
    kanbanAddBoardBtn = document.querySelector('.kanban-add-board-btn'),
    datePicker = document.querySelector('#due-date'),
    select2 = $('.select2'), // ! select2 jQuery 의존성으로 인해 jQuery 변수를 사용합니다.
    assetsPath = document.querySelector('html').getAttribute('data-assets-path');

  // 간반 오프캔버스 초기화
  const kanbanOffcanvas = new bootstrap.Offcanvas(kanbanSidebar);

  // 간반 데이터 가져오기
  const kanbanResponse = await fetch(assetsPath + 'json/kanban.json');
  if (!kanbanResponse.ok) {
    console.error('오류', kanbanResponse);
  }
  boards = await kanbanResponse.json();

  // 날짜 선택기 초기화
  if (datePicker) {
    datePicker.flatpickr({
      monthSelectorType: 'static',
      altInput: true,
      altFormat: 'j F, Y',
      dateFormat: 'Y-m-d'
    });
  }

  //! TODO: select2가 jQuery 의존성을 제거할 때 이벤트 레이블과 게스트 코드를 JS로 업데이트
  // select2
  if (select2.length) {
    function renderLabels(option) {
      if (!option.id) {
        return option.text;
      }
      var $badge = "<div class='badge " + $(option.element).data('color') + "'> " + option.text + '</div>';
      return $badge;
    }

    select2.each(function () {
      var $this = $(this);
      $this.wrap("<div class='position-relative'></div>").select2({
        placeholder: '레이블 선택',
        dropdownParent: $this.parent(),
        templateResult: renderLabels,
        templateSelection: renderLabels,
        escapeMarkup: function (es) {
          return es;
        }
      });
    });
  }

  // 댓글 편집기
  if (commentEditor) {
    new Quill(commentEditor, {
      modules: {
        toolbar: '.comment-toolbar'
      },
      placeholder: '댓글을 작성하세요... ',
      theme: 'snow'
    });
  }

  // 보드 드롭다운 렌더링
  function renderBoardDropdown() {
    return (
      "<div class='dropdown'>" +
      "<i class='dropdown-toggle bx bx-dots-vertical-rounded cursor-pointer' id='board-dropdown' data-bs-toggle='dropdown' aria-haspopup='true' aria-expanded='false'></i>" +
      "<div class='dropdown-menu dropdown-menu-end' aria-labelledby='board-dropdown'>" +
      "<a class='dropdown-item delete-board' href='javascript:void(0)'> <i class='bx bx-trash bx-xs' me-1></i> <span class='align-middle'>삭제</span></a>" +
      "<a class='dropdown-item' href='javascript:void(0)'><i class='bx bx-rename bx-xs' me-1></i> <span class='align-middle'>이름 변경</span></a>" +
      "<a class='dropdown-item' href='javascript:void(0)'><i class='bx bx-archive bx-xs' me-1></i> <span class='align-middle'>보관</span></a>" +
      '</div>' +
      '</div>'
    );
  }
  // 항목 드롭다운 렌더링
  function renderDropdown() {
    return (
      "<div class='dropdown kanban-tasks-item-dropdown'>" +
      "<i class='dropdown-toggle bx bx-dots-vertical-rounded' id='kanban-tasks-item-dropdown' data-bs-toggle='dropdown' aria-haspopup='true' aria-expanded='false'></i>" +
      "<div class='dropdown-menu dropdown-menu-end' aria-labelledby='kanban-tasks-item-dropdown'>" +
      "<a class='dropdown-item' href='javascript:void(0)'>작업 링크 복사</a>" +
      "<a class='dropdown-item' href='javascript:void(0)'>작업 복제</a>" +
      "<a class='dropdown-item delete-task' href='javascript:void(0)'>삭제</a>" +
      '</div>' +
      '</div>'
    );
  }
  // 헤더 렌더링
  function renderHeader(color, text) {
    return (
      "<div class='d-flex justify-content-between flex-wrap align-items-center mb-2'>" +
      "<div class='item-badges'> " +
      "<div class='badge bg-label-" +
      color +
      "'> " +
      text +
      '</div>' +
      '</div>' +
      renderDropdown() +
      '</div>'
    );
  }

  // 아바타 렌더링
  function renderAvatar(images, pullUp, size, margin, members) {
    var $transition = pullUp ? ' pull-up' : '',
      $size = size ? 'avatar-' + size + '' : '',
      member = members == undefined ? ' ' : members.split(',');

    return images == undefined
      ? ' '
      : images
          .split(',')
          .map(function (img, index, arr) {
            var $margin = margin && index !== arr.length - 1 ? ' me-' + margin + '' : '';

            return (
              "<div class='avatar " +
              $size +
              $margin +
              "'" +
              "data-bs-toggle='tooltip' data-bs-placement='top'" +
              "title='" +
              member[index] +
              "'" +
              '>' +
              "<img src='" +
              assetsPath +
              'img/avatars/' +
              img +
              "' alt='Avatar' class='rounded-circle " +
              $transition +
              "'>" +
              '</div>'
            );
          })
          .join(' ');
  }

  // 푸터 렌더링
  function renderFooter(attachments, comments, assigned, members) {
    return (
      "<div class='d-flex justify-content-between align-items-center flex-wrap mt-2'>" +
      "<div class='d-flex'> <span class='d-flex align-items-center me-2'><i class='bx bx-paperclip me-1'></i>" +
      "<span class='attachments'>" +
      attachments +
      '</span>' +
      "</span> <span class='d-flex align-items-center ms-2'><i class='bx bx-chat me-1'></i>" +
      '<span> ' +
      comments +
      ' </span>' +
      '</span></div>' +
      "<div class='avatar-group d-flex align-items-center assigned-avatar'>" +
      renderAvatar(assigned, true, 'xs', null, members) +
      '</div>' +
      '</div>'
    );
  }
  // 간반 초기화
  const kanban = new jKanban({
    element: '.kanban-wrapper',
    gutter: '12px',
    widthBoard: '250px',
    dragItems: true,
    boards: boards,
    dragBoards: true,
    addItemButton: true,
    buttonContent: '+ 항목 추가',
    itemAddOptions: {
      enabled: true, // 보드에 항목을 쉽게 추가할 수 있는 버튼 추가
      content: '+ 새 항목 추가', // 보드 버튼의 텍스트 또는 HTML 콘텐츠
      class: 'kanban-title-button btn btn-default', // 버튼의 기본 클래스
      footer: false // 버튼을 푸터에 배치
    },
    click: function (el) {
      let element = el;
      let title = element.getAttribute('data-eid')
          ? element.querySelector('.kanban-text').textContent
          : element.textContent,
        date = element.getAttribute('data-due-date'),
        dateObj = new Date(),
        year = dateObj.getFullYear(),
        dateToUse = date
          ? date + ', ' + year
          : dateObj.getDate() + ' ' + dateObj.toLocaleString('en', { month: 'long' }) + ', ' + year,
        label = element.getAttribute('data-badge-text'),
        avatars = element.getAttribute('data-assigned');

      // 간반 오프캔버스 표시
      kanbanOffcanvas.show();

      // 사이드바에 데이터 추가
      kanbanSidebar.querySelector('#title').value = title;
      kanbanSidebar.querySelector('#due-date').nextSibling.value = dateToUse;

      // ! select2 의존성으로 인해 jQuery 방법을 사용하여 사이드바 데이터 가져오기
      $('.kanban-update-item-sidebar').find(select2).val(label).trigger('change');

      // 할당된 항목 및 업데이트
      kanbanSidebar.querySelector('.assigned').innerHTML = '';
      kanbanSidebar
        .querySelector('.assigned')
        .insertAdjacentHTML(
          'afterbegin',
          renderAvatar(avatars, false, 'xs', '1', el.getAttribute('data-members')) +
            "<div class='avatar avatar-xs ms-1'>" +
            "<span class='avatar-initial rounded-circle bg-label-secondary'><i class='bx bx-plus bx-xs text-heading'></i></span>" +
            '</div>'
        );
    },

    buttonClick: function (el, boardId) {
      const addNew = document.createElement('form');
      addNew.setAttribute('class', 'new-item-form');
      addNew.innerHTML =
        '<div class="mb-4">' +
        '<textarea class="form-control add-new-item" rows="2" placeholder="내용 추가" autofocus required></textarea>' +
        '</div>' +
        '<div class="mb-4">' +
        '<button type="submit" class="btn btn-primary btn-sm me-4">추가</button>' +
        '<button type="button" class="btn btn-label-secondary btn-sm cancel-add-item">취소</button>' +
        '</div>';
      kanban.addForm(boardId, addNew);

      addNew.addEventListener('submit', function (e) {
        e.preventDefault();
        const currentBoard = [].slice.call(
          document.querySelectorAll('.kanban-board[data-id=' + boardId + '] .kanban-item')
        );
        kanban.addElement(boardId, {
          title: "<span class='kanban-text'>" + e.target[0].value + '</span>',
          id: boardId + '-' + currentBoard.length + 1
        });

        // 새 보드에서 드롭다운 추가
        const kanbanText = [].slice.call(
          document.querySelectorAll('.kanban-board[data-id=' + boardId + '] .kanban-text')
        );
        kanbanText.forEach(function (e) {
          e.insertAdjacentHTML('beforebegin', renderDropdown());
        });

        // 새 작업의 드롭다운 버튼 클릭 시 사이드바 열리지 않도록 방지
        const newTaskDropdown = [].slice.call(document.querySelectorAll('.kanban-item .kanban-tasks-item-dropdown'));
        if (newTaskDropdown) {
          newTaskDropdown.forEach(function (e) {
            e.addEventListener('click', function (el) {
              el.stopPropagation();
            });
          });
        }

        // 새 보드의 작업 삭제
        const deleteTask = [].slice.call(
          document.querySelectorAll('.kanban-board[data-id=' + boardId + '] .delete-task')
        );
        deleteTask.forEach(function (e) {
          e.addEventListener('click', function () {
            const id = this.closest('.kanban-item').getAttribute('data-eid');
            kanban.removeElement(id);
          });
        });
        addNew.remove();
      });

      // 취소 버튼 클릭 시 폼 제거
      addNew.querySelector('.cancel-add-item').addEventListener('click', function (e) {
        addNew.remove();
      });
    }
  });

  // 간반 래퍼 스크롤바
  if (kanbanWrapper) {
    new PerfectScrollbar(kanbanWrapper);
  }

  const kanbanContainer = document.querySelector('.kanban-container'),
    kanbanTitleBoard = [].slice.call(document.querySelectorAll('.kanban-title-board')),
    kanbanItem = [].slice.call(document.querySelectorAll('.kanban-item'));

  // 사용자 정의 항목 렌더링
  if (kanbanItem) {
    kanbanItem.forEach(function (el) {
      const element = "<span class='kanban-text'>" + el.textContent + '</span>';
      let img = '';
      if (el.getAttribute('data-image') !== null) {
        img =
          "<img class='img-fluid rounded mb-2' src='" +
          assetsPath +
          'img/elements/' +
          el.getAttribute('data-image') +
          "'>";
      }
      el.textContent = '';
      if (el.getAttribute('data-badge') !== undefined && el.getAttribute('data-badge-text') !== undefined) {
        el.insertAdjacentHTML(
          'afterbegin',
          renderHeader(el.getAttribute('data-badge'), el.getAttribute('data-badge-text')) + img + element
        );
      }
      if (
        el.getAttribute('data-comments') !== undefined ||
        el.getAttribute('data-due-date') !== undefined ||
        el.getAttribute('data-assigned') !== undefined
      ) {
        el.insertAdjacentHTML(
          'beforeend',
          renderFooter(
            el.getAttribute('data-attachments'),
            el.getAttribute('data-comments'),
            el.getAttribute('data-assigned'),
            el.getAttribute('data-members')
          )
        );
      }
    });
  }

  // 렌더링된 항목에 툴팁 초기화
  const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
  tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl);
  });

  // 작업의 드롭다운 버튼 클릭 시 사이드바 열리지 않도록 방지
  const tasksItemDropdown = [].slice.call(document.querySelectorAll('.kanban-tasks-item-dropdown'));
  if (tasksItemDropdown) {
    tasksItemDropdown.forEach(function (e) {
      e.addEventListener('click', function (el) {
        el.stopPropagation();
      });
    });
  }

  // 새 항목 추가 버튼 및 작업 토글
  if (kanbanAddBoardBtn) {
    kanbanAddBoardBtn.addEventListener('click', () => {
      kanbanAddNewInput.forEach(el => {
        el.value = '';
        el.classList.toggle('d-none');
      });
    });
  }

  // 보드와 함께 새 항목 렌더링
  if (kanbanContainer) {
    kanbanContainer.appendChild(kanbanAddNewBoard);
  }

  // 렌더링된 보드의 제목을 편집 가능하게 만들기
  if (kanbanTitleBoard) {
    kanbanTitleBoard.forEach(function (elem) {
      elem.addEventListener('mouseenter', function () {
        this.contentEditable = 'true';
      });

      // 제목 옆에 삭제 아이콘 추가
      elem.insertAdjacentHTML('afterend', renderBoardDropdown());
    });
  }

  // 렌더링된 보드 삭제
  const deleteBoards = [].slice.call(document.querySelectorAll('.delete-board'));
  if (deleteBoards) {
    deleteBoards.forEach(function (elem) {
      elem.addEventListener('click', function () {
        const id = this.closest('.kanban-board').getAttribute('data-id');
        kanban.removeBoard(id);
      });
    });
  }

  // 렌더링된 작업 삭제
  const deleteTask = [].slice.call(document.querySelectorAll('.delete-task'));
  if (deleteTask) {
    deleteTask.forEach(function (e) {
      e.addEventListener('click', function () {
        const id = this.closest('.kanban-item').getAttribute('data-eid');
        kanban.removeElement(id);
      });
    });
  }

  // 새 보드 추가 취소 버튼
  const cancelAddNew = document.querySelector('.kanban-add-board-cancel-btn');
  if (cancelAddNew) {
    cancelAddNew.addEventListener('click', function () {
      kanbanAddNewInput.forEach(el => {
        el.classList.toggle('d-none');
      });
    });
  }

  // 새 보드 추가
  if (kanbanAddNewBoard) {
    kanbanAddNewBoard.addEventListener('submit', function (e) {
      e.preventDefault();
      const thisEle = this,
        value = thisEle.querySelector('.form-control').value,
        id = value.replace(/\s+/g, '-').toLowerCase();
      kanban.addBoards([
        {
          id: id,
          title: value
        }
      ]);

      // 새 보드에 삭제 옵션 추가, 새 보드 삭제 및 데이터 순서 업데이트
      const kanbanBoardLastChild = document.querySelectorAll('.kanban-board:last-child')[0];
      if (kanbanBoardLastChild) {
        const header = kanbanBoardLastChild.querySelector('.kanban-title-board');
        header.insertAdjacentHTML('afterend', renderBoardDropdown());

        // 새로 추가된 보드 제목을 편집 가능하게 만듭니다
        kanbanBoardLastChild.querySelector('.kanban-title-board').addEventListener('mouseenter', function () {
          this.contentEditable = 'true';
        });
      }

      // 새 보드 삭제 이벤트 추가
      const deleteNewBoards = kanbanBoardLastChild.querySelector('.delete-board');
      if (deleteNewBoards) {
        deleteNewBoards.addEventListener('click', function () {
          const id = this.closest('.kanban-board').getAttribute('data-id');
          kanban.removeBoard(id);
        });
      }

      // 현재 추가된 새 항목 폼 제거
      if (kanbanAddNewInput) {
        kanbanAddNewInput.forEach(el => {
          el.classList.add('d-none');
        });
      }

      // 새 항목 추가 버튼을 클릭한 후 인라인 추가 버튼 위치 조정
      if (kanbanContainer) {
        kanbanContainer.appendChild(kanbanAddNewBoard);
      }
    });
  }

  // 사이드바 닫을 때 댓글 편집기 지우기
  kanbanSidebar.addEventListener('hidden.bs.offcanvas', function () {
    kanbanSidebar.querySelector('.ql-editor').firstElementChild.innerHTML = '';
  });

  // 오프캔버스가 열릴 때 툴팁 재초기화 (부트스트랩 버그)
  if (kanbanSidebar) {
    kanbanSidebar.addEventListener('shown.bs.offcanvas', function () {
      const tooltipTriggerList = [].slice.call(kanbanSidebar.querySelectorAll('[data-bs-toggle="tooltip"]'));
      tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
      });
    });
  }
})();
