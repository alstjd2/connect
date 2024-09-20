package kr.or.ddit.groupware.organization.service;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.groupware.employee.dao.EmployeeMapper;
import kr.or.ddit.groupware.employee.service.EmployeeService;
import kr.or.ddit.groupware.organization.dao.OrganizationMapper;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.OrganizationVO;

@Service
public class OrganizationServiceImpl implements OrganizationService {

	@Autowired
	private OrganizationMapper dao;

	@Autowired
	private EmployeeService employeeService;

	@Autowired
	private EmployeeMapper empMapper;

	@Override
	public int removeOrganization(int orgNo) {
		return dao.deleteOrganization(orgNo);
	}

	@Override
	public int createOrganization(OrganizationVO organization) {
		 String orgUpdep = organization.getOrgUpdep();
		 int comNo = organization.getComNo();

		 // 부서장이름(orgDf)이 주어졌다면, 해당 이름을 가진 직원의 EMP_NO를 가져와 설정
        String orgDfName = organization.getOrgDf();
//        if (orgDfName != null && !orgDfName.isEmpty()) {
//            int empNo = employeeService.getEmpNoByName(orgDfName);
//            organization.setOrgDf(String.valueOf(empNo));  // EMP_NO를 문자열로 변환하여 ORG_DF에 설정
//        }

        // ORG_LEVEL 계산
        int newOrgLevel;
        if (orgUpdep == null || orgUpdep.trim().isEmpty()) {
            // 최상위 부서인 경우
            newOrgLevel = dao.getMaxOrgLevelForRoot(comNo) + 1;
        } else {
            // 하위 부서인 경우
            newOrgLevel = dao.getMaxOrgLevelForSubDepartments(comNo, orgUpdep) + 1;
        }
        organization.setOrgLevel(String.valueOf(newOrgLevel));

        // 조직 생성
        return dao.insertOrganization(organization);
	}

	@Override
    public List<Map<String, Object>> retrieveOrganizationTreeData(int comNo, String orgUpdep) {
        List<OrganizationVO> organizations = retrieveChildren(comNo, orgUpdep);
//        {
//        	  id          : "string" // required
//        	  parent      : "string" // required
//        	  text        : "string" // node text
//        	  state       : {
//        	    opened    : boolean  // is the node open
//        	  },
//        	}
        List<Map<String, Object>> treeData = organizations.stream().map(org -> {
            Map<String, Object> node = new HashMap<>();
            node.put("id", org.getOrgNo());   // ORG_NO을 사용
            node.put("parent", org.getOrgUpdep() == null ? "#" : org.getOrgUpdep()); // ORG_UPDEP가 null인 경우 root로 설정
            node.put("text", org.getOrgDep()); // 부서명
            node.put("children", org.getOrgChildCnt() > 0); // 추가요청으로 하위부서를 조회

            Map<String, Object> stateMap = new HashMap<>();
//          stateMap.put("opened", true);
            stateMap.put("selected", false);
            node.put("state", stateMap);

         // 직원 번호를 직원 이름으로 변환하여 노드 데이터에 추가
            String orgDf = org.getOrgDf();
            Map<String, Object> dataMap = new HashMap<>();
            if (orgDf != null && !orgDf.trim().isEmpty() && orgDf.matches("\\d+")) {  // 직원 번호가 유효한 경우에만 변환
                try {
                	EmployeeVO representative= employeeService.retrieveEmployeeDetail(Integer.parseInt(orgDf));
                	String representativeText = representative.getEmpNm() + " / " + representative.getEmpDepName() + ", " + representative.getEmpPosName();
                	dataMap.put("representative", representativeText);  // 부서장 이름
	                dataMap.put("representativeId", orgDf);  // 부서장 ID (직원번호)
                } catch (NumberFormatException e) {
                    System.err.println("Invalid orgDf format: " + orgDf);
                    dataMap.put("representative", "Unknown");  // 부서장 정보가 없을 때 처리
                    dataMap.put("representativeId", "");  // 부서장 ID 비우기
                }
            } else {
                dataMap.put("representative", "Unknown");  // 부서장 정보가 없을 때 처리
                dataMap.put("representativeId", "");  // 부서장 ID 비우기
            }
            node.put("data", dataMap);

            return node;
        }).collect(Collectors.toList());

       // 추가: 데이터 검증을 위한 로그 출력
          System.out.println("Tree Data: " + treeData);

          return treeData;
    }



	@Override
	public void removeOrganizationAndChildren(int orgNo) {
	    // 주어진 orgNo에 대해 하위 부서들을 가져와서 모두 삭제
	    List<Integer> childOrgNos = dao.selectChildOrgNos(orgNo);
	    for (Integer childOrgNo : childOrgNos) {
	        removeOrganizationAndChildren(childOrgNo);
	    }
	    // 최종적으로 현재 부서를 삭제
	    dao.deleteOrganization(orgNo);
	}

	@Override
	public List<OrganizationVO> retrieveAll(int comNo) {
		return dao.selectAll(comNo,null);

	}
	@Override
	public List<OrganizationVO> retrieveChildren(int comNo, String orgUpdep) {
		return dao.selectAll(comNo,orgUpdep);
	}

	@Override
	public int modifyOrganization(OrganizationVO organization) {
		return dao.updateOrganization(organization);
	}


	@Override
	public List<EmployeeVO> getEmployeesByDepartment(int orgId) {
		return dao.selectEmployeesByDepartment(orgId);
	}

	@Override
	public int getNewOrgId() {
		return dao.getNewOrgId();  // 시퀀스에서 새로운 orgId를 가져옴
	}

	@Override
	public OrganizationVO retrieveOrganization(int orgNo) {
		 return dao.selectOrganization(orgNo);
	}


	@Override
	public String getEmployeeNameByEmpNo(int empNo) {
	    return employeeService.getEmployeeNameByEmpNo(empNo); // EMP_NO를 사용하여 이름을 조회하는 서비스 메서드 호출
	}


	@Override
	public Integer getEmpNoByName(String empNm) {
	    return employeeService.getEmpNoByName(empNm);
	}

	@Override
	public boolean isRepresentativeAlreadyAssigned(String representativeId) {
		 return dao.countByRepresentativeId(representativeId) > 0;
    }

	@Override
	public void updateOrganizationLevelsAfterDeletion(Integer comNo, Integer deletedLevel, Integer deletedOrgNo) {
	    // 삭제된 레벨 이후의 모든 부서들에 대해 레벨을 재정렬하여 감소시킴
	    dao.updateLevelsAfterDeletion(comNo, deletedLevel, deletedOrgNo);
	}

	@Transactional
	@Override
	public void updateNodeParentAndLevel(Integer orgNo, String newParent, Integer newLevel) {
		dao.updateNodeParentAndLevel(orgNo, newParent, newLevel);

	}

	@Override
	public void updateNodeLevel(Integer orgNo, Integer newLevel) {
		dao.updateNodeLevel(orgNo, newLevel);

	}

	@Override
	public List<OrganizationVO> retrieveAllDepartments(int comNo) {
		return dao.selectAllDepartments(comNo);
	}
}
