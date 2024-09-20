(function () {
  // 태그 입력 요소 선택
  const TagifyUserListEl = document.querySelector('#TagifyUserList');

  // 태그를 렌더링할 때 사용할 템플릿 정의
  function tagTemplate(tagData) {
    const empNm = tagData.empNm || 'Unknown'; // 직원 이름 또는 'Unknown'
    return `
      <tag title="${tagData.value || tagData.empNo}"
        contenteditable='false'
        spellcheck='false'
        tabIndex="-1"
        class="${this.settings.classNames.tag} ${tagData.class ? tagData.class : ''}"
        ${this.getAttributes(tagData)}
      >
        <x title='' class='tagify__tag__removeBtn' role='button' aria-label='remove tag'></x>
        <div>
          <span class='tagify__tag-text'>${empNm}</span>
        </div>
      </tag>
    `;
  }

  // 드롭다운 항목을 렌더링할 때 사용할 템플릿 정의
  function suggestionItemTemplate(tagData) {
    const empNm = tagData.empNm || 'Unknown'; // 직원 이름
    const orgDep = tagData.orgDep || 'N/A'; // 부서
    const posNm = tagData.posNm || 'N/A'; // 직책
    const onePosNm = tagData.onePosNm || 'N/A'; // 세부 직책

    return `
      <div ${this.getAttributes(tagData)}
        class='tagify__dropdown__item'
        tabindex="0"
        role="option"
      >
        ${tagData.avatar ? `<img onerror="this.style.visibility='hidden'" src="${tagData.avatar || 'default-avatar-url'}" width="24" height="24" style="vertical-align:middle;margin-right:8px;">` : ''}
        <span style="vertical-align:middle;">${empNm} (${orgDep}, ${posNm}, ${onePosNm})</span>
      </div>
    `;
  }

  // 드롭다운 헤더를 렌더링할 때 사용할 템플릿 정의
  function dropdownHeaderTemplate(suggestions) {
    return `
      <div class="${this.settings.classNames.dropdownItem} ${this.settings.classNames.dropdownItem}__addAll">
          <strong>${this.value.length ? `모두 선택` : 'Add All'}</strong>
          <span>${suggestions.length} members</span>
      </div>
    `;
  }

  // Tagify 인스턴스 초기화
  const TagifyUserList = new Tagify(TagifyUserListEl, {
    tagTextProp: 'empNm', // 태그의 텍스트로 사용할 프로퍼티
    enforceWhitelist: true, // 화이트리스트에 없는 값은 입력되지 않도록 설정
    skipInvalid: true, // 유효하지 않은 값은 스킵
    placeholder: "그룹멤버를 선택해주세요",
    dropdown: {
      closeOnSelect: false, // 선택 후 드롭다운 닫지 않기
      enabled: 0, // 드롭다운 자동 열기 설정
      classname: 'users-list', // 드롭다운의 CSS 클래스
      maxItems: 100, // 드롭다운의 최대 아이템 수
      searchKeys: ['empNm', 'orgDep', 'posNm', 'onePosNm'] // 검색할 키
    },
    templates: {
      tag: tagTemplate, // 태그 템플릿
      dropdownItem: suggestionItemTemplate, // 드롭다운 항목 템플릿
      dropdownHeader: dropdownHeaderTemplate // 드롭다운 헤더 템플릿
    },
    whitelist: [], // 초기 화이트리스트는 빈 배열
  });

  // 초기 데이터 로드 함수
  async function loadInitialData() {
    try {
      const response = await fetch('jsongroupemployee.do'); // 서버로부터 데이터 요청
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`); // 응답 오류 처리
      }
      const data = await response.json(); // JSON 데이터 파싱

      if (Array.isArray(data)) {
        const formattedData = data.map(item => ({
          value: item.empNo, // empNo를 value로 설정
          empNm: item.empNm,
          orgDep: item.orgDep,
          posNm: item.posNm,
          onePosNm: item.onePosNm
        }));
        TagifyUserList.settings.whitelist = formattedData; // 화이트리스트 업데이트
        TagifyUserList.loadWhitelist(); // Tagify에 화이트리스트 로드
        console.log('Whitelist updated:', formattedData); // 화이트리스트 업데이트 확인
      } else {
        console.error('Invalid data format'); // 데이터 형식 오류
      }
    } catch (error) {
    }
  }

  // 초기 데이터 로드 실행
  loadInitialData();

  // 이벤트 핸들러 등록
  TagifyUserList.on('dropdown:select', onSelectSuggestion) // 드롭다운 항목 선택 시
    .on('edit:start', onEditStart) // 태그 편집 시작 시
    .on('dropdown:show', () => {
      const container = TagifyUserList.dropdown.container; // 드롭다운 컨테이너
      if (container) {
        const addAllButton = container.querySelector(`.${TagifyUserList.settings.classNames.dropdownItem}__addAll`);
        if (addAllButton) {
          addAllButton.classList.remove('selected'); // "Add All" 버튼의 선택 상태 해제
        }
        // 드롭다운 항목의 선택 상태 해제
        TagifyUserList.dropdown.items.forEach(item => item.classList.remove('selected'));
      } else {
        console.warn('Dropdown container is not available yet.'); // 드롭다운 컨테이너가 아직 준비되지 않았을 경우 경고
      }
    });

  // 드롭다운에서 항목을 선택할 때의 동작 정의
  function onSelectSuggestion(e) {
    if (e.detail.elm.classList.contains(`${TagifyUserList.settings.classNames.dropdownItem}__addAll`)) {
      TagifyUserList.dropdown.selectAll(); // "Add All" 버튼 클릭 시 모든 항목 선택
    } else {
      const tagData = e.detail.data;
      // empNo를 value로 설정
      const formattedTag = {
        value: tagData.empNo, // empNo를 value로 설정
        empNm: tagData.empNm,
        orgDep: tagData.orgDep,
        posNm: tagData.posNm,
        onePosNm: tagData.onePosNm
      };
      TagifyUserList.addTags([formattedTag]); // 태그 추가
    }
  }

  // 태그 편집 시작 시 동작 정의
  function onEditStart({ detail: { tag, data } }) {
    TagifyUserList.setTagTextNode(tag, `${data.empNm || 'Unknown'}`); // 태그의 텍스트 설정
  }

  // 모달이 열릴 때 기존 태그 제거
  document.getElementById('modalCenter').addEventListener('show.bs.modal', function () {
    TagifyUserList.removeAllTags(); // 모든 태그 제거
  });

  // Tagify 인스턴스를 전역에서 접근 가능하도록 설정
  window.TagifyUserList = TagifyUserList;

  // 태그 추가 시 데이터 출력
  TagifyUserList.on('add', e => {
    console.log('Tag added:', e.detail.data); // 태그 추가 시 콘솔에 데이터 출력
  });

})();
