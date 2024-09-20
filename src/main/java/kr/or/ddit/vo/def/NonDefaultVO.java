package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class NonDefaultVO implements Serializable {
    private BigDecimal nonNo;

    private String nonNm;

    private String nonTitle;

    private String nonContent;

    private Long nonAttachfile;

    private String nonPerinfocollection;

    private String nonStatus;

    private LocalDateTime nonDate;

    private String nonEmail;

    private static final long serialVersionUID = 1L;
}