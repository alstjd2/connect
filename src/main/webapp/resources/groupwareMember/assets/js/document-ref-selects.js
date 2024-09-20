'use strict';

(function () {
  const contextPath = document.body.dataset.contextPath;
  const empRefListEl = document.querySelector('#empRefList');
  window.TagifyUserList = null; // 전역 변수로 정의
  let usersList = [];

  async function fetchUserList() {
    try {
      const response = await fetch(`${contextPath}/gw/document/insert/empRecList`, {
        method: 'GET',
        headers: {
          'Content-Type': 'application/json'
        }
      });

      if (!response.ok) {
        throw new Error('Network response was not ok ' + response.statusText);
      }

      const data = await response.json();

      // 필요한 정보만 추출
      usersList = data.map(user => ({
        value: user.empNo,
        pmtDcmRefEmpNo: user.empNo,
        pmtDcmRefEmpNm: user.empNm,
        pmtDcmRefEmpDep: user.company.organizationList[0].orgDep,
        pmtDcmRefEmpOnepos: user.company.positionList[0].posNm,
        pmtDcmRefEmpPos: user.company.positionList[0].oneposnm
      }));

      initializeTagify(usersList);

    } catch (error) {
      console.error('가져오는 중에 애러가 발생하였습니다.', error);
    }
  }

  function initializeTagify(usersList) {
    function tagTemplate(tagData) {
        return `
            <tag title="${tagData.title || tagData.pmtDcmRefEmpDep}"
                contenteditable='false'
                spellcheck='false'
                tabIndex="-1"
                class="${this.settings.classNames.tag} ${tagData.class ? tagData.class : ''}"
                ${this.getAttributes(tagData)}
            >
                <x title='' class='tagify__tag__removeBtn' role='button' aria-label='remove tag'></x>
                <div>
                    <span class='tagify__tag-text'>${tagData.pmtDcmRefEmpNm}/${tagData.pmtDcmRefEmpOnepos}</span>
                </div>
            </tag>
        `;
    }

    function suggestionItemTemplate(tagData) {
        return `
            <div ${this.getAttributes(tagData)}
                class='tagify__dropdown__item d-flex flex-wrap px-5 align-items-center ${tagData.class ? tagData.class : ''}'
                tabindex="0"
                role="option"
            >
                <div class="fw-medium">${tagData.pmtDcmRefEmpNm}</div>
                <span>${tagData.pmtDcmRefEmpDep}(${tagData.pmtDcmRefEmpOnepos}/${tagData.pmtDcmRefEmpPos})</span>
            </div>
        `;
    }

    function dropdownHeaderTemplate(suggestions) {
        return `
            <div class="${this.settings.classNames.dropdownItem} ${this.settings.classNames.dropdownItem}__addAll">
                <strong>${this.value.length ? `남은 전체 인원` : '검색된 전체 인원 선택'}</strong>
                <span>${suggestions.length} 명</span>
            </div>
        `;
    }

    // Tagify 초기화
    window.TagifyUserList = new Tagify(empRefListEl, {
        placeholder: "참조인원을 선택해주세요.", 
        tagTextProp: 'name',
        enforceWhitelist: true,
        skipInvalid: true,
        dropdown: {
            closeOnSelect: false,
            enabled: 0,
            classname: 'users-list',
            searchKeys: ['pmtDcmRefEmpNm', 'pmtDcmRefEmpDep', 'pmtDcmRefEmpOnepos', 'pmtDcmRefEmpPos']
        },
        templates: {
            tag: tagTemplate,
            dropdownItem: suggestionItemTemplate,
            dropdownHeader: dropdownHeaderTemplate
        },
        whitelist: usersList
    });

    // 이벤트 리스너 첨부
    TagifyUserList.on('dropdown:select', onSelectSuggestion).on('edit:start', onEditStart);

    function onSelectSuggestion(e) {
        if (e.detail.elm.classList.contains(`${TagifyUserList.settings.classNames.dropdownItem}__addAll`))
            TagifyUserList.dropdown.selectAll();
    }

    function onEditStart({ detail: { tag, data } }) {
        if (tag.parentNode) {
            TagifyUserList.setTagTextNode(tag, `${data.pmtDcmRefEmpNm} <${data.pmtDcmRefEmpDep} ${data.pmtDcmRefEmpOnepos} ${data.pmtDcmRefEmpPos}>`);
        }
    }
}

  // 페이지 로드 시 유저 리스트를 비동기적으로 가져옴
  fetchUserList();

})();
