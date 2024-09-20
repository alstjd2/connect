package kr.or.ddit.groupware.address.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.groupware.address.dao.AddressMapper;
import kr.or.ddit.groupware.alarm.controller.NewAlarmController;
import kr.or.ddit.vo.AddressVO;

@Service
public class AddressServiceImpl implements AddressService {
	
	@Autowired
	private AddressMapper mapper;
	

	@Override
	public AddressVO retrieveAddress(Integer adrNo) throws PkNotFoundException {
		AddressVO address = mapper.selectAddress(adrNo);
		if(address==null)
			throw new PkNotFoundException(adrNo);
		return address;
	}

	@Override
	public List<AddressVO> retrieveAddressList(PaginationInfo paging) {
		int totalRecord = mapper.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return mapper.selectAddressList(paging);
	}
	@Override
	public List<AddressVO> retrieveAddressListExcel(Integer empno) {
		
		return mapper.selectAddressListExcel(empno);
	}


	@Override
	public void createAddress(AddressVO address) {
		mapper.insertAddress(address);
		

	}

	@Override
	public void modifyAddress(AddressVO address) {
		mapper.updateAddress(address);

	}

	@Override
	public void removeAddress(AddressVO address) {
		mapper.deleteAddress(address);
		
	}

	@Override
	public List<AddressVO> retrieveTrashList(PaginationInfo paging) {
		int totalRecord = mapper.selectTotalRecordTR(paging);
		paging.setTotalRecord(totalRecord);
		return mapper.selectTrashList(paging);
	}

	@Override
	public void removeTrash(AddressVO address) {
		mapper.deleteTrash(address);
		
	}

	@Override
	public void restoreTrash(AddressVO address) {
		mapper.restoreTrash(address);
		
	}
	
	@Override
	public List<AddressVO> retrieveBookmarkList(PaginationInfo paging) {
		int totalRecord = mapper.selectTotalRecordMK(paging);
		paging.setTotalRecord(totalRecord);
		return mapper.selectAddressMarkList(paging);
	}

	@Override
	public void modifyAddressMark(Map<String, Object> params) {
		mapper.updateAddressMark(params);
		
	}
	
}
