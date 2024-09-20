package kr.or.ddit.vo.def;

import java.io.Serializable;

import lombok.Data;

@Data
public class BuyListDefaultVO implements Serializable {
    private Long buyNo;

    private Long comNo;

    private Long prodNo;

    private String buyDate;

    private String buyUseStartDate;

    private String buyUseEndDate;

    private String buyRefn;

    private String buyCardNo;

    private String buyBankNm;

    private String buyCardNm;

    private static final long serialVersionUID = 1L;
}