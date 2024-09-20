package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class ConferenceDefaultVO implements Serializable {
    private Long conNo;

    private Long empNo;

    private String conId;

    private String conPw;

    private String conTopic;

    private LocalDateTime conStart;

    private Short conDur;

    private String conUrl;

    private LocalDateTime conCrat;

    private static final long serialVersionUID = 1L;
}