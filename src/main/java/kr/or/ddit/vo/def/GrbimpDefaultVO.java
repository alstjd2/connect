package kr.or.ddit.vo.def;

import java.io.Serializable;

import lombok.Data;

@Data
public class GrbimpDefaultVO implements Serializable {
    private Long grbimpNo;

    private Long grbNo;

    private Long empNo;

    private static final long serialVersionUID = 1L;
}