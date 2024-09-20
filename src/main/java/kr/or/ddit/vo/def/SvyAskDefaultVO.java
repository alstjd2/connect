package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class SvyAskDefaultVO implements Serializable {
    private Long svyAskNo;

    private Long svyNo;

    private Long empNo;

    private LocalDateTime svyAskDate;

    private static final long serialVersionUID = 1L;
}