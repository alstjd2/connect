package kr.or.ddit.groupware.company.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.BookMarkVO;
import kr.or.ddit.vo.CompanyVO;

@Mapper
public interface CompanyMapper {

	public int insertCompany(CompanyVO company);

	public List<CompanyVO> selectCompanyList();

	public CompanyVO selectCompany(int comNo);

	public int updateCompany(CompanyVO company);
	/**
	 * 기업 정보 조회
	 * @author 이희진
	 * @param comNo
	 * @return
	 */
	public CompanyVO selectCompanyInfo(int comNo);

	/**
	 * 기업정보를 수정
	 * @author 이희진
	 * @param company
	 * @return
	 */
	public int updateCompanyInfo(CompanyVO company);

	/**
	 * 기업 브랜드 정보를 수정
	 * @author 이희진
	 * @param company
	 * @return
	 */
	public int updateCompanyBrand(CompanyVO company);
	/**
	 * 기업 레이아웃 정보를 수정
	 * @author 이희진
	 * @param company
	 * @return
	 */
	public int updateCompanyLayout(CompanyVO company);
	/**
	 * 기업 테마 정보를 수정
	 * @author 이희진
	 * @param company
	 * @return
	 */
	public int updateCompanyTheme(CompanyVO company);


    public int deleteCompany(int comNo);


    /**
     * 기업의 회의실 리스트 조회
     * @return
     */
    public List<CompanyVO> selectRoomList();

    /**
     * 매출통계 페이지에서 기업관련 통계를 위한 조회
     * @return
     */
    public CompanyVO selectCntCom();
    public CompanyVO selectCntUseCom();

    /**
     * 기업등록 확인을 위한 기업번호 조회
     * @param memNo
     * @return
     */
    public int selectComNo(int memNo);
}