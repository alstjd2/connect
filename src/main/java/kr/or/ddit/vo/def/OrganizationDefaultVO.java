package kr.or.ddit.vo.def;

import java.io.Serializable;

import lombok.Data;

@Data
public class OrganizationDefaultVO implements Serializable {
    private Long orgNo;

    private Long comNo;

    private String orgDep;

    private String orgUpdep;

    private String orgLevel;

    private String orgDf;

    private String orgDelyn;

    private static final long serialVersionUID = 1L;
}