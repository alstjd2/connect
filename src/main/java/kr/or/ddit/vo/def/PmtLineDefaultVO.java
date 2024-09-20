package kr.or.ddit.vo.def;

import java.io.Serializable;

import lombok.Data;

@Data
public class PmtLineDefaultVO implements Serializable {
    private Long pmtLineNo;

    private Long empNo;

    private Long comNo;

    private Long pmtLineOneId;

    private Long pmtLineTwoId;

    private Long pmtLineThreeId;

    private Long pmtLineFourId;

    private Long pmtLineFiveId;

    private String pmtLineYn;

    private static final long serialVersionUID = 1L;
}