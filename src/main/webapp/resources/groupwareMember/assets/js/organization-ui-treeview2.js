function showToast(message, type = 'success') {
    var toastContainer = document.getElementById('toast-container');
    if (!toastContainer) {
        console.error('Toast container not found!');
        return;
    }

    var toastTemplate = document.getElementById('toast-template');
    if (!toastTemplate) {
        console.error('Toast template not found!');
        return;
    }

    var toastClone = toastTemplate.cloneNode(true);
    toastClone.querySelector('.toast-body').textContent = message;
    toastClone.classList.add('bg-' + type);

    // Remove the ID to prevent duplicate IDs
    toastClone.removeAttribute('id');

    toastContainer.appendChild(toastClone);

    var toast = new bootstrap.Toast(toastClone);
    toast.show();

    // 자동으로 토스트를 숨기기 위해 타이머 설정
    setTimeout(function () {
        toast.hide(); // 토스트 숨기기
    }, 1000); // 3초 후
}



$(function () {
    var theme = $('html').hasClass('light-style') ? 'default' : 'default-dark',
        contextMenu = $('#organization'),
        selectedNode = null,
        newNodeType = '';

    // 기본 데이터
    var defaultData = [
        {
            id: 'root',
            text: '조직전체',
            state: {
                opened: true
            },
            children: [
                {
                    id: 'management-dept',
                    text: '경영부',
                    type: 'money',
                    data: { representative: '김부장' },
                    children: [
                        {
                            id: 'management-team1',
                            text: '경영1팀',
                            type: 'money',
                            data: { representative: '이팀장' },
                            children: [
                                {
                                    id: 'management-control',
                                    text: '경영관리',
                                    type: 'money',
                                    data: { representative: '박과장' }
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    ];

    const connet = document.body.dataset.contextPath;
    const baseUrl = `${connet}/`;  // baseUrl 정의 추가

    function initializeTree(data) {
        contextMenu.jstree({
            core: {
                themes: {
                    name: theme
                },
                check_callback: function (operation, node, node_parent, node_position, more) {
                    var tree = contextMenu.jstree(true);

                    if (node_parent && node_parent.id === '#' && operation === 'move_node') {
                        return false;
                    }

                    if (operation === 'move_node') {
                        var oldParentNode = tree.get_node(node.parent).id;
                        var oldParent = oldParentNode.parent;
                        var newParent = node_parent.id;

                        if (newParent === oldParent || newParent === node.parent) {
                            return true;
                        }

                        return false;
                    }

                    return true;
                },
                data: {
                    'url': function (node) {
                        return node.id === '#' ?
                            `${connet}/gw/organization/treeData` :
                            `${connet}/gw/organization/treeData/${node.id}`;
                    }
                },
            },
            plugins: ['types'],
            types: {
                '#': {
                    max_depth: 5
                },
                default: {
                    icon: 'bx bx-buildings m-0'
                },
                money: {
                    icon: 'bx bx-money-withdraw text-danger m-0'
                },
                sitemap: {
                    icon: 'bx bx-sitemap text-info m-0'
                },
                code: {
                    icon: 'bx bx-code-alt text-success m-0'
                },
                brush: {
                    icon: 'bx bx-brush text-warning m-0'
                },
                math: {
                    icon: 'bx bx-math text-secondary m-0'
                }
            }
        });

		// 노드 선택 이벤트 핸들러
        contextMenu.on('select_node.jstree', function (e, data) {
            var selectedNode = data.node;
            var selectedNodeText = selectedNode.text.trim();
            
            // 레벨 계산 함수
            function getNodeLevel(node) {
                var level = 0;
                while (node.parent !== '#') {
                    node = contextMenu.jstree('get_node', node.parent);
                    level++;
                }
                return level;
            }
            
            var nodeLevel = getNodeLevel(selectedNode);
            console.log("Node level: " + nodeLevel); // 콘솔 확인

            if (nodeLevel === 0) {
                window.location.href = 'orgaddressList.do';
            } else {
                loadEmployeeData(selectedNodeText, 1);  // 기본 페이지 번호 1
            }
        });

        // 페이지 버튼 클릭 이벤트 핸들러
        $(document).on('click', '.pagination .page-link', function (e) {
            e.preventDefault();
            var page = $(this).data('page');
            var selectedNode = contextMenu.jstree('get_selected', true)[0];
            var selectedNodeText = selectedNode.text.trim();
            
                    loadEmployeeData(selectedNodeText, page);

        });
    }

    function loadEmployeeData(orgDep, page) {
        fetch(`${connet}/gw/address/orgAddressListbu.do?orgDep=${encodeURIComponent(orgDep)}&page=${page}&ajax=true`)
            .then(response => response.json())
            .then(data => {
                let employeeRows = '';
                data.employeeList.forEach(employee => {
                    const hasProfile = employee.empProfile ? true : false;
                    const fileDetails = employee.atchFile && employee.atchFile.fileDetails ? employee.atchFile.fileDetails[0] : null;
                    const profileImageUrl = fileDetails ? `/connect/files/${fileDetails.streFileNm}` : `${baseUrl}resources/images/default-avatar.png`;
                    const profileImage = hasProfile ? 
                        `<img src="${profileImageUrl}" class="d-block w-px-32 h-px-32 rounded-circle" id="uploadedAvatar" alt="프로필 사진" />` :
                        `<span class="avatar-initial rounded-circle bg-label-dark">${employee.empNm.charAt(0)}</span>`;
                    
                    const bookmarkIcon = employee.bookMarkList.length > 0 && employee.bookMarkList[0].markNo ?
                        `<i class='bx bxs-star' data-mark-no="${employee.bookMarkList[0].markNo}" data-emp-no="${employee.empNo}" onclick="toggleBookmark(this)"></i>` :
                        `<i class='bx bx-star' data-mark-no="" data-emp-no="${employee.empNo}" onclick="toggleBookmark(this)"></i>`;
                    
                    employeeRows += `
                        <tr>
                            <td>${employee.rnum}</td>
                            <td>
                                <form>
                                    <label for="bookmark-${employee.bookMarkList[0] ? employee.bookMarkList[0].markNo : ''}" class="btn btn-icon rounded-pill btn-outline-warning">
                                        <input type="hidden" name="bookmark" class="bookmark-checkbox" data-emp-no="${employee.empNo}" data-mark-no="${employee.bookMarkList[0] ? employee.bookMarkList[0].markNo : ''}" />
                                        <input type="hidden" name="empNo" data-emp-no="${employee.empNo}" />
                                        ${bookmarkIcon}
                                    </label>
                                </form>
                            </td>
                            <td>
                                <div class="d-flex justify-content-start align-items-center user-name">
                                    <div class="avatar-wrapper emp-info" data-emp-no="${employee.empNo}" data-target='#app-addr-contacts'>
                                        <div class="avatar me-2">
                                            ${profileImage}
                                        </div>
                                    </div>
                                    <div class="d-flex flex-column">
                                        <span class="emp_name text-truncate">${employee.empNm}</span>
                                        <small class="emp_post text-truncate text-muted">
                                            <span class="badge bg-label-primary me-1">${employee.empState}</span>
                                        </small>
                                    </div>
                                </div>
                            </td>
                            <td>${employee.company.organizationList.map(org => org.orgDep).join('<br />')}</td>
                            <td>${employee.company.positionList.map(pos => `${pos.posNm} / ${pos.oneposnm}`).join('<br />')}</td>
                            <td>${employee.empTel}</td>
                            <td>${employee.empMail}</td>
                        </tr>
                    `;
                });

                const employeeListHTML = `
                    <div class="col app-emails-list" id="employee-list-container">
                        <div class="card shadow-none border-0 rounded-0">
                            <div class="card-body emails-list-header p-3 py-2">
                                <div class="d-flex justify-content-between align-items-center px-3 mt-2">
                                    <div class="d-flex align-items-center w-100">
                                        <i class="bx bx-menu bx-lg cursor-pointer d-block d-lg-none me-4" data-bs-toggle="sidebar" data-target="#app-addr-sidebar" data-overlay></i>
                                        <div class="w-100">
                                            <div class="input-group input-group-merge shadow-none">
                                                <span class="input-group-text border-0 p-0 pe-4" id="addr-search">
                                                    <i class='bx bx-circle bx-rotate-90 bx-md ' style='color:white'  ></i>
                                                </span>
                                                <div id="searchUI">
                                                    <form:select path="condition.searchType" style="display:none;">
                                                        <option value="" label="전체" />
                                                        <option value="name" label="이름" />
                                                    </form:select>
                                                    <form:input type="text" class="form-control addr-search-input border-0 py-0" placeholder="직원을 검색하세요." aria-label="직원을 검색하세요." path="condition.searchWord" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr class="mx-n3 emails-list-header-hr mb-2" />
                                <div class="d-flex justify-content-end align-items-center ps-1">
                                    <div class="d-flex align-items-center">
                                        <span class="btn btn-icon me-1">
                                            <i class="bx bx-refresh bx-md scaleX-n1-rtl cursor-pointer addr-refresh"></i>
                                        </span>
                                        
                                    </div>
                                </div>
                            </div>
                            <div id="app-addr-contacts" class="emails-list">
                                <div class="table-responsive text-nowrap scrollbar" >
                                    <table class="table text-nowrap border-top" id="employeeTable">
                                        <thead>
                                            <tr>
                                                <th>번호</th>
                                                <th>즐겨찾기</th>
                                                <th>이름</th>
                                                <th>부서(조직)</th>
                                                <th>직급/직책</th>
                                                <th>전화번호</th>
                                                <th>메일</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            ${employeeRows}
                                        </tbody>
                                    </table>
                                </div>
                                    <nav aria-label="Page navigation text-center">
                                       <ul class="pagination pagination-rounded justify-content-center pt-7">
                                           <div class="pagination-wrapper">${data.pagingHTML}</div>
                                       </ul>
                                   </nav>
                            </div>
                        </div>
                        <form:form id="searchform" method="get" modelAttribute="condition">
                        <form:hidden path="searchType" />
                        <form:hidden path="searchWord" />
                        <input type="hidden" name="page" />
                    </form:form>
                    <div class="app-overlay"></div>
					<!-- Toast Container -->
               <div id="toast-container" aria-live="polite" aria-atomic="true" class="position-fixed p-3" style="top: 80px; right: 20px;
    				z-index: 10000; width: 350px;">
                   <!-- Toast Template -->
                   <div id="toast-template" class="toast fade" role="alert" aria-live="assertive" aria-atomic="true">
                       <div class="toast-header">
                           <i class="bx bx-bell me-2"></i>
                           <div class="me-auto fw-medium">알림</div>
                           <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                       </div>
                       <div class="toast-body">
                           메시지 내용
                       </div>
                   </div>
               </div>
                    </div>
                `;

                $('#employee-list-container').html(employeeListHTML);
                $('#app-addr-sidebar .addr-filter-folders .active').removeClass('active');
            })
            .catch(error => {
                console.error('Error fetching employee list:', error);
            });
    }

    // 초기 트리 초기화
    initializeTree(defaultData);
});

document.addEventListener('DOMContentLoaded', function () {
    (function () {
        const appAddrSidebar = document.querySelector('.app-addr-sidebar');
        const emailFilterByFolders = document.querySelectorAll('.email-filter-by-folder');
        
        emailFilterByFolders.forEach(emailFilterByFolder => {
            emailFilterByFolder.addEventListener('click', e => {
                appAddrSidebar.classList.remove('show');
            });
        });
    })();

    // 동적으로 생성된 .emp-info 요소를 타겟으로 하기 위해 이벤트 위임 사용
    document.body.addEventListener('click', e => {
        let empInfoElement = e.target.closest('.emp-info');
        
        if (empInfoElement) {
            e.stopPropagation(); // 이벤트 전파 방지
            
            const chatSidebarLeftClose = document.querySelector('#app-addr');
            const overlay = document.querySelector(".app-overlay");
            
            chatSidebarLeftClose.classList.toggle('layout-act');
            overlay.classList.toggle('show');
        }
    });

    // 오버레이 또는 사이드바 바깥을 클릭하면 사이드바를 닫기
    document.addEventListener('click', e => {
        const chatSidebarLeftClose = document.querySelector('#app-addr');
        const overlay = document.querySelector(".app-overlay");

        // 오버레이를 클릭했거나, 사이드바 바깥을 클릭한 경우
        if (overlay.contains(e.target) || !chatSidebarLeftClose.contains(e.target)) {
            chatSidebarLeftClose.classList.remove('layout-act');
            overlay.classList.remove('show');
        }
    });
});
