package kr.or.ddit.groupware.organization.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.OrganizationVO;

public interface OrganizationService {
	public int removeOrganization(int orgNo);
	public int createOrganization(OrganizationVO organization);

	public List<OrganizationVO> retrieveAll(int comNo);
	public List<OrganizationVO> retrieveChildren(int comNo, String orgUpdep);
	public List<Map<String, Object>> retrieveOrganizationTreeData(int comNo, String orgUpdep);

	public int modifyOrganization(OrganizationVO organization);

	List<EmployeeVO> getEmployeesByDepartment(int orgId);

	public int getNewOrgId();  // 시퀀스를 통한 새로운 orgId 생성 메서드

	public OrganizationVO retrieveOrganization(int orgNo);

	public String getEmployeeNameByEmpNo(int empNo);

	public Integer getEmpNoByName(String empNm);

	public void removeOrganizationAndChildren(int orgNo);

	public boolean isRepresentativeAlreadyAssigned(String representativeId);

	/**
	 * 특정 부서의 삭제된 레벨 이후의 모든 조직 레벨을 업데이트하는 메서드
	 *
	 * @param comNo	회사번호
	 * @param deletedLevel	삭제된 조직의 레벨
	 */
	public void updateOrganizationLevelsAfterDeletion(Integer comNo, Integer deletedLevel, Integer deletedOrgNo);

	public void updateNodeParentAndLevel(Integer orgNo, String newParent, Integer newLevel);

	public void updateNodeLevel(Integer orgNo, Integer newLevel);

	public List<OrganizationVO> retrieveAllDepartments(int comNo);
}
