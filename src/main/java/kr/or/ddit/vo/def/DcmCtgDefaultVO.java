package kr.or.ddit.vo.def;

import java.io.Serializable;

import lombok.Data;

@Data
public class DcmCtgDefaultVO implements Serializable {
    private Long dcmCtgNo;

    private String dcmCtgNm;

    private static final long serialVersionUID = 1L;
}