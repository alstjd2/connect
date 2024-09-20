$(function () {
  const connet = document.body.dataset.contextPath;
  var theme = $('html').hasClass('light-style') ? 'default' : 'default-dark',
      contextMenu = $('#organization'),
      selectedNode = null,
      newNodeType = '';

  // 기본 데이터
  // defaultData: 서버에서 데이터를 가져오지 못했을 때 사용할 기본 데이터
  var defaultData = [
    {
      id: 'root',
      text: '조직전체',
	  type: 'root',
      state: {
        opened: true
      },
      children: [
        {
          id: 'management-dept',
          text: '경영부',
          type: 'default',
          data: { representative: '김부장' },
          children: [
            {
              id: 'management-team1',
              text: '경영1팀',
              type: 'default',
              data: { representative: '이팀장' },
              children: [
                {
                  id: 'management-control',
                  text: '경영관리',
                  type: 'default',
                  data: { representative: '박과장' }
                }
              ]
            }
          ]
        }
      ]
    }
  ];

  // 서버에서 트리 데이터를 가져오거나 기본 데이터를 사용하는 함수
  // loadTreeData 함수: AJAX 요청을 통해 서버에서 트리 데이터를 가져옵니다. 성공 시
  // initializeTree 함수를 호출하여 데이터를 트리에 설정합니다. 실패 시, 기본 데이터를 사용하여 initializeTree 함수를 호출합니다.

  function loadTreeData() {
    $.ajax({
      url: `${connet}/gw/organization/treeData`, // 서버에서 트리 데이터를 가져오는 URL
      method: 'GET',
      dataType: 'json',
      success: function(data) {
		console.log("Server data before sort:", data); // 서버에서 가져온 데이터를 콘솔에 출력하여 확인
		data.forEach(node => {
                if (node.id === 19) {
                    node.type = 'root';  // 'root' 타입을 명시적으로 설정
                } else if (!node.type) {
                    node.type = 'default';  // 기존에 타입이 설정되지 않은 경우에만 'default'로 설정
                }
            });
		console.log("노드 데이터 확인:", data);  // 서버에서 가져온 노드 데이터 확인
		data.sort((a, b) => a.orgLevel - b.orgLevel); // 데이터를 ORG_LEVEL을 기준으로 정렬
		console.log("Server data after sort:", data); // 정렬된 데이터를 콘솔에 출력하여 확인
        initializeTree(data);
      },
      error: function() {
        console.warn("서버에서 트리 데이터를 로드하는 데 실패했습니다. 기본 데이터를 사용합니다.");
        initializeTree(defaultData);
      }
    });
  }

  // jstree 초기화 함수
  //initializeTree 함수: jstree를 초기화. 서버에서 받은 데이터 또는 기본 데이터를 사용하여 트리를 설정
  function initializeTree(data) {
    contextMenu.jstree({
      core: {
		data: data,
        themes: {
          name: theme
        },
        check_callback: function (operation, node, node_parent, node_position, more) {
          var tree = contextMenu.jstree(true);

		  // 루트 노드의 삭제 방지
          if (operation === 'delete_node' && node.id === 'root') {
              alert("조직전체(루트 노드)는 삭제할 수 없습니다."); //  ROOT 노드 삭제 방지
              return false;
          }

          // 노드가 루트 노드 외의 노드로 이동하는 것을 막음
          if (node_parent && node_parent.id === '#' && operation === 'move_node') {
              return false;
          }

          // 이동 작업일 때
          if (operation === 'move_node') {
              var oldParentNode = tree.get_node(node.parent).id; // 기존 부모 노드
              var newParent = node_parent.id; // 새 부모 노드의 ID


              // 새 부모가 기존 부모와 같다면 위치만 변경 가능
             if (newParent === node.parent) {
                  return true;
              }

              // 부모가 변경되는 경우 위치 변경을 금지
              return false;
          }


		  // 뎁스 체크
//          if (operation === 'create_node') {
//            var parentDepth = tree.get_node(node_parent).parents.length;
//            if (parentDepth >= 5) { // 5를 기준으로 부모의 뎁스를 확인하여 6뎁스 제한
//              alert("더 이상 하위 조직을 만들 수 없습니다.");
//              return false;
//            }
//          }

		  // 생성 작업일 때 뎁스 제한 체크
          var parentDepth = node_parent.parents.length;
          if (operation === 'create_node' && parentDepth >= 6) { // 뎁스 제한 체크
              alert("더 이상 하위 조직을 만들 수 없습니다.");
              return false;
          }


          // 기본적으로 다른 작업은 허용
          return true;
      },
        data: {'url' : function (node) {
            return node.id === '#' ?
              `${connet}/gw/organization/treeData` :
              `${connet}/gw/organization/treeData/${node.id}`;
          }
      }
      },
      plugins: ['types', 'contextmenu', 'dnd',  'wholerow'],
      types: {
        '#': {
          max_depth: 6
        },
		root: {
		  icon: 'bx bx-buildings m-0'
		},
        default: {
          icon: 'bx bx-group m-0'
        }
//        money: {
//          icon: 'bx bx-money-withdraw text-danger m-0'
//        },
//        sitemap: {
//          icon: 'bx bx-sitemap text-info m-0'
//        },
//        code: {
//          icon: 'bx bx-code-alt text-success m-0'
//        },
//        brush: {
//          icon: 'bx bx-brush text-warning m-0'
//        },
//        math: {
//          icon: 'bx bx-math text-secondary m-0'
//        }
      },
//      checkbox: {
//        three_state: false,
//        cascade: 'down',
//        whole_node: true,
//        tie_selection: false
//      },
      contextmenu: {
        items: function (node) {
          var tree = contextMenu.jstree(true);
          var items = {};

          if (node.id === 'root') {
            items["create"] = {
              "label": "새로 만들기",
              "action": function () {
              selectedNode = node;
              newNodeType = 'default';
			  resetModalFields(); // 모달 리셋 함수 호출
                    $('#nodeText').val('');
                    $('#nodeRepresentative').val('');
                    $('#nodeModal').modal('show');
                  }
            };
          } else {
            items["create"] = {
              "label": "새로 만들기",
              "action": function () {
              selectedNode = node;
              newNodeType = 'default';
              $('#nodeText').val('');
              $('#nodeRepresentative').val('');
              $('#nodeModal').modal('show');
                  }
            };

            items["edit"] = {
              "label": "조직수정",
              "action": function () {
                selectedNode = node;
                $('#nodeText').val(node.text);


    			console.log("Node Data:", node.data);  // node.data에서 데이터를 가져오는 부분에 로그 추가

        		var representative = node.data.representative; // node.data에서 직접 가져옴
				var representativeId = node.data.representativeId; // node.data에서 직원 ID 가져옴

				// 대표자 ID가 유효한 경우, select요소의 value를 설정
			    if (representativeId && !isNaN(representativeId)) {
				  	$('#nodeRepresentative').val(representativeId); // 직원 ID를 select 요소의 value로 설정
			    } else {
			      	$('#nodeRepresentative').val(''); // 값이 없을 경우 빈 문자열로 설정
			    }

		        $('#nodeModal').modal('show');
        	  }
           };

//            items["change_type"] = {
//              "label": "아이콘 변경",
//              "submenu": {
//                "type_to_management": {
//                  "label": '<i class="bx bx-money-withdraw text-danger m-0"></i>',
//                  "action": function () {
//                    tree.set_type(node, "money");
//                    tree.set_icon(node, 'bx bx-money-withdraw text-danger m-0');
//                    handleIconChange(node, 'money');
//                  }
//                },
//                "type_to_hr": {
//                  "label": '<i class="bx bx-sitemap text-info m-0"></i>',
//                  "action": function () {
//                    tree.set_type(node, "sitemap");
//                    tree.set_icon(node, 'bx bx-sitemap text-info m-0');
//                    handleIconChange(node, 'sitemap');
//                  }
//                },
//                "type_to_dev": {
//                  "label": '<i class="bx bx-code-alt text-success m-0"></i>',
//                  "action": function () {
//                    tree.set_type(node, "code");
//                    tree.set_icon(node, 'bx bx-code-alt text-success m-0');
//                    handleIconChange(node, 'code');
//                  }
//                },
//                "type_to_design": {
//                  "label": '<i class="bx bx-brush text-warning m-0"></i>',
//                  "action": function () {
//                    tree.set_type(node, "brush");
//                    tree.set_icon(node, 'bx bx-brush text-warning m-0');
//                    handleIconChange(node, 'brush');
//                  }
//                }
//              }
//            };
            items["remove"] = {
              "label": "삭제",
              "action": function () {
                if (node.id === '19' || node.id === '20') {
                  alert("조직전체(루트 노드)는 삭제할 수 없습니다");
                } else {
	 			// 루트 노드가 아닌 경우에만 서버에 삭제 요청
				$.ajax({
			          url: `${connet}/gw/organization/deleteOrganization`,
			          method: 'DELETE',
					  contentType: 'application/json',
			          data: JSON.stringify({ orgNo: node.id }),  // 'orgNo'를 JSON 형식으로 서버에 보냅니다
			          success: function(response) {
			              console.log("삭제되었습니다.", node.id);
			              tree.delete_node(node); // 삭제가 성공하면 트리에서 노드를 제거합니다
						  updateLevelsAfterDeletion(tree, node.parent); // 삭제 후 레벨 업데이트 함수 호출
			          },
			          error: function(error) {
			              console.error("삭제 오류:", error);
			              alert("삭제 중 오류가 발생했습니다.");
			          }
			      });
                }
              }
            };
          }

          return items;
        }
      }
    });

	// 모든 노드를 열어두기
	  contextMenu.on('loaded.jstree', function () {
	    var tree = contextMenu.jstree(true);
	    tree.open_all(); // 모든 노드 열기
	  });
  }

 function updateLevelsAfterDeletion(tree, parentId) {
    var siblings = tree.get_node(parentId).children; // 부모 노드의 자식 노드를 가져옴
    var nodesToUpdate = siblings.map(function(siblingId, index) {
        return {
            orgNo: siblingId,
            newLevel: index + 1 // 새 위치에 따라 레벨을 재설정
        };
    });

    $.ajax({
        url: `${connet}/gw/organization/updateLevelsAfterDeletion`,
        method: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(nodesToUpdate),
        success: function(response) {
            console.log("레벨이 서버에 저장되었습니다.");
        },
        error: function(error) {
            console.error("레벨 업데이트 오류:", error);
        }
    });
  }



  // 페이지가 로드되면 트리 데이터를 서버에서 가져오거나 기본 데이터를 사용합니다.
  // 초기화: 페이지가 로드되면 loadTreeData 함수를 호출하여 서버에서 데이터를 가져오거나 기본 데이터를 사용하여 트리를 초기화합니다.
  loadTreeData();  // loadTreeData 호출로 서버에서 데이터를 가져옴


  // 모달 창이 닫힐 때 상태 초기화
  $('#nodeModal').on('hidden.bs.modal', function () {
    selectedNode = null;
    newNodeType = '';
    $('#nodeText').val('');
    $('#nodeRepresentative').val('');
  });

  // 조직 이름 입력란에 '개발3팀' 자동 입력
  $('#autoInput').on('click', function() {
        $('#nodeText').val('개발3팀');
    });

  // 저장하기 버튼 클릭 시 처리할 내용
  $('#saveNode').on('click', function () {
    var tree = contextMenu.jstree(true),
        text = $('#nodeText').val(),
        representative = $('#nodeRepresentative').val();  // 직원 번호로 유지

    if (!text) {
        alert("조직 이름을 입력해 주세요.");
        return;
    }
	// 선택된 노드가 있고, 새 노드 타입이 설정되지 않은 경우 조직 수정으로 간주
    if (selectedNode && newNodeType === '') {
        var nodeId = selectedNode.id;


		// 대표자가 선택된 경우, 조직 정보를 업데이트하는 AJAX 요청
				$.ajax({
		            url: `${connet}/gw/organization/updateNode`,
		            method: 'POST',
		            contentType: 'application/json',
		            data: JSON.stringify({
		                orgNo: nodeId,
		                orgDep: text,
		                orgDf: representative // SELECT 요소로부터 선택된 대표자를 전달
		            }),
		            success: function(response) {
		                tree.set_text(nodeId, text);
		                tree.get_node(nodeId).data.representative = representative;
                        tree.deselect_all();
                        tree.select_node(nodeId);

						contextMenu.jstree(true).refresh();
		                $('#nodeModal').modal('hide');
		                console.log("수정되었습니다.", nodeId, text, representative);
		            },
		            error: function(error) {
		                console.error("수정 오류:", error);
		            }
		        });
 	   } else if (selectedNode)  {
            var parentNode = selectedNode || '#';
        	var parentOrgNo = (parentNode === '#') ? null : parseInt(parentNode.id, 10);
        	var orgUpdepValue = parentOrgNo !== null ? String(parentOrgNo) : null;

		// 뎁스 체크
		if (tree.get_node(parentNode).parents.length >= 6) {
            alert("더 이상 하위 조직을 만들 수 없습니다.");
			newNodeType = ''; //  생성 제한 후 newNodeType 초기화
			$('#nodeModal').modal('hide'); //  모달 창을 닫기.
            return;
        }

        $.ajax({
            url: `${connet}/gw/organization/createNode`,
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
                orgDep: text,
                orgUpdep: orgUpdepValue,
                orgDf: representative,  // 직원 이름을 보내도록 수정
                orgLevel: tree.get_node(parentNode).parents.length + 1,
                orgDelyn: 'N',
            }),
            success: function(response) {
                $('#nodeModal').modal('hide'); // 저장 후 모달 닫기
				var newNode = tree.create_node(parentNode,response);
                console.log("생성되었습니다.", newNode.id);
		        tree.open_node(parentNode);

            },
            error: function (xhr, status,error) {
                if (xhr.status === 404) {
                    alert("등록되어있지 않은 직원입니다.");
					$('#nodeModal').modal('show'); // 모달을 다시 엶
                } else {
                    console.error("생성 오류:", error);
                }
            }
        });

        // selectedNode와 newNodeType 초기화
        selectedNode = null;
        newNodeType = '';
    }
});

	//  대표자 선택 시 중복 체크 기능 추가
