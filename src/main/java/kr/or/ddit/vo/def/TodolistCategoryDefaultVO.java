package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class TodolistCategoryDefaultVO implements Serializable {
    private Long todocateNo;

    private Long empNo;

    private String todocateTitle;

    private LocalDateTime todocateDate;

    private String todocateDelyn;

    private static final long serialVersionUID = 1L;
}