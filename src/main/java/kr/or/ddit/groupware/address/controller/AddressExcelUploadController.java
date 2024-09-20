package kr.or.ddit.groupware.address.controller;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.groupware.address.service.AddressService;
import kr.or.ddit.vo.AddressVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;

@Controller
public class AddressExcelUploadController {
	@Autowired
	AddressService service;

    @PostMapping("/gw/address/upload/excel")
    public String uploadExcel(@RequestParam("file") MultipartFile file) {
    	try (InputStream inputStream = file.getInputStream()) {
            // 엑셀 파일 읽기
            Workbook workbook = new XSSFWorkbook(inputStream);
            Sheet sheet = workbook.getSheetAt(0);
            
            // 데이터를 저장할 리스트 생성
            List<AddressVO> addressList = new ArrayList<>();
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
    	    EmployeeVO emp = empAuth.getRealUser();
    	    int empNo = emp.getEmpNo();
            
            // 데이터 행 읽기 (첫 번째 행은 헤더이므로 건너뜀)
            for (Row row : sheet) {
                if (row.getRowNum() == 0) continue; // 첫 행은 헤더일 경우 건너뜀
                
                AddressVO address = new AddressVO();
                address.setEmpNo(empNo);
                address.setAdrAff(row.getCell(0).getStringCellValue());  // 소속
                address.setAdrDep(row.getCell(1).getStringCellValue());  // 부서
                address.setAdrNm(row.getCell(2).getStringCellValue());   // 이름
                address.setAdrPos(row.getCell(3).getStringCellValue());  // 직급
                address.setAdrOnepos(row.getCell(4).getStringCellValue()); // 직책
                address.setAdrMail(row.getCell(5).getStringCellValue()); // 이메일
                address.setAdrTel(row.getCell(6).getStringCellValue());  // 전화번호

                // 리스트에 추가
                addressList.add(address);
            }

            // DB에 삽입
            for (AddressVO address : addressList) {
                service.createAddress(address); // 서비스 호출
            }

        } catch (Exception e) {
            e.printStackTrace();
            return "error";  // 에러 페이지로 리다이렉트
        }

    	return "redirect:/gw/address/addressList.do";  // 업로드된 페이지로 리다이렉트
    
    }

}
