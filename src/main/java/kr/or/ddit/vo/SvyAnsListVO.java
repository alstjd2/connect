package kr.or.ddit.vo;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = {"svyAnsNo", "clsNo"})
public class SvyAnsListVO {
	
	@NotBlank
	private int svyNo;
	@NotBlank
	private int svyAnsNo;
	@NotBlank
	private int clsNo;
	
	
	// has a 관계 
	private SvyAnsVO svyAns; 
	
	// cls 랑 has a 관계
	private ClsVO cls;
	
}
