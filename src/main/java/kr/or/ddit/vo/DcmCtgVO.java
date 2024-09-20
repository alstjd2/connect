package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

/**
 * 문서 카테고리
 */
@Data
public class DcmCtgVO {
	/**
	 * 문서 카테고리 번호
	 */
	private String dcmCtgNo;
	/**
	 * 문서 카테고리 이름
	 */
	private String dcmCtgNm;
	
	/**
	 * 문서서식VO
	 */
	private List<ComdcmFormVO> comdcmFormList;
}
