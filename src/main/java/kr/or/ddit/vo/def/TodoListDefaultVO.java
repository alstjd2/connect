package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class TodoListDefaultVO implements Serializable {
    private Long todoNo;

    private Long empNo;

    private String todoCode;

    private String todoTitle;

    private String todoContent;

    private LocalDateTime todoDate;

    private String todoState;

    private Long todoAttachfile;

    private LocalDateTime todoStart;

    private LocalDateTime todoEnd;

    private Long todoRoom;

    private Long todoConno;

    private static final long serialVersionUID = 1L;
}