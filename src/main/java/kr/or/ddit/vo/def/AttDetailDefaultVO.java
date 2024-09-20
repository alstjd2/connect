package kr.or.ddit.vo.def;

import java.io.Serializable;

import lombok.Data;

@Data
public class AttDetailDefaultVO implements Serializable {
    private Long attdNo;

    private Long attNo;

    private String attdQrinm;

    private String attdSavenm;

    private String attdPath;

    private String attdExe;

    private String attdSize;

    private String attdDelyn;

    private static final long serialVersionUID = 1L;
}