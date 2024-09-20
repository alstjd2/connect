package kr.or.ddit.vo.def;

import java.io.Serializable;

import lombok.Data;

@Data
public class AddressDefaultVO implements Serializable {
    private Long adrNo;

    private Long empNo;

    private String adrNm;

    private String adrOnepos;

    private String adrPos;

    private String adrDep;

    private String adrAff;

    private String adrMail;

    private String adrTel;

    private String adrDelyn;

    private String adrMarkyn;

    private static final long serialVersionUID = 1L;
}