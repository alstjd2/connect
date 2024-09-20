package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class ConferenceLogDefaultVO implements Serializable {
    private Long conlogNo;

    private Long conparNo;

    private Long conNo;

    private String conlogType;

    private String conlogMsg;

    private LocalDateTime conlogAt;

    private static final long serialVersionUID = 1L;
}