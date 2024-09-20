package kr.or.ddit.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class CalendarVO implements Serializable {

	private int todoNo;
	private String title;
	private String content;
	private String start;
	private String end;
	private String backgroundColor;
	private String calendar;
	private String groupId;

	public void calendarSetTodoList(TodoListVO todoList) {
		this.todoNo = todoList.getTodoNo();
		this.title = todoList.getTodoTitle();
		this.content = todoList.getTodoContent();
		this.start = todoList.getTodoStart();
		this.end = todoList.getTodoEnd();
		this.backgroundColor = todoList.getTodoBackgroundColor();

		if(todoList.getTodoCode().equals("BB04110")) {
			this.calendar = "employee";
			this.groupId = "employee";
		}else if(todoList.getTodoCode().equals("BB04120")) {
			this.calendar = "dep";
			this.groupId = "dep";
		}else if(todoList.getTodoCode().equals("BB04130")) {
			this.calendar = "company";
			this.groupId = "company";
		}

	}

}
