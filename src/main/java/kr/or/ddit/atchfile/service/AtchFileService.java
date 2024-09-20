package kr.or.ddit.atchfile.service;

import java.io.File;

import kr.or.ddit.vo.AtchFileDetailVO;
import kr.or.ddit.vo.AtchFileVO;

/**
 * @author DDIT_CHY
 *
 */
public interface AtchFileService {
	/**
	 * 첨부파일 그룹 저장(메타데이터와 2진 데이터 분리 저장)
	 * @param atchFile 
	 * @param saveFolder 2진 데이터 저장 디렉토리
	 * @throws Exception
	 */
	public void createAtchFile(AtchFileVO atchFile, File saveFolder);

	/**
	 * 사용중인 첨부파일 그룹 조회
	 * @param atchFileId
	 * @param saveFolder  2진 데이터 저장 디렉토리
	 * @return
	 */
	public default AtchFileVO readAtchFileEnable(int atchFileId, File saveFolder) {
		return readAtchFile(atchFileId, true, saveFolder);
	}
	
	/**
	 * 사용 여부에 따른 첨부파일 그룹 조회
	 * @param atchFileId
	 * @param enable
	 * @param saveFolder
	 * @return
	 */
	public AtchFileVO readAtchFile(int atchFileId, boolean enable, File saveFolder);
	
	/**
	 * 첨부파일 한건 조회
	 * @param atchFileId
	 * @param fileSn
	 * @param saveFolder  2진 데이터 저장 디렉토리
	 * @return
	 */
	public AtchFileDetailVO readAtchFileDetail(int atchFileId, int fileSn, File saveFolder);
	
	/**
	 * 파일 한건 삭제 (메타데이터와 2진 데이터 분리 삭제)
	 * @param atchFileId
	 * @param fileSn
	 * @param saveFolder  2진 데이터 저장 디렉토리
	 */
	public void removeAtchFileDetail(int atchFileId, int fileSn, File saveFolder);
	
	/**
	 * 파일 그룹 비활성화
	 * @param atchFildId
	 */
	public void disableAtchFile(int atchFildId);
	
	/**
	 * 사용하지 않는 파일 그룹 제거
	 * @param atchFileId
	 */
	public void removeDiabledAtchFile(int atchFileId);
	
	/**
	 * 첨부파일 한 건을 streFileNm(UUID)을 통해 조회
	 * @param streFileNm
	 * @return
	 */
	public AtchFileDetailVO retrieveAtchFileDetailByUUID(String streFileNm);
	
	/**
	 * 파일 한 건에 대한 다운로드
	 * @param atchFileId
	 * @param fileSn
	 * @return
	 */
	public AtchFileDetailVO download(int atchFileId, int fileSn, File saveFolder);
	
	
	/**
	 * 파일 번호(PK) 최대값 조회
	 * @return
	 */
	public int retrieveAtchFileMaxId();
	
}



















