package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class SendMailDefaultVO implements Serializable {
    private Long sendNo;

    private Long mailNo;

    private Long empNo;

    private LocalDateTime sendDate;

    private String mailDel;

    private String mailDelDate;

    private static final long serialVersionUID = 1L;
}