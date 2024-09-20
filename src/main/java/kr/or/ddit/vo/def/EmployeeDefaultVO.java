package kr.or.ddit.vo.def;

import java.io.Serializable;

import lombok.Data;

@Data
public class EmployeeDefaultVO implements Serializable {
    private Long empNo;

    private Long comNo;

    private Long empProfile;

    private String empNm;

    private String empAff;

    private Long empDep;

    private Long empPos;

    private Long empOnepos;

    private String empComtel;

    private String empTel;

    private String empCommail;

    private String empMail;

    private String empBir;

    private String empJoindate;

    private Long empYear;

    private String empId;

    private String empGender;

    private String empPw;

    private String empType;

    private static final long serialVersionUID = 1L;
}