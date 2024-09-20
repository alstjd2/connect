package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class MailDefaultVO implements Serializable {
    private Long mailNo;

    private String mailTitle;

    private Long mailRef;

    private Long mailFileId;

    private LocalDateTime mailDate;

    private String mailStatus;

    private String mailContent;

    private static final long serialVersionUID = 1L;
}