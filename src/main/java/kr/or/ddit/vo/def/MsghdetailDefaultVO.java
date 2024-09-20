package kr.or.ddit.vo.def;

import java.io.Serializable;

import lombok.Data;

@Data
public class MsghdetailDefaultVO implements Serializable {
    private Long msghdNo;

    private Long msgrmNo;

    private Long msghdEmpno;

    private static final long serialVersionUID = 1L;
}