package kr.or.ddit.vo.def;

import java.io.Serializable;

import lombok.Data;

@Data
public class TodolistCategoryDetailDefaultVO implements Serializable {
    private Long tdcatedNo;

    private Long todocateNo;

    private Long todoNo;

    private static final long serialVersionUID = 1L;
}