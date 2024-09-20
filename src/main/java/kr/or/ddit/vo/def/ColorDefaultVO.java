package kr.or.ddit.vo.def;

import java.io.Serializable;

import lombok.Data;

@Data
public class ColorDefaultVO implements Serializable {
    private Long corNo;

    private String corNm;

    private Short corHsla;

    private static final long serialVersionUID = 1L;
}