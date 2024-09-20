package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class MsglogDefaultVO implements Serializable {
    private Long msglogNo;

    private Long msgrmNo;

    private String msglogContent;

    private LocalDateTime msglogWtdate;

    private Long msglogAttNo;

    private static final long serialVersionUID = 1L;
}