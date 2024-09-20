package kr.or.ddit.vo;

import lombok.Data;

@Data
public class MsghdetailVO {
	private int msghdNo;   // 인원 상세 번호로 각 레코드의 고유 ID.
	private int msgrmNo;   // 메시지방 고유 번호로, 어느 채팅방에 속한 정보인지 식별.
	private int empNo;	   // 직원 번호로 어느 직원이 이 방에 속해 있는지 나타냄.

	private EmployeeVO employee;
	private MsgroomVO msgRoom;
}
