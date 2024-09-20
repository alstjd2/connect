package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class CommoncodeDefaultVO implements Serializable {
    private String conmcNo;

    private String comncNm;

    private LocalDateTime conmcDate;

    private String comncDelyn;

    private static final long serialVersionUID = 1L;
}