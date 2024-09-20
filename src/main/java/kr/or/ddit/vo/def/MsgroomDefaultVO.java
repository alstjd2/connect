package kr.or.ddit.vo.def;

import java.io.Serializable;

import lombok.Data;

@Data
public class MsgroomDefaultVO implements Serializable {
    private Long msgrmNo;

    private Long empNo;

    private Long msgrmHcount;

    private String msgrmNm;

    private Long msghdNo;

    private String msgrmArray;

    private static final long serialVersionUID = 1L;
}