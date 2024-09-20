package kr.or.ddit.groupware.mail.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.MailVO;

@Mapper
public interface mailSaveMapper {

	public int insertSaveMail(MailVO mail);

}
