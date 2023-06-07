/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.battery.model;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

/**
 *
 * @author parkchaebin
 */
@Slf4j
@NoArgsConstructor
@Service
@Component
@PropertySource("classpath:/application.properties")
public class ChartModel {

    DataSource ds = null;
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    // 날짜별 신청 인원 
    public List<Object[]> chart(HikariConfiguration dbConfig, int lecture) throws SQLException {

        List<Object[]> chartDataList = new ArrayList<>();

        String sql = "SELECT date, COUNT(*) AS count FROM regiclass where lectureid = ? and user_state = ? GROUP BY date";

        try {

            ds = dbConfig.dataSource();
            conn = ds.getConnection();

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, lecture);
            pstmt.setInt(2, 2);  
            rs = pstmt.executeQuery();

            while (rs.next()) {
                String date = rs.getString("date");
                int count = rs.getInt("count");
                Object[] chartData = new Object[2];
                chartData[0] = date;
                chartData[1] = count;

                chartDataList.add(chartData);
            }

        } catch (Exception ex) {
            log.error("오류가 발생했습니다. (발생 오류 : {})", ex.getMessage());
        } finally {
            if (pstmt != null) {
                pstmt.close();

                if (conn != null) {
                    conn.close();
                }
            }

            return chartDataList;
        }

    }

    
    // 설문별 참여 인원 
    public List<Object[]> surveyChart(String basePath, String[] surveyList) {
        List<Object[]> surveyDataList = new ArrayList<>();
        // surveyList = [강의 아이디, 설문 엑셀 파일명, 설문 제목, 시작 기간, 마감 기간]
        int surveyCount = surveyList.length / 4;

        for (int i = 0; i < surveyCount; i++) {
            String surveyExcelName = surveyList[i * 4];  // 설문 엑셀 파일명 
            int dotIndex = surveyExcelName.lastIndexOf(".");  // 확장자 제거 
            surveyExcelName = surveyExcelName.substring(0, dotIndex);
            String surveyName = surveyList[i * 4 + 1];  // 설문 제목           
            int rowCount = 0;  

            try {
                String fileName = surveyExcelName + "-" + surveyName + ".xlsx";
                File file = new File(basePath + "/" + fileName);

                FileInputStream fileInputStream = new FileInputStream(file);
                XSSFWorkbook workbook = new XSSFWorkbook(fileInputStream);

                int sheetCount = workbook.getNumberOfSheets();

                for (int j = 0; j < sheetCount; j++) {
                    XSSFSheet sheet = workbook.getSheetAt(j);
                    rowCount += sheet.getPhysicalNumberOfRows() - 1;  // 헤더 행 제외 
                }

                fileInputStream.close();
            } catch (FileNotFoundException e) {
                // 결과 파일이 존재하지 않을 경우 설문 참여한 사람이 없다는 의미이므로 행 갯수 0으로 설정 
                rowCount = 0;
            } catch (IOException e) {
                e.printStackTrace();
            }

            Object[] chartData = new Object[2];
            chartData[0] = surveyExcelName + "-" + surveyName;
            chartData[1] = rowCount;

            surveyDataList.add(chartData);
        }

        return surveyDataList;
    }
}
