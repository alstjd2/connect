package kr.or.ddit.groupware.adrgroup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.groupware.adrgroup.dao.AdrGroupMapper;
import kr.or.ddit.vo.AdrGroupVO;

@Service
public class AdrGroupServiceImpl implements AdrGroupService {
	@Autowired
	private AdrGroupMapper mapper;

	@Override
	public AdrGroupVO retrieveGroup(Integer grpNo) throws PkNotFoundException {
		AdrGroupVO group = mapper.selectGroup(grpNo);
		if(group==null)
			throw new PkNotFoundException(grpNo);
		return group;
	}

	@Override
	public List<AdrGroupVO> retrieveGroupList(PaginationInfo paging) {
		int totalRecord = mapper.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return mapper.selectGroupList(paging);
	}

	@Override
	public int createGroup(AdrGroupVO group) {
		mapper.insertGroup(group);
		return group.getGrpNo();

	}

	@Override
	public void modifyGroup(AdrGroupVO group) {
		mapper.updateGroup(group);

	}

	@Override
	public void removeGroup(AdrGroupVO group) {
		mapper.deleteGroup(group);

	}

}
