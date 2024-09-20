package kr.or.ddit.vo.def;

import java.io.Serializable;

import lombok.Data;

@Data
public class GrbAttentionDefaultVO implements Serializable {
    private Long grbAttentionNo;

    private Long grbNo;

    private Long grbAttentionTarget;

    private static final long serialVersionUID = 1L;
}