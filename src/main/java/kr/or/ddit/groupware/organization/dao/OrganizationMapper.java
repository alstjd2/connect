package kr.or.ddit.groupware.organization.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.OrganizationVO;

@Mapper
public interface OrganizationMapper {
	public int deleteOrganization(int orgNo);

	public int insertOrganization(OrganizationVO organization);

	public OrganizationVO selectOrganization(int orgNo);

	public List<OrganizationVO> selectAll(@Param("comNo") int comNo, @Param("orgUpdep") String orgUpdep);

	public int updateOrganization(OrganizationVO organization);

	public List<EmployeeVO> selectEmployeesByDepartment(int orgId);  // 추가된 메서드

	public int getNewOrgId(); // 시퀀스를 통한 새로운 orgId 생성 메서드

	public int getMaxOrgLevelForRoot(@Param("comNo") int comNo);

	public int getMaxOrgLevelForSubDepartments(@Param("comNo") int comNo, @Param("orgUpdep") String orgUpdep);

	public String selectEmployeeNameByEmpNo(int empNo);

	public List<Integer> selectChildOrgNos(int orgNo);

	public int countByRepresentativeId(String representativeId);

	/**
	 * 특정 회사에서 삭제된 레벨 이후의 모든 부서 레벨을 1씩 감소시키는 메서드.
	 * @param comNo	회사번호
	 * @param deletedLevel	삭제된 조직의 레벨
	 * @param deletedOrgNo
	 */
	public void updateLevelsAfterDeletion(@Param("comNo") Integer comNo, @Param("deletedLevel") Integer deletedLevel, @Param("deletedOrgNo") Integer deletedOrgNo);

	public void updateNodeParentAndLevel(@Param("orgNo") Integer orgNo, @Param("newParent") String newParent, @Param("newLevel") Integer newLevel);

	public void updateNodeLevel(@Param("orgNo") Integer orgNo, @Param("newLevel") Integer newLevel);

	public List<OrganizationVO> selectAllDepartments(@Param("comNo") int comNo);


}