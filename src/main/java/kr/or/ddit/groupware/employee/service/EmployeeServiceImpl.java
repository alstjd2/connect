package kr.or.ddit.groupware.employee.service;

import java.io.File;
import java.io.IOException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.annotation.PostConstruct;

import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.atchfile.service.AtchFileService;
import kr.or.ddit.commons.exception.PkNotFoundException;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.groupware.company.dao.CompanyMapper;
import kr.or.ddit.groupware.employee.dao.EmployeeMapper;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MemberVOWrapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class EmployeeServiceImpl implements EmployeeService {
	@Autowired
	private EmployeeMapper mapper;
	@Autowired
	private AtchFileService atchFileService;
	@Autowired
    private PasswordEncoder passwordEncoder;
	@Autowired
	private AuthenticationProvider memberProvider;
	@Autowired
	private CompanyMapper companyMapper;


	@Value("#{appInfo.atchSavePath}")
	private Resource folder;
	private File saveFolder;


	@PostConstruct
	public void init() throws IOException {
		saveFolder = folder.getFile();
		log.info("이미지 저장 경로 : {}",saveFolder.getAbsolutePath());
	}

	@Override
	public EmployeeVO retrieveEmployee(int empNo) throws PkNotFoundException {
		EmployeeVO employee = mapper.selectEmployee(empNo);
		if(employee==null)
			throw new PkNotFoundException(empNo);
		return employee;
	}

	/**
	 * 직원 개인정보 조회
	 * @author 이희진
	 */
	@Override
	public EmployeeVO retrieveEmployeeInfo(int empNo) throws PkNotFoundException {
		EmployeeVO employee = mapper.selectEmployeeInfo(empNo);
		if(employee==null)
			throw new PkNotFoundException(empNo);
		return employee;
	}
	/**
	 * 회사 조직원 리스트 조회
	 * @author 이희진
	 */
	@Override
	public List<EmployeeVO> retrieveEmployeeComList(PaginationInfo paging) {
		int totalRecord = mapper.selectTotalRecordCom(paging);
		paging.setTotalRecord(totalRecord);
		return mapper.selectEmployeeComList(paging);
	}
	/**
	 * 회사 부서별 조직원 리스트 조회
	 * @author 이희진
	 */
	@Override
	public List<EmployeeVO> retrieveEmployeeComListByDept(PaginationInfo<EmployeeVO> paging, String orgDep) {
		int totalRecord = mapper.selectTotalRecordCombyDept(paging);
		paging.setTotalRecord(totalRecord);
		return mapper.selectEmployeeComListByDept(paging);
	}
	/**
	 * 회사 조직원 조회 JSON
	 */
	@Override
	public List<EmployeeVO> retrieveEmployeeComEmpList(int comNo) {
		return mapper.selectEmployeeNoAdminComEmpList(comNo);
	}
	/**
	 * 개인정보 수정
	 * @author 이희진
	 */
	@Override
	public void modifyEmployeeInfo(EmployeeVO employee) {
		if(employee.isImageModified()) {
			Optional.ofNullable(employee.getAtchFile())
			.ifPresent(af->{
				atchFileService.createAtchFile(af, saveFolder);
				employee.setEmpProfile(af.getAtchFileId());
			});
		}

		mapper.updateEmployeeInfo(employee);

		// 직원 정보 수정 후 현재 인증 객체의 직원 VO 상태 변경
		Authentication oldAuthentication = SecurityContextHolder.getContext().getAuthentication();
		SecurityContext newContext = SecurityContextHolder.createEmptyContext();
		SecurityContextHolder.setContext(newContext);
		UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(oldAuthentication.getName(), oldAuthentication.getCredentials());
		Authentication newAuthentication = memberProvider.authenticate(token);
		newContext.setAuthentication(newAuthentication);
	}
	/**
	 * 비밀번호 수정
	 * @author 이희진
	 */
	@Override
    public void changePassword(int empNo, String currentPassword, String newPassword) throws PkNotFoundException {
        // 현재 비밀번호 검증
        EmployeeVO employee = mapper.selectEmployee(empNo);
        if (employee == null || !passwordEncoder.matches(currentPassword, employee.getEmpPw())) {
            throw new PkNotFoundException(empNo); // 비밀번호가 틀린 경우 예외 발생
        }

        // 비밀번호 변경
        employee.setEmpPw(passwordEncoder.encode(newPassword));
        mapper.updateEmployeePW(employee);
    }




	// 아래부터 새로 추가한 메서드 (관리자용)(성훈)
		@Override
		public List<EmployeeVO> retrieveAllEmployees(int comNo) {
			return mapper.selectAllEmployees(comNo);
		}


		@Override
		public void editEmployee(EmployeeVO employee) {
			mapper.updateEmployee(employee);

		}

		@Override
		public EmployeeVO retrieveEmployeeDetail(int empNo) {
			return mapper.selectEmployeeDetail(empNo);
		}


		/**
		 * 직원정보 수정 (관리자용)
		 * @param employee
		 */
		@Override
	    public void changeEmployee(EmployeeVO employee) {
	        mapper.editEmployee(employee);  // Mapper를 통해 데이터베이스에 업데이트 요청
	    }


		@Override
		public void registerEmployee(EmployeeVO employee) {
			int nextEmpNo = mapper.getNextEmpNo();  // EMP_NO 증가
	        String generatedId = generateUniqueEmployeeId();  // 새로운 메서드로 아이디 생성
	        String generatedPassword = generatePassword(); // 비밀번호 자동 생성
	        String generatedEmail = generatedId.toLowerCase() + "@ddit.or.kr";

	        // 비밀번호를 암호화하고 EmployeeVO에 설정
			employee.setEmpId(generatedId);
			employee.setEmpPw(passwordEncoder.encode(generatedPassword)); // 암호화된 비밀번호 설정
			employee.setEmpCommail(generatedEmail);
			employee.setEmpNo(nextEmpNo);    // 새로 생성된 직원 번호를 설정

			// EMP_TYPE과 EMP_ROLE 자동 설정
		    employee.setEmpType("FB03120"); // EMP_TYPE을 "FB03120"으로 설정
		    employee.setEmpRole("ROLE_EMPLOYEE"); // EMP_ROLE을 "ROLE_EMPLOYEE"로 설정

			// 기타 필드 설정 후 등록
			mapper.insertEmployee(employee);

		}


		 public String generateUniqueEmployeeId() {
			 String newId;
			    do {
			        // A부터 F 사이의 알파벳 하나를 랜덤으로 선택
			        char letter = (char) ('A' + new SecureRandom().nextInt(6)); // 0부터 5까지의 난수로 A-F 범위에서 선택
			        int number = new SecureRandom().nextInt(10000); // 0부터 9999까지의 숫자
			        newId = String.format("%c%04d", letter, number); // 알파벳 하나와 숫자 4자리 조합으로 형식 지정
			    } while(mapper.selectEmployeeAuth(newId) != null); // 중복 아이디 확인
			    return newId;
		    }

		 public String generatePassword() {
			 	int length = 8; // 비밀번호 길이 설정
			    String upperCaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
			    String lowerCaseLetters = "abcdefghijklmnopqrstuvwxyz";
			    String numbers = "0123456789";
			    String specialCharacters = "!@#";
			    String combinedChars = upperCaseLetters + lowerCaseLetters + numbers + specialCharacters;

			    StringBuilder password = new StringBuilder(length);
			    SecureRandom random = new SecureRandom();

			    // 각 카테고리에서 최소 하나의 문자 추가
			    password.append(upperCaseLetters.charAt(random.nextInt(upperCaseLetters.length())));
			    password.append(lowerCaseLetters.charAt(random.nextInt(lowerCaseLetters.length())));
			    password.append(numbers.charAt(random.nextInt(numbers.length())));
			    password.append(specialCharacters.charAt(random.nextInt(specialCharacters.length())));

			    // 나머지 문자 추가
			    for (int i = 4; i < length; i++) {
			        password.append(combinedChars.charAt(random.nextInt(combinedChars.length())));
			    }

			    // 비밀번호 셔플
			    List<Character> passwordChars = new ArrayList<>();
			    for (char c : password.toString().toCharArray()) {
			        passwordChars.add(c);
			    }
			    Collections.shuffle(passwordChars);

			    // 셔플된 비밀번호를 문자열로 변환하여 반환
			    StringBuilder finalPassword = new StringBuilder();
			    for (char c : passwordChars) {
			        finalPassword.append(c);
			    }

			    return finalPassword.toString();
			}




		// 엑셀 업로드
		@Override
		public void uploadEmployeeData(MultipartFile file) {
			try (Workbook workbook = new XSSFWorkbook(file.getInputStream())) {
		        Sheet sheet = workbook.getSheetAt(0);
		        for (Row row : sheet) {
		            if (row.getRowNum() == 0) {
		                continue; // Skip header row
		            }
		            EmployeeVO employee = new EmployeeVO();
		            employee.setEmpNm(row.getCell(0).getStringCellValue());
		            employee.setEmpDep((int) row.getCell(1).getNumericCellValue());
		            employee.setEmpPos((int) row.getCell(2).getNumericCellValue());
		            employee.setEmpOnepos((int) row.getCell(3).getNumericCellValue());
		            employee.setEmpComtel(row.getCell(4).getStringCellValue());
		            employee.setEmpCommail(row.getCell(5).getStringCellValue());
		            employee.setEmpBir(row.getCell(6).getStringCellValue());
		            employee.setEmpJoindate(row.getCell(7).getStringCellValue());
		            employee.setEmpYear((int) row.getCell(8).getNumericCellValue());
		            employee.setEmpGender(row.getCell(9).getStringCellValue());

		            mapper.updateEmployeeInfo(employee);
		        }
		    } catch (IOException e) {
		        e.printStackTrace();
		    }

		}

		@Override
		public List<EmployeeVO> searchEmployees(String empNm, int empDep, int empPos, int empOnepos, String empState) {
			return mapper.searchEmployees(empNm, empDep, empPos, empOnepos, empState);
		}

		@Override
		public Integer getEmpNoByName(String empNm) {
			if (empNm == null || empNm.trim().isEmpty()) {
	            return null;  // 공백 또는 null일 때 null 반환
	        }
	        return mapper.selectEmpNoByName(empNm);
		}

		@Override
		public String getEmployeeNameByEmpNo(int empNo) {
			// mapper에서 이름을 가져오는 로직
		    String employeeName = mapper.selectEmployeeNameByEmpNo(empNo);
		    // 디버깅을 위한 로그 추가
		    log.debug("Retrieved employee name for empNo {}: {}", empNo, employeeName);

		    // null 체크 및 빈 문자열 체크 추가
		    if (employeeName == null || employeeName.trim().isEmpty()) {
		    	log.warn("Employee name not found for empNo: {}", empNo);
		        return "???"; // 직원 이름이 없거나 잘못된 경우 "???" 반환
		    }

		    return employeeName;
		}

		@Override
		public void updateEmployeeStateByAppointment(int empNo, String empState) {
			mapper.updateEmployeeState(empNo, empState);

		}


		@Override
		public EmployeeVO selectEmpVacDetail(int empNo) {
			return mapper.selectEmpDetailVac(empNo);
		}

		@Override
	    @Transactional
	    public void updateEmployeeDepartment(int empNo, int newOrgDep) {
			// Map을 생성하여 파라미터를 설정
	        Map<String, Object> params = new HashMap<>();
	        params.put("empNo", empNo);
	        params.put("newOrgDep", newOrgDep);

	        // 직원의 부서를 업데이트하는 DAO 메서드 호출
	        mapper.updateEmployeeDepartment(empNo, newOrgDep);
	    }

		@Override
		public List<EmployeeVO> selectEmpVacDepList( String orgDep, int comNo) {
			return mapper.selectEmpVacDepList(orgDep, comNo);
		}



		@Override
		public List<EmployeeVO> retrieveAllPositions(int comNo, String posType) {
		    return mapper.selectAllPositions(comNo, posType);
		}

		@Override
		public List<EmployeeVO> retrieveDfVacList(int comNo) {
			return mapper.selectDfVacList(comNo);
		}

		@Override
		public List<EmployeeVO>  retrieveEmpDep(int empDep) {
			return mapper.selectEmpDepList(empDep);
		}

		@Override
		public ServiceResult createEmployeeByAdmin(EmployeeVO empVO) {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			MemberVOWrapper memAuth = (MemberVOWrapper) auth.getPrincipal();
			MemberVO memVO = memAuth.getRealUser();

			int comNo = companyMapper.selectComNo(memVO.getMemNo());

			empVO.setComNo(comNo);
			empVO.setEmpNm(memVO.getMemNm());
			empVO.setEmpTel(memVO.getMemPhone());
			empVO.setEmpCommail(empVO.getEmpId()+"@ddit.co.kr");
			empVO.setEmpPw(passwordEncoder.encode(empVO.getEmpPw()));
			empVO.setEmpType("FB03110");
			empVO.setEmpRole("ROLE_ADMIN");

			int cnt = mapper.insertEmployeeByAdmin(empVO);
			ServiceResult result = ServiceResult.FAIED;
			if(cnt>0) {
				result = ServiceResult.OK;
			}
			return result;
		}

		@Override
		public List<EmployeeVO> readExcelFile(MultipartFile file, Integer comNo) throws IOException {
		    List<EmployeeVO> employeeList = new ArrayList<>();

		    try (Workbook workbook = new XSSFWorkbook(file.getInputStream())) {
		        Sheet sheet = workbook.getSheetAt(0); // 첫 번째 시트를 읽음

		        for (Row row : sheet) {
		            if (row.getRowNum() == 0) {
		                continue; // 첫 번째 행(헤더)은 건너뜀
		            }

		            EmployeeVO employee = new EmployeeVO();

		            // 직원명 (String 타입)
		            employee.setEmpNm(row.getCell(0).getStringCellValue());

		            // 부서명, 직급명, 직책명 직접 입력
		            String empDepName = row.getCell(1).getStringCellValue(); // 부서명
		            String empPosName = row.getCell(2).getStringCellValue(); // 직급명
		            String empOneposName = row.getCell(3).getStringCellValue(); // 직책명

		            // 데이터베이스에서 해당 부서명, 직급명, 직책명에 맞는 번호를 조회
		            Integer empDepNo = mapper.selectDepNoByName(empDepName, comNo);
		            Integer empPosNo = mapper.selectPosNoByName(empPosName, comNo);
		            Integer empOneposNo = mapper.selectOneposNoByName(empOneposName, comNo);

		            employee.setEmpDep(empDepNo);
		            employee.setEmpPos(empPosNo);
		            employee.setEmpOnepos(empOneposNo);

		            log.info("엑셀에서 읽은 부서명: {}", empDepName);
		            log.info("엑셀에서 읽은 직급명: {}", empPosName);
		            log.info("엑셀에서 읽은 직책명: {}", empOneposName);



		            // 나머지 직원 정보 설정 (예: 연락처, 생일, 이메일 등)
		            employee.setEmpTel(row.getCell(4).getStringCellValue());
		            employee.setEmpBir(row.getCell(5).getStringCellValue());
		            employee.setEmpJoindate(row.getCell(6).getStringCellValue());
		            employee.setEmpMail(row.getCell(7).getStringCellValue());
		            employee.setEmpYear((int) row.getCell(8).getNumericCellValue());
		            employee.setEmpGender(row.getCell(9).getStringCellValue());
		            employee.setEmpState(row.getCell(10).getStringCellValue());


		            // EMP_ID와 EMP_PW 자동 생성
		            String generatedId = generateUniqueEmployeeId(); // 중복 체크 후 유니크한 아이디 생성
		            String generatedPassword = generatePassword();   // 비밀번호 생성 후 암호화

		            // 생성된 아이디와 비밀번호 설정
		            employee.setEmpId(generatedId);
		            employee.setEmpPw(passwordEncoder.encode(generatedPassword)); // 비밀번호 암호화 후 설정

		            // 이메일 자동 생성 (예: 아이디 + "@ddit.or.kr")
		            employee.setEmpCommail(generatedId.toLowerCase() + "@ddit.or.kr");

		            // EMP_TYPE과 EMP_ROLE 기본값 설정
		            employee.setEmpType("FB03120"); // EMP_TYPE 기본값 설정
		            employee.setEmpRole("ROLE_EMPLOYEE"); // EMP_ROLE 기본값 설정


		            employeeList.add(employee);
		        }
		    }

		    return employeeList;
		}

		public boolean isNumeric(String str) {
			try {
		        Integer.parseInt(str);
		        return true;
		    } catch (NumberFormatException e) {
		        return false;
		    }
		}

		@Transactional
		@Override
		public void saveAll(List<EmployeeVO> employeeList) {
			for (EmployeeVO employee : employeeList) {
				mapper.insertEmployee(employee);
		    }
		}

}
