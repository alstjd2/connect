package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class PromotionDefaultVO implements Serializable {
    private Long promoNo;

    private Long boardNo;

    private LocalDateTime promoStdate;

    private LocalDateTime promoEnddate;

    private String promoProgdmet;

    private String promoProgcheck;

    private static final long serialVersionUID = 1L;
}