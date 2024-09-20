package kr.or.ddit.groupware.drive.service;

import java.util.List;

import kr.or.ddit.vo.AtchFileDetailVO;
import kr.or.ddit.vo.EdrivelogVO;

public interface EdriveService {
	
	/**
	 * 직원 한 명의 드라이브 사용기록 리스트 조회
	 * @return
	 */
	public List<EdrivelogVO> retrieveEdrivelogListByEmpNo(int empNo);
	
	/**
	 * 개인 드라이브 파일 및 폴더의 사용기록 등록
	 * @param file
	 * @param state
	 */
	public void createEdrivelogByFile(AtchFileDetailVO file, String state, String viewpath);
	public void createEdrivelogByFile(AtchFileDetailVO file, String state, String viewpath, String con);

}
