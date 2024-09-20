package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class CerificateDefaultVO implements Serializable {
    private Long certNo;

    private Long empNo;

    private Long comNo;

    private String certKind;

    private LocalDateTime certIdate;

    private String certAmt;

    private String certIsscon;

    private String certPorp;

    private static final long serialVersionUID = 1L;
}