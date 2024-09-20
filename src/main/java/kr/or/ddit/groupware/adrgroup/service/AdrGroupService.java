package kr.or.ddit.groupware.adrgroup.service;

import java.util.List;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.AdrGroupVO;

public interface AdrGroupService {
	/**
	 * 그룹 상세 조회
	 * @param grpNo 조회할 그룹의 PK
	 * @return 존재하지 않는다면, {@link PkNotFoundException}
	 */
	public AdrGroupVO retrieveGroup(Integer grpNo) throws PkNotFoundException;
	public List<AdrGroupVO> retrieveGroupList(PaginationInfo paging);
	public int createGroup(AdrGroupVO group);
	public void modifyGroup(AdrGroupVO group);
	public void removeGroup(AdrGroupVO group);

}
