package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class RecieveDefaultVO implements Serializable {
    private Long recvNo;

    private Long msglogNo;

    private Long msgrmNo;

    private Long empNo;

    private String recvCheck;

    private LocalDateTime recvDate;

    private static final long serialVersionUID = 1L;
}