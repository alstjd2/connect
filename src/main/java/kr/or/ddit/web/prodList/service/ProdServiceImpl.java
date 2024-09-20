package kr.or.ddit.web.prodList.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.web.prodList.dao.ProdListMapper;

@Service
public class ProdServiceImpl implements ProdService {

	@Autowired
	ProdListMapper prodMapper;

}
