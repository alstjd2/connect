package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class VacationInfoDefaultVO implements Serializable {
    private Long vaciNo;

    private Long comNo;

    private String vaciNm;

    private LocalDateTime vaciDate;

    private BigDecimal vaciDay;

    private String vaciType;

    private String vaciDelyn;

    private static final long serialVersionUID = 1L;
}