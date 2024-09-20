package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class SendDefaultVO implements Serializable {
    private Long sendNo;

    private Long msglogNo;

    private Long msgrmNo;

    private Long empNo;

    private LocalDateTime sendDate;

    private static final long serialVersionUID = 1L;
}