package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class SvyAnsDefaultVO implements Serializable {
    private Long svyAnsNo;

    private Long svyNo;

    private Long empNo;

    private LocalDateTime svyAnsDate;

    private static final long serialVersionUID = 1L;
}