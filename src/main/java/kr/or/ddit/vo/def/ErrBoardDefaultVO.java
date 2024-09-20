package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.math.BigDecimal;

import lombok.Data;

@Data
public class ErrBoardDefaultVO implements Serializable {
    private BigDecimal errNo;

    private BigDecimal memNo;

    private String errWorkProgress;

    private String errTitle;

    private String errLoc;

    private String errIncidentDescription;

    private String errContent;

    private static final long serialVersionUID = 1L;
}