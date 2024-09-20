package kr.or.ddit.groupware.drive.service;

import java.util.List;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import kr.or.ddit.groupware.drive.dao.EdriveMapper;
import kr.or.ddit.vo.AtchFileDetailVO;
import kr.or.ddit.vo.EdrivelogVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class EdriveServiceImpl implements EdriveService {
	@Autowired
	private EdriveMapper edriveMapper;

	@Override
	public List<EdrivelogVO> retrieveEdrivelogListByEmpNo(int empNo) {
		return edriveMapper.selectEdriveLogListByEmpNo(empNo);
	}

	@Override
	public void createEdrivelogByFile(AtchFileDetailVO file, String state, String viewpath) {
		EdrivelogVO edrivelog = new EdrivelogVO();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
		
		edrivelog.setEmpNo(empAuth.getRealUser().getEmpNo());
		edrivelog.setEdrivelogState(state);
		edrivelog.setEdrivelogFileNm(FilenameUtils.removeExtension(file.getOrignlFileNm()));
		edrivelog.setEdrivelogFileExtsn(file.getFileExtsn());
		edrivelog.setEdrivelogFileFancysize(file.getFileFancysize());
		edrivelog.setEdrivelogViewpath(viewpath);
		
		int result = edriveMapper.insertEdrivelogByFile(edrivelog);
		
		if(result > 0) {
			log.info("내드라이브 기록 등록 성공 => mybatis 반환값: {}", result);
		}else {
			log.info("내드라이브 기록 등록 실패 => mybatis 반환값: {}", result);
		}
	}

	@Override
	public void createEdrivelogByFile(AtchFileDetailVO file, String state, String viewpath, String con) {
		EdrivelogVO edrivelog = new EdrivelogVO();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		EmployeeVOWrapper empAuth = (EmployeeVOWrapper) auth.getPrincipal();
		
		edrivelog.setEmpNo(empAuth.getRealUser().getEmpNo());
		edrivelog.setEdrivelogState(state);
		edrivelog.setEdrivelogFileNm(FilenameUtils.removeExtension(file.getOrignlFileNm()));
		edrivelog.setEdrivelogFileExtsn(file.getFileExtsn());
		edrivelog.setEdrivelogFileFancysize(file.getFileFancysize());
		edrivelog.setEdrivelogViewpath(viewpath);
		edrivelog.setEdrivelogCon(con);
		
		int result = edriveMapper.insertEdrivelogByFile(edrivelog);
		
		if(result > 0) {
			log.info("내드라이브 기록 등록 성공 => mybatis 반환값: {}", result);
		}else {
			log.info("내드라이브 기록 등록 실패 => mybatis 반환값: {}", result);
		}
	}
}
