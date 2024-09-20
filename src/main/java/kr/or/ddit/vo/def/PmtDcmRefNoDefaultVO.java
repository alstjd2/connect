package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class PmtDcmRefNoDefaultVO implements Serializable {
    private Long pmtDcmRefNo;

    private Long pmtDcmNo;

    private Long pmtDcmRefEmpNo;

    private String pmtDcmRefCmt;

    private LocalDateTime pmtDcmRefCmtDate;

    private static final long serialVersionUID = 1L;
}