package kr.or.ddit.vo.def;

import java.io.Serializable;

import lombok.Data;

@Data
public class RoomDefaultVO implements Serializable {
    private Long roomNo;

    private Long comNo;

    private String roomNm;

    private String roomLoc;

    private Long roomEmpmax;

    private String roomState;

    private static final long serialVersionUID = 1L;
}