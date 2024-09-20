package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class CommoncodeDetailDefaultVO implements Serializable {
    private String conmcdNo;

    private String conmcNo;

    private String conmcdCode;

    private String conmcdCon;

    private LocalDateTime conmcdDate;

    private String conmcdDelyn;

    private static final long serialVersionUID = 1L;
}