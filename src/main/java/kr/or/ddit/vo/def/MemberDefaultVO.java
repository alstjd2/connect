package kr.or.ddit.vo.def;

import java.io.Serializable;

import lombok.Data;

@Data
public class MemberDefaultVO implements Serializable {
    private Long memNo;

    private String memId;

    private String memPw;

    private String memNm;

    private String memBir;

    private String memEmail;

    private String memPhone;

    private String memDelyn;

    private String memGender;

    private String memType;

    private static final long serialVersionUID = 1L;
}