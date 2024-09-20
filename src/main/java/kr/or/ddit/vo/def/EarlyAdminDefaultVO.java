package kr.or.ddit.vo.def;

import java.io.Serializable;

import lombok.Data;

@Data
public class EarlyAdminDefaultVO implements Serializable {
    private Long earlyAdminNo;

    private Long earlyNo;

    private String earlyYn;

    private static final long serialVersionUID = 1L;
}