package kr.or.ddit.vo.def;

import java.io.Serializable;

import lombok.Data;

@Data
public class ChiDefaultVO implements Serializable {
    private Long chiNo;

    private Long svyNo;

    private String chiNm;

    private String chiOvlYn;

    private static final long serialVersionUID = 1L;
}