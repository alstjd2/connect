package kr.or.ddit.vo.def;

import java.io.Serializable;

import lombok.Data;

@Data
public class OffeduDefaultVO implements Serializable {
    private Long offeduNo;

    private Long promoNo;

    private Long memNo;

    private String offeduComnm;

    private Long offeduOfferNum;

    private static final long serialVersionUID = 1L;
}