package kr.or.ddit.vo.def;

import java.io.Serializable;

import lombok.Data;

@Data
public class BookmarkDefaultVO implements Serializable {
    private Long markNo;

    private Long empNo;

    private Long markTarget;

    private static final long serialVersionUID = 1L;
}