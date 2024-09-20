package kr.or.ddit.vo.def;

import java.io.Serializable;

import lombok.Data;

@Data
public class RoomReservationDefaultVO implements Serializable {
    private Long todoNo;

    private Long roomNo;

    private static final long serialVersionUID = 1L;
}