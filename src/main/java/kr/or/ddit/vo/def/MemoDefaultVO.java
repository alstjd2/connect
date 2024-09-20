package kr.or.ddit.vo.def;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class MemoDefaultVO implements Serializable {
    private Long memoNo;

    private Long empNo;

    private Long comNo;

    private String memoTitle;

    private String memoContent;

    private String memoRef;

    private Long memoFileId;

    private LocalDateTime memoDate;

    private String memoDel;

    private static final long serialVersionUID = 1L;
}