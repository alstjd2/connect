package kr.or.ddit.vo.def;

import java.io.Serializable;

import lombok.Data;

@Data
public class TdriveEmplistDefaultVO implements Serializable {
    private Long tdempEmpno;

    private Long tddirNo;

    private String tdempLevel;

    private static final long serialVersionUID = 1L;
}