package kr.or.ddit.groupware.address.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.AddressVO;

public interface AddressService {
	/**
	 * 외부연락처 상세 조회
	 * @param adrNo 조회할 외부연락처의 PK
	 * @return 존재하지 않는다면, {@link PkNotFoundException}
	 */
	public AddressVO retrieveAddress(Integer adrNo) throws PkNotFoundException;
	/**
	 * 외부연락처 리스트 조회
	 * @param paging
	 * @return
	 */
	public List<AddressVO> retrieveAddressList(PaginationInfo paging);
	public List<AddressVO> retrieveAddressListExcel(Integer empNo);
	
	public void createAddress(AddressVO address);
	public void modifyAddress(AddressVO address);
	public void removeAddress(AddressVO address);
	
	public void removeTrash(AddressVO address);
	public void restoreTrash(AddressVO address);

	public List<AddressVO> retrieveTrashList(PaginationInfo paging);
	
	public List<AddressVO> retrieveBookmarkList(PaginationInfo paging);
	
	public void modifyAddressMark(Map<String, Object> params);
}
