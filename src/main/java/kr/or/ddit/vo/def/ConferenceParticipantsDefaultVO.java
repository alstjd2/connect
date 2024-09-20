package kr.or.ddit.vo.def;

import java.io.Serializable;

import lombok.Data;

@Data
public class ConferenceParticipantsDefaultVO implements Serializable {
    private Long conparNo;

    private Long conNo;

    private Long conparEmpno;

    private static final long serialVersionUID = 1L;
}