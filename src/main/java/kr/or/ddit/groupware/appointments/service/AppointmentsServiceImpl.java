package kr.or.ddit.groupware.appointments.service;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import kr.or.ddit.groupware.appointments.dao.AppointmentsMapper;
import kr.or.ddit.groupware.employee.service.EmployeeService;
import kr.or.ddit.vo.AppointmentsVO;
import kr.or.ddit.vo.CommoncodeDetailVO;

@Service
public class AppointmentsServiceImpl implements AppointmentsService {

   @Autowired
   private AppointmentsMapper dao;

   @Autowired
   private EmployeeService employeeService;

   // 날짜 형식 포맷터 추가 (yyyy-MM-dd 형식으로 포맷팅)
   private static final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

   @Override
    public List<AppointmentsVO> getAppointmentsWithFilters(int comNo, String searchName, String searchDate, int page, int pageSize) {
        int offset = (page - 1) * pageSize;  // 페이지네이션을 위한 offset 계산
        return dao.selectAppointmentsWithFilters(comNo, searchName, searchDate, offset, pageSize);
    }

    @Override
    public int countAppointments(int comNo, String searchName, String searchDate) {
        return dao.countAppointments(comNo, searchName, searchDate);
    }

   @Override
   public AppointmentsVO getAppointmentsDetails(int apmNo) {
      return dao.selectAppointmentsDetails(apmNo);
   }

   @Override
   public void addAppointment(AppointmentsVO appointment) {
      // 현재 날짜로 설정
       appointment.setApmEndate(LocalDate.now());

       // 기본값 'N'으로 설정
       appointment.setApmDelyn("N");


      dao.insertAppointments(appointment);

      // 발령일이 오늘인 경우에만 즉시 상태 업데이트 또는 부서 이동 처리
        if (appointment.getApmDate().equals(LocalDate.now())) {
            switch (appointment.getApmType()) {
                case "EB01110":  // 부서이동 코드
                    // 부서 이동은 스케줄러에서 처리하므로 여기서는 로직 없음
                    break;
                case "EB01120":  // 휴직 코드
                case "EB01130":  // 퇴직 코드
                case "EB01140":  // 재직중 코드
                    employeeService.updateEmployeeStateByAppointment(appointment.getEmpNo(), determineStateFromApmType(appointment.getApmType()));
                    break;
                default:
                    break;
            }
        }
    }

   // 발령 종류에 따른 상태 결정
    private String determineStateFromApmType(String apmType) {
        switch (apmType) {
            case "EB01120":
                return "휴직";
            case "EB01130":
                return "퇴직";
            case "EB01140":
                return "재직중";
            default:
                return "";
        }
    }



    // 상태를 업데이트하는 스케줄러 메서드
    @Scheduled(cron = "0 0 10 * * ?") // 매일 오전 10시에 실행
    public void updateEmployeeStatus() {
        // 현재 날짜의 발령일을 기준으로 상태를 업데이트
        String currentDate = dateFormat.format(new Date());
        List<AppointmentsVO> appointmentsToUpdate = dao.selectAppointmentsToUpdate(currentDate);

        for (AppointmentsVO appointment : appointmentsToUpdate) {
            LocalDate apmDate = appointment.getApmDate();
            LocalDate today = LocalDate.now();

            if (apmDate.equals(today)) { // 오늘이 발령일인 경우에만 상태 업데이트
                System.out.println("오늘의 발령일 처리: " + apmDate);
                if ("EB01110".equals(appointment.getApmType())) {  // 부서이동 코드
                    // 부서 이동 처리
                    employeeService.updateEmployeeDepartment(appointment.getEmpNo(), appointment.getNewOrgDep());
                } else {
                    // 상태 업데이트 로직
                    employeeService.updateEmployeeStateByAppointment(appointment.getEmpNo(), appointment.getNewState());
                }
            } else {
                System.out.println("발령일이 미래입니다. 오늘 처리되지 않습니다: " + apmDate);
            }
        }
    }



   @Override
   public List<CommoncodeDetailVO> getApmTypes() {
      return dao.selectApmTypes();
   }

}
