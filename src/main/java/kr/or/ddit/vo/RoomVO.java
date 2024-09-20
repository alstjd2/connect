package kr.or.ddit.vo;

import java.util.List;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
public class RoomVO {
	// 회의실

	private int rnum;

	private int roomNo;
	private int comNo;
	private String roomNm;
	private String roomLoc;
	private int roomEmpmax;
	private String roomState;

	


//	private room reservation 1:n has many 관계
	private List<RoomReservationVO> roomreserva;

	// company 1:1 has a 관계 만들거임
	private CompanyVO company;
}
