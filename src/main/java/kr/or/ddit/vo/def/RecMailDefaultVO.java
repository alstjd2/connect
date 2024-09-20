package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class RecMailDefaultVO implements Serializable {
    private Long recNo;

    private Long recMailNo;

    private Long empNo;

    private LocalDateTime recDate;

    private String recChk;

    private String recSpam;

    private String recDel;

    private String recDelDate;

    private Long recSendGubun;

    private static final long serialVersionUID = 1L;
}