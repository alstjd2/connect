package kr.or.ddit.vo.def;

import java.io.Serializable;

import lombok.Data;

@Data
public class ClsDefaultVO implements Serializable {
    private Long clsNo;

    private Long chiNo;

    private String clsCnt;

    private Long clsImg;

    private static final long serialVersionUID = 1L;
}