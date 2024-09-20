package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class ApplicationDefaultVO implements Serializable {
    private Long appNo;

    private Long empNo;

    private Long vaciNo;

    private LocalDateTime appStrdate;

    private LocalDateTime appEnddate;

    private Long appTememp;

    private String appDetail;

    private String appDep;

    private LocalDateTime appDate;

    private Long appRovemp;

    private String appState;

    private static final long serialVersionUID = 1L;
}