package kr.or.ddit.groupware.company.service;

import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.CompanyVO;

public interface CompanyService {
	
	public CompanyVO retrieveCompany(int comNo) throws PkNotFoundException;
	/**
	 * 기업 정보 조회
	 * @author 이희진
	 * @param comNo
	 * @return
	 * @throws PkNotFoundException
	 */
	public CompanyVO retrieveCompanyInfo(int comNo) throws PkNotFoundException;
	/**
	 * 기업정보 수정
	 * @author 이희진
	 * @param company
	 */
	public void modifyCompanyInfo(CompanyVO company);
	/**
	 * 기업브랜드 수정
	 * @author 이희진
	 * @param company
	 */
	public void modifyCompanyBrand(CompanyVO company);
	/**
	 * 기업레이아웃 수정
	 * @author 이희진
	 * @param company
	 */
	public void modifyCompanyLayout(CompanyVO company);
	/**
	 * 기업테마 수정
	 * @author 이희진
	 * @param company
	 */
	public void modifyCompanyTheme(CompanyVO company);
	
	/**
	 * 기업 신규등록
	 * @param company
	 * @return
	 */
	public ServiceResult createCompany(CompanyVO company);

}
