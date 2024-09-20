package kr.or.ddit.vo.def;

import java.io.Serializable;

import lombok.Data;

@Data
public class ErrAdminDefaultVO implements Serializable {
    private Long errAdminNo;

    private Long errNo;

    private String errProgress;

    private String errContent;

    private static final long serialVersionUID = 1L;
}