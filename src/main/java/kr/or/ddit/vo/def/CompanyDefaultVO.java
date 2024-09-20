package kr.or.ddit.vo.def;

import java.io.Serializable;

import lombok.Data;

@Data
public class CompanyDefaultVO implements Serializable {
    private Long comNo;

    private Long memNo;

    private String comNm;

    private String comBsnm;

    private String comBsno;

    private String comAdr;

    private String comTel;

    private Long comClogo;

    private Long comWlogo;

    private Long comFavicon;

    private Long comOg;

    private Long comCorno;

    private String comGu;

    private Long comSapr;

    private static final long serialVersionUID = 1L;
}