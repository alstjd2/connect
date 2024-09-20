package kr.or.ddit.groupware.cerificate.service;

import java.util.List;

import kr.or.ddit.vo.CerificateVO;

public interface CerificateService {
	List<CerificateVO> retrieveCerificateList(int comNo);
}