$('#nodeRepresentative').on('change', function() {
    var selectedRepresentativeId = $(this).val(); // 선택된 대표자 ID를 가져옴

    // 선택된 대표자가 유효한지 확인 (빈 값이 아닐 때만 체크)
    if (selectedRepresentativeId) {
        $.ajax({
            url: `${connet}/gw/organization/checkDuplicateRepresentative`, // 서버에서 중복 부서장을 체크할 URL
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({ representativeId: selectedRepresentativeId }), // 선택된 대표자 ID를 서버로 전송
            success: function(response) {
                if (response.isDuplicate) {
                    alert("이미 부서장인 직원입니다. 다른 직원을 선택해주세요."); //  이미 부서장일 경우 알림
                    $('#nodeRepresentative').val(''); //  이미 부서장일 경우 선택 해제
                }
            },
            error: function(error) {
                console.error("중복 부서장 확인 오류:", error); //  오류 처리
            }
        });
    }
});



  contextMenu.on("move_node.jstree", function (e, data) {
	var tree = contextMenu.jstree(true);
    var nodeId = data.node.id; // 이동된 노드 ID
    var parent = data.parent; // 새 부모 노드 ID
    var oldParent = data.old_parent; // 이전 부모 노드 ID
    var position = data.position; // 새 위치 (0부터 시작)

	// 새로운 부모 노드의 자식 노드들을 가져와서 레벨을 조정해야 함
    var siblings = tree.get_node(parent).children;

    // 새 레벨 계산을 위해 노드와 레벨 매핑 정보 생성
    var nodesToUpdate = siblings.map(function(siblingId, index) {
        return {
            orgNo: siblingId,
            newLevel: index + 1, // 새 위치에 따라 레벨을 설정 (0부터 시작하므로 1을 더함)
            newParent: parent
        };
    });

	 //서버에 위치 변경 요청
     $.ajax({
        url: `${connet}/gw/organization/moveNode`,  // 서버에 노드 위치를 업데이트하는 URL
        method: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(nodesToUpdate), // 변경된 노드들의 정보를 전송
        success: function(response) {
            console.log("위치 변경이 서버에 저장되었습니다.");
        },
        error: function(error) {
            console.error("위치 변경 오류:", error);
        }
    });

    console.log("위치 변경되었습니다.", data.node.id, data.parent, data.position);
  });

  function handleIconChange(node, type) {
    // 서버에 아이콘 변경 요청
    // $.ajax({
    //     url: '/api/updateNodeType',
    //     method: 'POST',
    //     data: {
    //         id: node.id,
    //         type: type
    //     },
    //     success: function(response) {
    //         console.log("아이콘 변경되었습니다.", node.id, type);
    //     },
    //     error: function(error) {
    //         console.error("아이콘 변경 오류:", error);
    //     }
    // });
    console.log("아이콘 변경되었습니다.", node.id, type);
  }
});
