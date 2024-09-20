package kr.or.ddit.vo;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class SvyAskVO {
	
	@NotBlank
	private int svyAskNo;
	@NotBlank
	private int svyNo;
	@NotBlank
	private int empNo;
	
	@DateTimeFormat(iso = ISO.DATE) 
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private LocalDate svyAskDate;
	
	// svyVO랑 has a 관계 
	private SvyVO svy;
	
}
