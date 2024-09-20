package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class ErivelogDefaultVO implements Serializable {
    private Long drivelogNo;

    private Long eddirNo;

    private LocalDateTime drivelogDate;

    private String drivelogCon;

    private Long empNo;

    private String drivelogState;

    private static final long serialVersionUID = 1L;
}