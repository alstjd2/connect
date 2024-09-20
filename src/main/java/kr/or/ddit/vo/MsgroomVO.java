package kr.or.ddit.vo;

import lombok.Data;

@Data
public class MsgroomVO {
	private int msgrmNo;    // 메시지방 고유번호
	private int empNo;		// 방을 만든 직원의 번호
	private int msgrmHcount; // 채팅방의 인원 수
	private String msgrmNm;  // 채팅방 이름
	private String msgrmArray;  // 정렬 정보 등 추가적인 메타데이터로 사용될 예정

	private EmployeeVO employee;
	private MsghdetailVO msgHdetail;

}
