package kr.or.ddit.groupware.vacation.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.groupware.vacation.dao.VacationInfoMapper;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;
import kr.or.ddit.vo.VacationInfoVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class VacationInfoServiceImpl implements VacationInfoService {

	private final VacationInfoMapper mapper;

	@Override
	public List<VacationInfoVO> comVacationList(int comNo) {
		List<VacationInfoVO> list = mapper.selectVacationInfoList(comNo);


		if(list.isEmpty()) {
			//없는 경우
			List<VacationInfoVO> defaultList = new ArrayList<>();

			for(int i=1; i<=24; i++) {
//			기본값 세팅해서 넣기
				VacationInfoVO vo = new VacationInfoVO();
				vo.setComNo(comNo);
				vo.setEmpYear(i+"");

				switch (i) {
	                case 1:
	                    vo.setVaciDay(15);
	                    break;
	                case 2:
	                    vo.setVaciDay(15);
	                    break;
	                case 3:
	                    vo.setVaciDay(16);
	                    break;
	                case 4:
	                    vo.setVaciDay(16);
	                    break;
	                case 5:
	                    vo.setVaciDay(17);
	                    break;
	                case 6:
	                	vo.setVaciDay(17);
	                	break;
	                case 7:
	                	vo.setVaciDay(18);
	                	break;
	                case 8:
	                	vo.setVaciDay(18);
	                	break;
	                case 9:
	                	vo.setVaciDay(19);
	                	break;
	                case 10:
	                	vo.setVaciDay(19);
	                	break;
	                case 11:
	                	vo.setVaciDay(20);
	                	break;
	                case 12:
	                	vo.setVaciDay(20);
	                	break;
	                case 13:
	                	vo.setVaciDay(21);
	                	break;
	                case 14:
	                	vo.setVaciDay(21);
	                	break;
	                case 15:
	                	vo.setVaciDay(22);
	                	break;
	                case 16:
	                	vo.setVaciDay(22);
	                	break;
	                case 17:
	                	vo.setVaciDay(23);
	                	break;
	                case 18:
	                	vo.setVaciDay(23);
	                	break;
	                case 19:
	                	vo.setVaciDay(24);
	                	break;
	                case 20:
	                	vo.setVaciDay(24);
	                	break;
	                case 21:
	                    vo.setVaciDay(25);
	                    break;
	                case 22:
	                	vo.setVaciDay(25);
	                break;
	                case 23:
	                	vo.setVaciDay(25);
	                break;
	                case 24:
	                	vo.setVaciDay(25);
	                break;
	                default:
	                    break;
            }
				defaultList.add(vo);
			}
			mapper.insertVacationInfo(defaultList);
			list = mapper.selectVacationInfoList(comNo);
		}

		return list;
	}

	@Override
	public List<VacationInfoVO> comRepList(int comNo) {

//		List<VacationInfoVO> repList = mapper.selectRepList(comNo);

//		if(repList.isEmpty()) {
//			List<VacationInfoVO> defaultRepList = new ArrayList<>();
//			for(int i=1; i<=4; i++) {
//				VacationInfoVO vo = new VacationInfoVO();
//				vo.setComNo(comNo);
//				switch (i) {
//                case 1:
//                	vo.setVaciNm("출산");
//                    vo.setVaciDay(3);
//                    break;
//                case 2:
//                	vo.setVaciNm("결혼");
//                    vo.setVaciDay(3);
//                    break;
//                case 3:
//                	vo.setVaciNm("사망");
//                    vo.setVaciDay(3);
//                    break;
//                case 4:
//                	vo.setVaciNm("수연(환갑)");
//                    vo.setVaciDay(3);
//                    break;
//                default:
//                    break;
//				}
//				defaultRepList.add(vo);
//			}
////				mapper.insertRepeaterVacation(defaultRepList);
//				repList= mapper.selectVacationInfoList(comNo);
//		}
		return mapper.selectRepList(comNo);
	}


	@Override
	public void createSpeVacation(VacationInfoVO vacationInfo) {
		mapper.insertSpectialVacation(vacationInfo);
	}

	@Override
	public void createRepVacation(VacationInfoVO vacationInfo) {
		mapper.insertRepeaterVacation(vacationInfo);
	}

	@Override
	public void updateComVacation(List<VacationInfoVO> vacationList) {
		for (VacationInfoVO vacationInfo : vacationList) {
			mapper.updateVacationInfo(vacationInfo);
		}
	}

	@Override
	public List<VacationInfoVO> comAllVacationList(int comNo) {
		return mapper.selectAllVacationList(comNo);
	}

	@Override
	@Transactional
	public void createVacation(List<VacationInfoVO> vacationList) {
		try {
			mapper.insertVacationInfo(vacationList);
		} catch (Exception e) {
			// 예외 로그 기록 및 사용자에게 알림
		}

	}

	@Override
	public EmployeeVO empAllVacCnt(int empNo) {
		return mapper.selectVacCnt(empNo);
	}

	@Override
	public EmployeeVO empUseVacCnt(int empNo) {
		return mapper.selectUseVacCnt(empNo);
	}

	@Override
	public List<VacationInfoVO> comSpeList(int comNo) {
		return mapper.selectSpeList(comNo);
	}

	@Override
	public VacationInfoVO retrieveVacationInfo(int vaciNo) {
		return mapper.selectVacationInfo(vaciNo);
	}

	@Override
	public void modifyVacation(VacationInfoVO vacationInfo) {
		mapper.updateVacationInfo(vacationInfo);
	}

	@Override
	public void removeVacation(int vaciNo) {
		mapper.deleteVacationInfo(vaciNo);
	}


}
