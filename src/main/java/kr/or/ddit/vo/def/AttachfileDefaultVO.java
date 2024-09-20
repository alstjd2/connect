package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class AttachfileDefaultVO implements Serializable {
    private Long attNo;

    private String attDelyn;

    private LocalDateTime attStart;

    private LocalDateTime attEnd;

    private static final long serialVersionUID = 1L;
}