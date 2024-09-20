package kr.or.ddit.vo;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import lombok.Data;

@Data
public class TodoListVO {

	private int rnum;

	private int todoNo;
	private int empNo;
	private String todoCode;
	private String todoTitle;
	private String todoContent;
	private String todoDate;
	private String todoState;
	private int todoAttachfile;
	private String todoStart;
	private String todoEnd;
	private int todoRoom;
	private int todoConno;
	private String todoDelyn;
	private String todoBackgroundColor; 
//	private int todoCateNo;

	private TodoListCateGoryVO todoCate;
	private EmployeeVO employee; // has a
	
}
