package kr.or.ddit.vo;



import lombok.Data;

@Data
public class RoomReservationVO {
	
	private int rnum;
	
	private int roomreserNo;
	private int empNo;
	private int roomNo;

	private String roomreserStart;
	private String roomreserEnd;

	private String roomreserDelyn;

	private String roomDate;
	private String roomPass;
	private int roomPeople;
	
	private RoomVO room; // 회의실과 has a 관계

	private EmployeeVO employee;

}
