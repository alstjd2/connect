package kr.or.ddit.vo.def;

import java.io.Serializable;

import lombok.Data;

@Data
public class SvyAnsListDefaultVO implements Serializable {
    private Long svyNo;

    private Long svyAnsNo;

    private Long clsNo;

    private static final long serialVersionUID = 1L;
}