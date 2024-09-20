package kr.or.ddit.vo;

import java.time.LocalDate;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
//@EqualsAndHashCode(of = {"todocateNo","empNo"})
public class TodoListCateGoryVO {
	// todolistcategory
	private Integer todocateNo;
	private int empNo;
	private String todocateTitle;
	private LocalDate todocateDate;
	private String todocateDelyn;

	private List<TodoListVO> todoList;
}
