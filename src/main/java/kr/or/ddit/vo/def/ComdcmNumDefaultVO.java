package kr.or.ddit.vo.def;

import java.io.Serializable;

import lombok.Data;

@Data
public class ComdcmNumDefaultVO implements Serializable {
    private Long comdcmNumNo;

    private Long comNo;

    private String dcmNumCnfNo;

    private String dateCnfNo;

    private String dcmDisCnfNo;

    private String dcmNumLen;

    private static final long serialVersionUID = 1L;
}