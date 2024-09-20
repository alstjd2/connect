package kr.or.ddit.vo.def;

import java.io.Serializable;

import lombok.Data;

@Data
public class GroupEmployeeDefaultVO implements Serializable {
    private Long empNo;

    private Long grpNo;

    private static final long serialVersionUID = 1L;
}