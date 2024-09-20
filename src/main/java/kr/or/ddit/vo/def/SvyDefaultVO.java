package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class SvyDefaultVO implements Serializable {
    private Long svyNo;

    private Long comNo;

    private String svyTemYn;

    private String svyImpYn;

    private String svyAnyYn;

    private String svyAllYn;

    private String svyNm;

    private LocalDateTime svyStrDate;

    private LocalDateTime svyEndDate;

    private static final long serialVersionUID = 1L;
}