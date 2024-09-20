package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class BoardDefaultVO implements Serializable {
    private Long boardNo;

    private Long memNo;

    private String boardTitle;

    private String boardContent;

    private Long boardAttachfile;

    private LocalDateTime boardDate;

    private String boardDelyn;

    private String boardType;

    private String boardGuideType;

    private static final long serialVersionUID = 1L;
}