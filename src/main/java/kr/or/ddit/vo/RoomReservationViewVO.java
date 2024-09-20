package kr.or.ddit.vo;



import lombok.Data;

@Data
public class RoomReservationViewVO {

	private Integer rnum;
	private Integer comNo;
	private Integer roomNo;
	private String roomNm;
	private String roomLoc;
	private Integer roomEmpmax;
	private String roomState;
	private Integer empNo;
	private String roomreserStart;
	private String roomreserEnd;
	private String roomreserDelyn;
	private String empNm;
	private Integer empDep;
	private Integer orgNo;
	private String orgDep;

}
