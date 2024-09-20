package kr.or.ddit.vo;

import java.time.LocalDate;
import java.util.List;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class SvyAnsVO {
	
	@NotBlank
	private int svyAnsNo;
	@NotBlank
	private int svyNo;
	@NotBlank
	private int empNo;
	
	private String profileImg;
	private String empNm;
	private String empDepNm;
	private String empPosNm;
	private String empOneposNm;

	@DateTimeFormat(iso = ISO.DATE) 
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private LocalDate svyAnsDate; // data타입 localdate로 했어요! 
	
//	private SvyVO랑 1:1 has a 관계
	private SvyVO svy;
	
	private List<SvyAnsListVO> svyAnsListList; // SvyAnsListVO has many 관계 , 특정질문해당하는 현재 응답자의 선택 항목들 
	
	private EmployeeVO employee;
	
	private List<ChiVO> chiList;
	private List<ClsVO> clsList;
	
}
