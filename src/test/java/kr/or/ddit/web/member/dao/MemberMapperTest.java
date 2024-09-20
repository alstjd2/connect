package kr.or.ddit.web.member.dao;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit.jupiter.SpringJUnitConfig;

import kr.or.ddit.vo.MailVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.web.mail.service.MailService;
import kr.or.ddit.web.member.service.MemberService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringJUnitConfig(locations = "file:src/main/resources/kr/or/ddit/spring/*-context.xml")
class MemberMapperTest{
	@Autowired
	private MemberMapper dao;
	@Autowired
	private MemberService service;
	@Autowired
	private MailService mailService;

//	@Test
//	void testSelectMemberByMemberId() {
//		MemberVO member = dao.selectMemberByMemberId("hyeonjae");
//		System.out.println(member.toString());
//	}
	
	@Test
	void hashEncodingPw() {
//		PasswordEncoder encoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
//		System.out.println(encoder.encode("java"));
	}
	
	@Test
	void testSelectMemberByMemberId() {
		MemberVO member = dao.selectMemberAuth("hyeonjae");
		System.out.println(member.toString());
	}
	
	@Test
	void test1() {
		MemberVO member = new MemberVO();
		member.setMemId("test1");
		member.setMemPw("test1");
		member.setMemNm("test1");
		member.setMemBir("test1");
		member.setMemEmail("test1");
		member.setMemPhone("test1");
		member.setMemGender("F");
		
		System.out.println(dao.insertMember(member));
	}
	@Test
	void test2() {
		List<MemberVO>list = dao.selsctMemberList();
		
		list.forEach((p)->{
			log.info("list : ${}", p);
		});
		
	}
//	@Test
//	void test3() {
//		System.out.println(dao.selectMember(2));
//	}
	@Test
	void test4() {
		MemberVO member = new MemberVO();
		member.setMemNo(102);
		member.setMemId("test2");
		member.setMemPw("test2");
		member.setMemNm("test2");
		member.setMemBir("test2");
		member.setMemEmail("test2");
		member.setMemPhone("test2");
		member.setMemGender("F");
		
		dao.updateMember(member);
	}
	@Test
	void test5() {
		dao.deleteMember(102);
	}
	
	@Test
	void mailTest() {
		MailVO mail = new MailVO();
		mail.setEMail("ggyunm4100@naver.com");
		mail.setTitle("스프링 메일 테스트 제목");
		mail.setContent("스프링 메일 테스트 내용");
		
		mailService.sendMail(mail);
	}

}
