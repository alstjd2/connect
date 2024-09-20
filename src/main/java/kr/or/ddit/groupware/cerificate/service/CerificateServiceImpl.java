package kr.or.ddit.groupware.cerificate.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.groupware.cerificate.dao.CerificateMapper;
import kr.or.ddit.vo.CerificateVO;

@Service
public class CerificateServiceImpl implements CerificateService {

	@Autowired
	private CerificateMapper dao;

	@Override
	public List<CerificateVO> retrieveCerificateList(int comNo) {
		 return dao.selectCerificateList(comNo);
	}

}
