package kr.or.ddit.vo.def;

import java.io.Serializable;

import lombok.Data;

@Data
public class TdriveDirectoryDefaultVO implements Serializable {
    private Long tddirNo;

    private Long empNo;

    private String tddirNm;

    private String tddirPath;

    private static final long serialVersionUID = 1L;
}