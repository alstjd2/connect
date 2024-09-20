package kr.or.ddit.vo;

import lombok.Data;

@Data
public class TodoListCateGoryDetailVO {
	
	
	private int tdcatedNo;
	private int todocateNo;
	private int todoNo;
	
	private TodoListCateGoryVO todocate; // has a
	private TodoListVO todolist;  // has a
}
