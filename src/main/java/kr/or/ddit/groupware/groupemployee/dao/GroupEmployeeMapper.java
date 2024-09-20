package kr.or.ddit.groupware.groupemployee.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.GroupEmployeeVO;

@Mapper
public interface GroupEmployeeMapper {
	public GroupEmployeeVO selectGroupEmployee(GroupEmployeeVO groupEmployee);
	public List<GroupEmployeeVO> selectGroupEmployeeList(Integer grpNo);
//	public int insertGroupEmployee(GroupEmployeeVO groupEmployee);
	public int updateGroupEmployee(GroupEmployeeVO groupEmployee);
	public int deleteGroupEmployee(Integer grpNo);
	public int selectTotalRecord(PaginationInfo paging);
	public int insertGroupEmployee(GroupEmployeeVO groupEmployee);

}
