package kr.or.ddit.groupware.address.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.AddressVO;
import kr.or.ddit.vo.EmployeeVO;

@Mapper
public interface AddressMapper {
	/**
	 * 외부연락처 한건 조회
	 * @param adrNo
	 * @return
	 */
	public AddressVO selectAddress(Integer adrNo);

	/**
	 * 외부연락처 조회
	 * @param paging
	 * @return
	 */
	public List<AddressVO> selectAddressList(PaginationInfo paging);
	public List<AddressVO> selectAddressListExcel(Integer EmpNo);

	/**
	 * 외부연락처 등록
	 * @param address
	 * @return
	 */
	public int insertAddress(AddressVO address);

	/**
	 * 외부연락처 수정
	 * @param address
	 * @return
	 */
	public int updateAddress(AddressVO address);

	/**
	 * 외부연락처 삭제
	 * @param address
	 * @return
	 */
	public int deleteAddress(AddressVO address);

	/**
	 * 외부연락처 즐겨찾기 리스트 조회
	 * @param paging
	 * @return
	 */
	public List<AddressVO> selectAddressMarkList(PaginationInfo paging);

	/**
	 * 외부연락처 즐겨찾기 설정 / 해제
	 * @param address
	 * @return
	 */
	public int updateAddressMark(Map<String, Object> params);


	/**
	 * 휴지통 리스트
	 * @param empNo
	 * @return
	 */
	public List<AddressVO> selectTrashList(PaginationInfo paging);

	/**
	 * 휴지통 영구삭제
	 * @param address
	 * @return
	 */
	public int deleteTrash(AddressVO address);

	/**
	 * 휴지통 복구
	 * @param address
	 * @return
	 */
	public int restoreTrash(AddressVO address);

	/**
	 * 외부주소록 페이징
	 * @param paging
	 * @return
	 */
	public int selectTotalRecord(PaginationInfo paging);

	/**
	 * 휴지통 페이징
	 * @param paging
	 * @return
	 */
	public int selectTotalRecordTR(PaginationInfo paging);

	/**
	 * 북마크 페이징
	 * @param paging
	 * @return
	 */
	public int selectTotalRecordMK(PaginationInfo paging);

	public List<AddressVO> mailAddressList(EmployeeVO emp);

}
