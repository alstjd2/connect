package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class AlaramDefaultVO implements Serializable {
    private Long alaramNo;

    private Long empNo;

    private Long comNo;

    private String alaramComncode;

    private String alaramChk;

    private LocalDateTime alaramDate;

    private String alaramHeader;

    private static final long serialVersionUID = 1L;
}