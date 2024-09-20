package kr.or.ddit.vo.def;

import java.io.Serializable;

import lombok.Data;

@Data
public class ComdcmFormDefaultVO implements Serializable {
    private Long dcmFormNo;

    private Long dcmCtgNo;

    private String dcmFormNm;

    private String dcmFormCode;

    private String dcmFormTitle;

    private String dcmFormFilesYn;

    private String dcmFormCnt;

    private static final long serialVersionUID = 1L;
}