package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class PmtDcmAppDefaultVO implements Serializable {
    private Long pmtDcmAppNo;

    private Long pmtDcmNo;

    private Long pmtDcmAppEmpId;

    private String pmtDcmStaNo;

    private LocalDateTime pmtDcmAppDate;

    private String pmtDcmAppCmt;

    private static final long serialVersionUID = 1L;
}