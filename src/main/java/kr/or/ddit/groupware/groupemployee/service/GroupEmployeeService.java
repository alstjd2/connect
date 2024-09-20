package kr.or.ddit.groupware.groupemployee.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.vo.GroupEmployeeVO;

public interface GroupEmployeeService {
	/**
	 * 그룹구성원 상세 조회
	 * @param grpNo 조회할 그룹구성원의 PK
	 * @return 존재하지 않는다면, {@link PkNotFoundException}
	 */
	public GroupEmployeeVO retrieveGroupEmployee(@Param("empNo") Integer empNo, @Param("grpNo")int grpNo) throws PkNotFoundException;
	public List<GroupEmployeeVO> retrieveGroupEmployeeList(Integer grpNo);
//	public void createGroupEmployee(GroupEmployeeVO groupemployee);
	public void createGroupEmployee(int grpNo, List<Integer> empNos);
	public void modifyGroupEmployee(GroupEmployeeVO groupemployee);
	public void removeGroupEmployee(Integer grpNo);

}
