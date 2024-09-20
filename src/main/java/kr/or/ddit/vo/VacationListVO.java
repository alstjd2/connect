package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

@Data
public class VacationListVO {
// comNo 받아오기
	private int comNo;

	private List<VacationInfoVO> vacationList;

}
