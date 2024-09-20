package kr.or.ddit.vo;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import lombok.Data;

@Data
public class CommoncodeVO implements Serializable {
    private String conmcNo;
    private String comncNm;
    private LocalDate conmcDate;
    private String comncDelyn;
    private static final long serialVersionUID = 1L;
    
    // has 관계
    private List<CommoncodeDetailVO> commoncodeDetailList; 
}