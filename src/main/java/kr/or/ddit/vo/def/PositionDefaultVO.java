package kr.or.ddit.vo.def;

import java.io.Serializable;

import lombok.Data;

@Data
public class PositionDefaultVO implements Serializable {
    private Long posNo;

    private Long comNo;

    private String posNm;

    private String posType;

    private static final long serialVersionUID = 1L;
}