package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class GrboardDefaultVO implements Serializable {
    private Long grbNo;

    private Long empNo;

    private Long comNo;

    private Long grbGubunNo;

    private LocalDateTime grbNewPost;

    private String grbTitle;

    private String grbContent;

    private Long grbAttachfile;

    private LocalDateTime grbDate;

    private String grbDelyn;

    private LocalDateTime grbStart;

    private LocalDateTime grbEnd;

    private String grbAttentionYn;

    private static final long serialVersionUID = 1L;
}