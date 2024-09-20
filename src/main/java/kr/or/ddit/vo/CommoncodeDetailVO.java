package kr.or.ddit.vo;

import java.io.Serializable;
import java.time.LocalDate;

import lombok.Data;

@Data
public class CommoncodeDetailVO implements Serializable {
    /**
     * 공통코드상세번호
     */
    private String conmcdNo;   // ex) FB03110
    /**
     * 공통코드분류번호
     */
    private String conmcNo;
    /**
     * 공통코드상세명
     */
    private String conmcdCode; // ex) 관리자
    /**
     * 공통코드설명
     */
    private String conmcdCon;
    /**
     * 등록일시
     */
    private LocalDate conmcdDate;
    /**
     * 사용여부
     */
    private String conmcdDelyn;
    private static final long serialVersionUID = 1L;

    // has 관계
    private CommoncodeVO commoncode;
}