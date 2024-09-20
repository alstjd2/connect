package kr.or.ddit.groupware.vacation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.groupware.vacation.dao.ApplicationMapper;
import kr.or.ddit.vo.ApplicationVO;
import kr.or.ddit.vo.EmployeeVO;
import oracle.net.aso.m;

@Service
public class ApplicationServiceImpl implements ApplicationService {

	@Autowired
	private ApplicationMapper mapper;

	@Override
	public List<EmployeeVO> comApplicationList(int comNo) {
		return mapper.selectComApplicationList(comNo);
	}

	@Override
	public ApplicationVO empAllSpeCnt(int empNo) {
		return mapper.speEmpAllCnt(empNo);
	}

	@Override
	public ApplicationVO empUseSpeCnt(int empNo) {
		return mapper.speEmpUseCnt(empNo);
	}

	@Override
	public void createSpcApplication(ApplicationVO application) {
		mapper.insertSpcApplication(application);
	}

	@Override
	public List<EmployeeVO> empApplicationList(int empNo) {
		return mapper.selectEmpApplicationList(empNo);
	}

	@Override
	public List<ApplicationVO> empSpeList(int empNo) {
		return mapper.speEmpList(empNo);
	}

	@Override
	public List<ApplicationVO> empSpeUseList(int empNo) {
		return mapper.speEmpUseList(empNo);
	}

	@Override
	public void empVacApplicationMer(ApplicationVO app) {
		mapper.empVacApplicationMer(app);
	}

	@Override
	public List<EmployeeVO> depApplicationList(int empNo) {
		return mapper.selectDepApplicationList(empNo);
	}

	@Override
	public EmployeeVO empAppDetail(int appNo) {
		return mapper.selectEmpApplicationDetail(appNo);
	}

	@Override
	public void empApproveApplication(ApplicationVO application) {

		mapper.updateApproveApplication(application);
	}

	@Override
	public void empCompanionApplication(ApplicationVO application) {
		mapper.updateCompanionApplication(application);
	}

	@Override
	public ApplicationVO appDepIngCnt(int rovemp) {
		return mapper.appDepIngCnt(rovemp);
	}

	@Override
	public ApplicationVO appDepAroveCnt(int rovemp) {
		return mapper.appDepAproveCnt(rovemp);
	}

	@Override
	public ApplicationVO appDepCnt(int rovemp) {
		return mapper.appDepCnt(rovemp);
	}

	@Override
	public ApplicationVO comVacIngCnt(int comNo) {
		return mapper.comVacIngCnt(comNo);
	}

	@Override
	public ApplicationVO comVacApproveCnt(int comNo) {
		return mapper.comVacApproveCnt(comNo);
	}

	@Override
	public ApplicationVO comVacCnt(int comNo) {
		return mapper.comVacCnt(comNo);
	}

	@Override
	public List<ApplicationVO> comSpeList(int comNo) {
		return mapper.comSpeList(comNo);
	}

}
