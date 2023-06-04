/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.battery.model;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

/**
 *
 * @author parkchaebin
 */
@Slf4j
@NoArgsConstructor
@AllArgsConstructor
@Service
@Component
@PropertySource("classpath:/application.properties")
public class surveyModel {

    @Getter
    @Setter
    private HttpServletRequest request;
    @Getter
    @Setter
    private HttpServletResponse response;

    // 본인이 생성한 모든 설문 리스트 가져오기 
    public String[] surveyList(String basePath) {
        File folder = new File(basePath);
        File[] fileList = folder.listFiles();

        if (fileList == null) {
            return new String[0]; // 폴더가 비어있거나 파일이 없는 경우 빈 배열 반환
        }

        String[] fileNames = new String[fileList.length];

        for (int i = 0; i < fileList.length; i++) {
            if (fileList[i].isFile()) {
                fileNames[i] = fileList[i].getName();
//                System.out.println(fileList[i].getName());
            }
        }

        return fileNames;
    }
    
    // 생성한 설문이 강의에 등록되었는지 확인
    public boolean[] checkIf(String basePath, String[] surveyList, String managerId) {
        String fileName = managerId + "_surveyInfo.xlsx";
        String filePath = basePath + "/" + fileName;

        File file = new File(filePath);
        if (!file.exists()) {
            return new boolean[surveyList.length]; // 파일이 없는 경우 모두 false로 초기화된 배열 반환
        }
        try (Workbook workbook = WorkbookFactory.create(new FileInputStream(file))) {
            Sheet sheet = workbook.getSheet("설문 등록 정보");

            if (sheet != null) {
                int rowCount = sheet.getLastRowNum() + 1;
                boolean[] existsArray = new boolean[surveyList.length];

                for (int i = 0; i < surveyList.length; i++) {
                    existsArray[i] = false;
                    for (int rowIndex = 1; rowIndex < rowCount; rowIndex++) {
                        Row row = sheet.getRow(rowIndex);
                        if (row != null) {
                            Cell targetCell = row.getCell(1);  // 두 번째 열 (인덱스 1) 확인
                            if (targetCell != null && targetCell.getCellType() == CellType.STRING) {
                                String cellValue = targetCell.getStringCellValue();
                                if (cellValue.equals(surveyList[i])) {
                                    existsArray[i] = true;
                                    break;
                                }
                            }
                        }
                    }
                }

                return existsArray;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new boolean[0]; // 시트를 찾지 못하거나 오류가 발생한 경우 기본값 반환
    }

    // 생성한 엑셀 삭제 
    public boolean deleteSurvey(String surveyName, String basePath) {
        boolean status = false;

        String filePath = basePath + File.separator + surveyName;

        File file = new File(filePath);
        if (file.delete()) {
//            System.out.println("엑셀 파일 삭제 성공");
            status = true;
        } else {
//            System.out.println("엑셀 파일 삭제 실패");
        }

        return status;

    }

    // 생성한 설문 엑셀 다운로드 
    public boolean downloadSurvey(String surveyName, HttpServletResponse response, String basePath) throws FileNotFoundException, IOException {
        boolean status = false;
         
        String filePath = basePath + File.separator + surveyName;

//        System.out.println("surveyName ==" + surveyName);

        File file = new File(filePath);

        // 파일 다운로드 설정
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=" + surveyName);

        try (InputStream inputStream = new FileInputStream(file); OutputStream outputStream = response.getOutputStream()) {

            // 파일 데이터를 읽어서 클라이언트로 전송
            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }

            outputStream.flush();
            status = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return status;
    }
    
    
    
    // 강의에 설문 등록 
    public boolean registerSurvey(String basePath, int lectureId, String surveyName, String managerId, String title, String startDatetime, String endDatetime) {
        boolean status = false;

        try {
            String fileName = managerId + "_surveyInfo" + ".xlsx";
            File file = new File(basePath, fileName);

            // 파일 폴더가 존재하지 않는 경우 폴더 생성
            if (!file.getParentFile().exists()) {
                file.getParentFile().mkdirs();
            }

            Workbook workbook;
            Sheet sheet;
            Row headerRow;
            Cell headerCell;
            Row dataRow;
            Cell dataCell;

            if (file.exists()) {  // 파일이 존재하는 경우 해당 파일의 다음 행에 데이터 추가 
                FileInputStream inputStream = new FileInputStream(file);
                workbook = new XSSFWorkbook(inputStream);
                inputStream.close();

                // 기존 시트에 데이터 추가
                sheet = workbook.getSheetAt(0);
                int lastRowNum = sheet.getLastRowNum();
                dataRow = sheet.createRow(lastRowNum + 1);
            } else {  // 파일이 존재하지 않는 경우 파일 생성 후 데이터 추가 
                workbook = new XSSFWorkbook();
                sheet = workbook.createSheet("설문 등록 정보");

                // 헤더 생성 (강의 아이디, 설문 엑셀 파일명, 설문 제목, 시작 기간, 마감 기간)
                headerRow = sheet.createRow(0);
                headerCell = headerRow.createCell(0);
                headerCell.setCellValue("강의 아이디");
                headerCell = headerRow.createCell(1);
                headerCell.setCellValue("설문 엑셀 파일명");
                headerCell = headerRow.createCell(2);
                headerCell.setCellValue("설문 제목");
                headerCell = headerRow.createCell(3);
                headerCell.setCellValue("시작 기간");
                headerCell = headerRow.createCell(4);
                headerCell.setCellValue("마감 기간");

                // 새로운 데이터 행 생성
                dataRow = sheet.createRow(1);
            }

            // 데이터 생성
            dataCell = dataRow.createCell(0);
            // lectureId session 값 가져오기 
            dataCell.setCellValue(lectureId);
            dataCell = dataRow.createCell(1);
            dataCell.setCellValue(surveyName);
            dataCell = dataRow.createCell(2);
            dataCell.setCellValue(title);
            dataCell = dataRow.createCell(3);
            dataCell.setCellValue(startDatetime);
            dataCell = dataRow.createCell(4);
            dataCell.setCellValue(endDatetime);

            // 파일 쓰기
            FileOutputStream outputStream = new FileOutputStream(file);
            workbook.write(outputStream);
            outputStream.close();

//            log.error("설문 정보 등록 success");
            status = true;
        } catch (IOException e) {
            e.printStackTrace();
        }

        return status;

    }

    // 강의에 등록된 설문이 시작기간 전인지 확인하는 함수 
    public boolean[] checkIfStart(String[] searchSurvey, String userId) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
        LocalDateTime now = LocalDateTime.now();
        int surveyCount = searchSurvey.length / 4;
        boolean[] isStart = new boolean[surveyCount];

        for (int i = 0; i < surveyCount; i++) {
            String startDate = searchSurvey[i * 4 + 2];

            LocalDateTime startDateTime = LocalDateTime.parse(startDate, formatter);

            isStart[i] = now.isBefore(startDateTime);
            if (isStart[i]) {  // startDateTime 전이면 false 반환 
                isStart[i] = false;
            } else {  // startDateTime 전이면 true 반환 
                isStart[i] = true;
            }

        }

        return isStart;
    }

    // 강의에 등록한 설문 삭제 
    public boolean deleteSelectSurvey(String surveyTitle, String surveyContent, String basePath, String managerId) {
        boolean status = false;
        String sheetName = "설문 등록 정보";
        String targetColumnName = "설문 엑셀 파일명";

        try {
            String fileName = managerId + "_surveyInfo" + ".xlsx";
            File file = new File(basePath, fileName);

            FileInputStream fileInputStream = new FileInputStream(file);
            Workbook workbook = new XSSFWorkbook(fileInputStream);

            Sheet sheet = workbook.getSheet(sheetName);
            if (sheet == null) {
                return status;
            }

            int targetColumnIndex = -1;
            Row headerRow = sheet.getRow(0);
            for (int columnIndex = 0; columnIndex < headerRow.getLastCellNum(); columnIndex++) {
                Cell headerCell = headerRow.getCell(columnIndex);
                if (headerCell != null && headerCell.getCellType() == CellType.STRING) {
                    String headerValue = headerCell.getStringCellValue();
                    if (headerValue.equals(targetColumnName)) {
                        targetColumnIndex = columnIndex;
                        break;
                    }
                }
            }

            if (targetColumnIndex == -1) {
                return status;
            }

            for (Row row : sheet) {
                Cell targetCell = row.getCell(targetColumnIndex);
                if (targetCell != null && targetCell.getCellType() == CellType.STRING) {
                    String cellValue = targetCell.getStringCellValue();
                    if (cellValue.equals(surveyTitle)) {
                        Cell contentCell = row.getCell(targetColumnIndex + 1);
                        if (contentCell != null && contentCell.getCellType() == CellType.STRING) {
                            String contentValue = contentCell.getStringCellValue();
                            if (contentValue.equals(surveyContent)) {
                                for (Cell cell : row) {
                                    cell.setCellValue("");
                                }
                                break;
                            }
                        }
                    }
                }
            }

            // 수정 사항 파일에 저장
            try (FileOutputStream fileOutputStream = new FileOutputStream(file)) {
                workbook.write(fileOutputStream);
            }

            status = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    
    
    // 설문지 생성
    public boolean createSurvey(String basePath, String surveyName, String[] test, String[] test1, String[] test2, String[] test3, String[] test4, String[] test5) {
        boolean status = false;

        try {
            Workbook workbook = new XSSFWorkbook();  // 엑셀 파일 생성
            Sheet sheet = workbook.createSheet("설문 문항");  //시트 생성

            // 헤더 생성
            Row headerRow = sheet.createRow(0);
            String[] headerValues = {"문제", "1번", "2번", "3번", "4번", "5번"};

            for (int i = 0; i < headerValues.length; i++) {
                Cell headerCell = headerRow.createCell(i);
                headerCell.setCellValue(headerValues[i]);
            }

            // 데이터 생성
            String[][] data = {test, test1, test2, test3, test4, test5};
            for (int i = 0; i < test.length; i++) {
                Row row = sheet.createRow(i + 1);
                for (int j = 0; j <= 5; j++) {
                    Cell cell = row.createCell(j);
                    cell.setCellValue(data[j][i]);
                }
            }

            LocalDateTime now = LocalDateTime.now();
            String fileName = surveyName + "_" + now.format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss")) + ".xlsx";
            File file = new File(basePath, fileName);

            // 파일 폴더가 존재하지 않는 경우 폴더 생성
            if (!file.getParentFile().exists()) {
                file.getParentFile().mkdirs();
            }

            // 파일 쓰기
            FileOutputStream outputStream = new FileOutputStream(file);
            workbook.write(outputStream);
            outputStream.close();

            status = true;

        } catch (IOException e) {
            e.printStackTrace();
            log.error("Exception ERROR: {} ", e.getMessage());
        }

        return status;
    }

    // surveyInfo 폴더에서 강의-설문 정보 엑셀파일로 저장된 값 중 해당 강의실id(lectureId)에 해당하는 설문 제목 가져옴
    // 해당 강의실에 등록된 설문 제목 가져옴
    public String[] searchSurvey(String basePath, String manamgerId, String basePath1, int lectureId) {
        List<String> resultList = new ArrayList<>(); // 결과를 저장할 동적 배열 생성
        try {

            String filePath = basePath1 + File.separator + manamgerId + "_surveyInfo.xlsx";
            File file = new File(filePath);
            if (!file.exists()) {
                return new String[0]; // 파일이 없는 경우 빈 배열 반환
            }
            FileInputStream fileInputStream = new FileInputStream(file);
            XSSFWorkbook workbook = new XSSFWorkbook(fileInputStream);
            XSSFSheet sheet = workbook.getSheetAt(0);
            int rows = sheet.getPhysicalNumberOfRows();
            for (int rowNo = 1; rowNo < rows; rowNo++) {
                XSSFRow row = sheet.getRow(rowNo);
                if (row != null) {
                    XSSFCell firstCell = row.getCell(0);
                    if (firstCell != null && firstCell.getCellType() == CellType.NUMERIC && firstCell.getNumericCellValue() == lectureId) {
                        XSSFCell secondCell = row.getCell(1);
                        XSSFCell thirdCell = row.getCell(2);
                        XSSFCell fourthCell = row.getCell(3); // 시작 기간 셀
                        XSSFCell fifthCell = row.getCell(4); // 마감 기간 셀
                        if (secondCell != null && secondCell.getCellType() == CellType.STRING) {
                            String surveyTitle = secondCell.getStringCellValue();
                            resultList.add(surveyTitle);
                            if (thirdCell != null && thirdCell.getCellType() == CellType.STRING) {
                                String surveyContent = thirdCell.getStringCellValue();
                                resultList.add(surveyContent);
                                if (fourthCell != null && fourthCell.getCellType() == CellType.STRING) {
                                    String startDate = fourthCell.getStringCellValue();
                                    resultList.add(startDate);
                                    if (fifthCell != null && fifthCell.getCellType() == CellType.STRING) {
                                        String endDate = fifthCell.getStringCellValue();
                                        resultList.add(endDate);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        // System.out.println("resultList ==" + resultList);

        return resultList.toArray(new String[0]);
    }

    // 설문 참여 마감 확인 함수 
    public boolean[] checkIfExpired(String[] searchSurvey, String basePath2, String userId) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
        LocalDateTime now = LocalDateTime.now();
        int surveyCount = searchSurvey.length / 4;
        boolean[] isExpired = new boolean[surveyCount];
        boolean[] idExists = new boolean[surveyCount];

        for (int i = 0; i < surveyCount; i++) {
            String startDate = searchSurvey[i * 4 + 2];
            String endDate = searchSurvey[i * 4 + 3];

            LocalDateTime startDateTime = LocalDateTime.parse(startDate, formatter);
            LocalDateTime endDateTime = LocalDateTime.parse(endDate, formatter);

            // 설문 시간 확인 
            isExpired[i] = now.isBefore(startDateTime) || now.isAfter(endDateTime);

//            System.out.println("secondSell ====" + searchSurvey[i * 4]);
//            System.out.println("thirdSell ====" + searchSurvey[i * 4 + 1]);

            String surveyTitle = searchSurvey[i * 4];
            int dotIndex = surveyTitle.lastIndexOf(".");
            surveyTitle = surveyTitle.substring(0, dotIndex);
            String title = searchSurvey[i * 4 + 1];

            try {
                String fileName = surveyTitle + "-" + title + ".xlsx";
//                System.out.println("filename ===" + fileName);
                File file = new File(basePath2 + "/" + fileName);

                if (file.exists()) {
                    FileInputStream fileInputStream = new FileInputStream(file);
                    XSSFWorkbook workbook = new XSSFWorkbook(fileInputStream);
                    XSSFSheet sheet = workbook.getSheetAt(0);

                    // 설문 결과 중 해당 사용자 아이디가 있는지 확인 
                    for (Row row : sheet) {
                        Cell idCell = row.getCell(0);

                        if (idCell != null && idCell.getCellType() == CellType.STRING) {
                            String idValue = idCell.getStringCellValue();
//                            System.out.println("idValue=" + idValue);
                            if (idValue.equals(userId)) {
                                idExists[i] = true;
                                break;
                            }
                        }
                    }

                    fileInputStream.close();
                } else {
                    idExists[i] = false;
                }

//                System.out.println("idExists[" + i + "]==" + idExists[i]);

                // 설문 시간과 설문 참여 여부 확인
                isExpired[i] = isExpired[i] || idExists[i];
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return isExpired;
    }

    // 설문 폼 생성을 위해 설문 문항 추출하는 함수
    public String[] makeForm(String basePath, String surveyTitle) {
        String[] extractedText = null; // 추출한 텍스트를 저장하기 위한 배열

        try {
            // 해당 경로에 있는 파일을 읽기 
            // searchSurvey[0] : 설문 파일명, searchSurvey[1] : 설문 제목
            FileInputStream file = new FileInputStream(basePath + "/" + surveyTitle);
            //System.out.println("searchSurvey[1]" + searchSurvey[1]);
            XSSFWorkbook workbook = new XSSFWorkbook(file);

            int rowNo = 0;
            int cellIndex = 0;
            List<String> extractedTextList = new ArrayList<>();  // 추출한 텍스트를 저장할 List 객체

            XSSFSheet sheet = workbook.getSheetAt(0);  // 0 번째 시트 값
            int rows = sheet.getPhysicalNumberOfRows();  // 엑셀 Row수

            for (rowNo = 1; rowNo < rows; rowNo++) {
                XSSFRow row = sheet.getRow(rowNo);
                if (row != null) {
                    int cells = row.getPhysicalNumberOfCells();  // 해당 Row에 사용자가 입력한 셀의 수
                    extractedText = new String[cells];  // 추출한 값들을 저장할 배열
                    for (cellIndex = 0; cellIndex < cells; cellIndex++) {
                        XSSFCell cell = row.getCell(cellIndex);  // 셀의 값 가져옴
                        String value = "";
                        if (cell == null) {  // 셀이 null일 경우 빈 문자열 대입
                            extractedText[cellIndex] = "";
                        } else {
                            // 타입 별로 내용 읽기
                            switch (cell.getCellType()) {

                                case FORMULA:
                                    value = cell.getCellFormula();
                                    extractedText[cellIndex] = value;
                                    break;
                                case NUMERIC:
                                    value = cell.getNumericCellValue() + "";
                                    extractedText[cellIndex] = value;
                                    break;
                                case STRING:
                                    value = cell.getStringCellValue() + "";
                                    extractedText[cellIndex] = value;
                                    break;
                                case BLANK:
                                    value = cell.getBooleanCellValue() + "";
                                    extractedText[cellIndex] = "";
                                    break;
                                case ERROR:
                                    value = cell.getErrorCellValue() + "";
                                    extractedText[cellIndex] = "";
                                    break;
                            }
                        }
                        //  System.out.println(rowNo + "번 행 : " + cellIndex + "번 열 값은: " + value);
                    }
                    extractedTextList.addAll(Arrays.asList(extractedText));  // 추출된 값들을 List에 추가
                    extractedText = extractedTextList.toArray(new String[0]);  // List를 배열로 변환
                }
            }

            System.out.println(extractedTextList);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return extractedText;
    }

    // 설문 결과 엑셀파일 생성 
    // surveyResult/businessid/lectureId/title(설문제목).xlsx
    public boolean createResult(String basePath, String name, String[] question, List<String> questionList, String userId, int lectureId, String title, String surveyTitle) {
        boolean status = false;

        try {
            String fileName = surveyTitle + "-" + title + ".xlsx";
            File file = new File(basePath + File.separator + lectureId, fileName);

            // 파일 폴더가 존재하지 않는 경우 폴더 생성
            if (!file.getParentFile().exists()) {
                file.getParentFile().mkdirs();
            }

            Workbook workbook;
            Sheet sheet;
            Row headerRow;
            Cell headerCell;
            Row dataRow;
            Cell dataCell;

            if (file.exists()) { // 파일이 존재하는 경우 해당 파일의 다음 행에 데이터 추가 
                FileInputStream inputStream = new FileInputStream(file);
                workbook = new XSSFWorkbook(inputStream);
                inputStream.close();

                // 기존 시트에 데이터 추가
                sheet = workbook.getSheetAt(0);
                int lastRowNum = sheet.getLastRowNum();
                dataRow = sheet.createRow(lastRowNum + 1);
            } else {  // 파일이 존재하지 않는 경우 파일 생성 후 데이터 추가 
                workbook = new XSSFWorkbook();
                sheet = workbook.createSheet("설문 결과");

                // 헤더 생성 (아이디, 이름, question1, question2, question3 ...)
                headerRow = sheet.createRow(0);
                headerCell = headerRow.createCell(0);
                headerCell.setCellValue("아이디");
                headerCell = headerRow.createCell(1);
                headerCell.setCellValue("이름");
                for (int i = 0; i < question.length; i++) {
                    headerCell = headerRow.createCell(i + 2);
                    headerCell.setCellValue(question[i]);
                }

                // 새로운 데이터 행 생성
                dataRow = sheet.createRow(1);
            }

            // 데이터 생성
            dataCell = dataRow.createCell(0);
            // id session값 넣기
            dataCell.setCellValue(userId);
            dataCell = dataRow.createCell(1);
            dataCell.setCellValue(name);
            for (int i = 0; i < questionList.size(); i++) {
                dataCell = dataRow.createCell(i + 2);
                dataCell.setCellValue(questionList.get(i));
            }

            // 파일 쓰기
            FileOutputStream outputStream = new FileOutputStream(file);
            workbook.write(outputStream);
            outputStream.close();

            status = true;
        } catch (IOException e) {
            e.printStackTrace();
        }

        return status;
    }

}
