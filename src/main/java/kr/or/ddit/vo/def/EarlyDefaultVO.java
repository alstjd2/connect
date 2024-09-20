package kr.or.ddit.vo.def;

import java.io.Serializable;

import lombok.Data;

@Data
public class EarlyDefaultVO implements Serializable {
    private Long earlyNo;

    private String comNm;

    private String earlyPerinfocollection;

    private String earlyEmail;

    private String earlyPhone;

    private static final long serialVersionUID = 1L;
}