package kr.or.ddit.vo.def;

import java.io.Serializable;

import lombok.Data;

@Data
public class RefnListDefaultVO implements Serializable {
    private Long buyNo;

    private String refnDate;

    private String refnChkDate;

    private String refnDetailContent;

    private String refnStatus;

    private Short comNo;

    private static final long serialVersionUID = 1L;
}