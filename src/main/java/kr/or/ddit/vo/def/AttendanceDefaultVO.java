package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class AttendanceDefaultVO implements Serializable {
    private Long attNo;

    private Long empNo;

    private LocalDateTime attStart;

    private LocalDateTime attEnd;

    private String attStae;

    private static final long serialVersionUID = 1L;
}