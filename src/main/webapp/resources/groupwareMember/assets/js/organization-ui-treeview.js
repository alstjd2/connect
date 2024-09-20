/**
 * Treeview (jquery)
 */

'use strict';

$(function () {
  var theme = $('html').hasClass('light-style') ? 'default' : 'default-dark',
    organTree = $('#organization-treeview');

  // Custom Icons
  // --------------------------------------------------------------------
  if (organTree.length) {
    organTree.jstree({
      core: {
        themes: {
          name: theme
        },
        data: [
            {
                id: 'root',
                text: '조직전체',
                children: [
                    {
                        id: 'management-dept',
                        text: '경영부',
                        type: '경영',
                        children: [
                            {
                                id: 'management-team1',
                                text: '경영1팀',
                                type: '경영',
                                children: [
                                    {
                                        id: 'management-control',
                                        text: '경영관리',
                                        type: '경영'
                                    },
                                    {
                                        id: 'management-support',
                                        text: '경영지원',
                                        type: '경영',
                                        children: [
                                            {
                                                id: 'management-support1',
                                                text: '경영지원1',
                                                type: '경영'
                                            },
                                            {
                                                id: 'management-support2',
                                                text: '경영지원2',
                                                type: '경영',
                                                children: [
                                                    {
                                                        id: 'management-support3',
                                                        text: '경영지원3',
                                                        type: '경영'
                                                    }
                                                ]
                                            }
                                        ]
                                    }
                                ]
                            },
                            {
                                id: 'management-team2',
                                text: '경영2팀',
                                type: '경영'
                            }
                        ]
                    },
                    {
                        id: 'hr-dept',
                        text: '인사부',
                        type: '인사',
                        children: [
                        {
                            id: 'hr-team1',
                            text: '인사1팀',
                            type: '인사'
                        },
                        {
                            id: 'hr-team2',
                            text: '인사2팀',
                            type: '인사'
                        }
                        ]
                    },
                    {
                        id: 'dev-dept',
                        text: '개발부',
                        type: '개발',
                        children: [
                        {
                            id: 'dev-team1',
                            text: '개발1팀',
                            type: '개발'
                        },
                        {
                            id: 'dev-team2',
                            text: '개발2팀',
                            type: '개발'
                        }
                        ]
                    }
                ]
            }
        ]
      },
      plugins: ['types'],
      types: {
        default: {
          icon: 'bx bx-buildings'
        },
        경영: {
          icon: 'bx bx-money-withdraw'
        },
        인사: {
          icon: 'bx bx-sitemap'
        },
        개발: {
          icon: 'bx bx-code-alt'
        }
      }
    });

    // Node 클릭 시 비동기 방식으로 링크 이동
    organTree.on('select_node.jstree', function (e, data) {
      var node = data.node;
      var id = node.id; // 노드의 id 값 사용
      var url = '/addressBook/' + id; // id를 기반으로 URL 생성
      // AJAX를 사용한 비동기 호출
      $.ajax({
        url: url,
        method: 'GET',
        success: function (response) {
          // 페이지의 특정 영역을 업데이트
          $('#content-area').html(response);
        },
        error: function () {
          alert(url);
        }
      });
    });
  }
});

document.addEventListener('DOMContentLoaded', function () {
    (function () {
    const appAddrSidebar = document.querySelector('.app-addr-sidebar');
        emailFilterByFolders.forEach(emailFilterByFolder => {
            emailFilterByFolder.addEventListener('click', e => {
                appAddrSidebar.classList.remove('show');
            });
        });
    });

    let chatHistoryHeaderMenus = document.querySelectorAll(".emp-info"),
    chatSidebarLeftClose = document.querySelector('#app-addr'),
    overlay = document.querySelector(".app-overlay");

    // 각 .emp-info 요소에 클릭 이벤트 리스너 추가
    chatHistoryHeaderMenus.forEach(chatHistoryHeaderMenu => {
        chatHistoryHeaderMenu.addEventListener('click', e => {
            e.stopPropagation(); // 이벤트가 버블링되지 않도록 중지
            chatSidebarLeftClose.classList.toggle('layout-act');
            overlay.classList.toggle('show');
        });
    });

    // document에 클릭 이벤트 리스너 추가
    document.addEventListener('click', e => {
        console.log(e.target);
        // 클릭된 요소가 #app-addr 또는 .emp-info 내부가 아니라면
        if ( overlay.contains(e.target) || !chatSidebarLeftClose.contains(e.target) ) {
            chatSidebarLeftClose.classList.remove('layout-act');
            overlay.classList.remove('show');
        }
    });
})

