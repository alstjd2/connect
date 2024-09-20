package kr.or.ddit.vo.def;

import java.io.Serializable;

import lombok.Data;

@Data
public class EddirDefaultVO implements Serializable {
    private Long eddirNo;

    private Long empNo;

    private String eddirNm;

    private String eddirPath;

    private static final long serialVersionUID = 1L;
}