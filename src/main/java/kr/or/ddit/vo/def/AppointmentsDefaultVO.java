package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class AppointmentsDefaultVO implements Serializable {
    private Long apmNo;

    private Long empNo;

    private Long comNo;

    private Long apmWriter;

    private LocalDateTime apmDate;

    private LocalDateTime apmEndate;

    private String apmType;

    private String apmContent;

    private String apmDelyn;

    private static final long serialVersionUID = 1L;
}