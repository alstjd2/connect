package kr.or.ddit.groupware.address.controller;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.groupware.address.service.AddressService;
import kr.or.ddit.vo.AddressVO;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.EmployeeVOWrapper;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class AddressExcelDownloadController {
	
	@Autowired
	AddressService service;

    @GetMapping("/gw/address/download/excel")
    @ResponseBody
    public void downloadExcel(HttpServletResponse response) throws IOException {
        // 엑셀 파일 생성
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Address");

        // 행(row) 및 셀(cell) 생성
        Row headerRow = sheet.createRow(0);
        
        headerRow.createCell(0).setCellValue("소속");
        headerRow.createCell(1).setCellValue("부서");
        headerRow.createCell(2).setCellValue("이름");
        headerRow.createCell(3).setCellValue("직급");
        headerRow.createCell(4).setCellValue("직책");
        headerRow.createCell(5).setCellValue("이메일");
        headerRow.createCell(6).setCellValue("전화번호");
        
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    EmployeeVOWrapper empAuth = (EmployeeVOWrapper)auth.getPrincipal();
	    EmployeeVO emp = empAuth.getRealUser();
	    int empNo = emp.getEmpNo();
        
     // DB에서 데이터를 가져옴 (empNo를 파라미터로 전달)
        List<AddressVO> dataList = service.retrieveAddressListExcel(empNo); 
        
        
     // 데이터를 엑셀에 추가
        int rowNum = 1;
        for (AddressVO data : dataList) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(data.getAdrAff());
            row.createCell(1).setCellValue(data.getAdrDep());
            row.createCell(2).setCellValue(data.getAdrNm());
            row.createCell(3).setCellValue(data.getAdrPos());
            row.createCell(4).setCellValue(data.getAdrOnepos());
            row.createCell(5).setCellValue(data.getAdrMail());
            row.createCell(6).setCellValue(data.getAdrTel());
        }

        // 응답 헤더 설정
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=address_list.xlsx");

        // 엑셀 파일을 HTTP 응답으로 전송
        workbook.write(response.getOutputStream());
        workbook.close();
    }
    
    @GetMapping("/gw/address/download/excelupload")
    @ResponseBody
    public void downloadExcelUpload(HttpServletResponse response) throws IOException {
    	// 엑셀 파일 생성
    	Workbook workbook = new XSSFWorkbook();
    	Sheet sheet = workbook.createSheet("AddressUpload");
    	
    	// 행(row) 및 셀(cell) 생성
    	Row headerRow = sheet.createRow(0);
    	
    	headerRow.createCell(0).setCellValue("소속");
    	headerRow.createCell(1).setCellValue("부서");
    	headerRow.createCell(2).setCellValue("이름");
    	headerRow.createCell(3).setCellValue("직급");
    	headerRow.createCell(4).setCellValue("직책");
    	headerRow.createCell(5).setCellValue("이메일");
    	headerRow.createCell(6).setCellValue("전화번호");
    	
    	// 응답 헤더 설정
    	response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
    	response.setHeader("Content-Disposition", "attachment; filename=address_Uploadlist.xlsx");
    	
    	// 엑셀 파일을 HTTP 응답으로 전송
    	workbook.write(response.getOutputStream());
    	workbook.close();
    }

}