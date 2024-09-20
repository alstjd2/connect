package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class ProdListDefaultVO implements Serializable {
    private Long prodNo;

    private String prodNm;

    private Long prodPrice;

    private String prodEventNm;

    private String prodAvail;

    private LocalDateTime prodCreDate;

    private String prodEvenStart;

    private String prodEvnEnd;

    private String prodDetailContent1;

    private String prodDetailContent2;

    private static final long serialVersionUID = 1L;
}