package kr.or.ddit.vo.def;

import java.io.Serializable;

import lombok.Data;

@Data
public class AbsenceDefaultVO implements Serializable {
    private Long abNo;

    private Long comNo;

    private String abContent;

    private static final long serialVersionUID = 1L;
}