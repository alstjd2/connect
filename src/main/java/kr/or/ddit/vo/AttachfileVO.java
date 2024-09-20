package kr.or.ddit.vo;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import lombok.Data;

@Data
public class AttachfileVO implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int attNo;
	private String attDelyn;
	private LocalDate attStart;
	private LocalDate attEnd;
	
	private List<AttDetailVO> AttDetailList;
}
