package kr.or.ddit.web.offedu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.vo.OffeduVO;
import kr.or.ddit.web.offedu.dao.OffeduMapper;

@Service
public class OffEduServiceImpl implements OffEduService{

	@Autowired
	OffeduMapper offmapper;

	public void insertOffEdu(OffeduVO offEduVo) {
		offmapper.insertOffedu(offEduVo);
	}

}
