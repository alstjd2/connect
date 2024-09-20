package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class PmtDcmDefaultVO implements Serializable {
    private Long pmtDcmNo;

    private Long comdcmNumNo;

    private Long dcmFormNo;

    private String pmtDcmStaNo;

    private Long pmtLineNo;

    private String pmtDcmTitle;

    private Long pmtDcmAttno;

    private Long pmtRetDcmNo;

    private String pmtDcmTepSaveYn;

    private Long pmtDcmEmpno;

    private LocalDateTime pmtDcmSaveDate;

    private Long pmtDcmPrePos;

    private Long pmtDcmRecEmpno;

    private String pmtDcmContent;

    private static final long serialVersionUID = 1L;
}