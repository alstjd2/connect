package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class AdrgroupDefaultVO implements Serializable {
    private Long grpNo;

    private Long empNo;

    private String grpNm;

    private String grpCm;

    private LocalDateTime grpDate;

    private String grpDelyn;

    private static final long serialVersionUID = 1L;
}