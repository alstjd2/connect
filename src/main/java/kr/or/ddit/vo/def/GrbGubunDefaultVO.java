package kr.or.ddit.vo.def;

import java.io.Serializable;

import lombok.Data;

@Data
public class GrbGubunDefaultVO implements Serializable {
    private Long grbGubunNo;

    private Long comNo;

    private String grbGubunTitle;

    private String grbDelyn;

    private static final long serialVersionUID = 1L;
}