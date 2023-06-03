/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.battery.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.logging.Level;
import java.util.logging.Logger;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.CacheControl;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;
import static org.springframework.web.servlet.function.RequestPredicates.contentType;

/**
 *
 * @author qntjd
 * 폴더 확인 후 파일 경로를 반환과 같은 공통적인 정보 입력 서비스를 실행하는 클래스
 */
@Slf4j
public class FileService {
    
    //파일을 저장할 폴더를 확인 후 생성하거나 바로 파일 저장 경로를 반환한다.
    public final static String insertFolder(String realpath, MultipartFile file,String lecid,String id){
        File baseDir = new File(realpath);// 각 파일 폴더
        File baseLecidDir = new File(String.format("%s/%s", realpath, lecid));// 각 강의 폴더
        File baseIdDir = new File(String.format("%s/%s", baseLecidDir, id));// 파일 폴더에 아이디 폴더
        
        if("".equals(file.getOriginalFilename())){
            return "";
        }else{
            if(!baseDir.exists()){
                baseDir.mkdir();
                log.debug("create BaseFolder ={}",baseDir);
            }
            if(!baseLecidDir.exists()){
                baseLecidDir.mkdir();
                log.debug("create BaseLecIDFolder ={}",baseLecidDir);
            }
            if(!baseIdDir.exists()){
                baseIdDir.mkdir();
                log.debug("create BaseIDFolder ={}",baseIdDir);
            }
            File f = new File(baseIdDir + File.separator + file.getOriginalFilename());
            try(BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(f))){
                bos.write(file.getBytes());
                return lecid + File.separator +id + File.separator + file.getOriginalFilename();
            }catch(IOException e){
                log.debug("{}insertFolder : 오류 발생 = {}",id + File.separator + file.getOriginalFilename(), e.getMessage());
                return e.getMessage();
            }
        }
    }
    
    public final static ResponseEntity<Resource> downloadFile(String url, String filename,HttpHeaders headers){
        //파일의 Content-Type 찾기
        Path path = Paths.get(url + File.separator + filename);
        String contentType = null;
        try {
            contentType = Files.probeContentType(path);
            log.debug("File: {}, Content-Type: {}", path.toString(), contentType);
        } catch (IOException e) {
            log.error("download: 오류 발생 - {}", e.getMessage());
        }

        //Http 헤더 생성
        headers.setContentDisposition(
                ContentDisposition.builder("attachment").filename(filename, StandardCharsets.UTF_8).build());
        headers.add(HttpHeaders.CONTENT_TYPE, contentType);

        //파일을 입력 스트림으로 만들어 내려받기 준비
        Resource resource = null;
        try {
            resource = new InputStreamResource(Files.newInputStream(path));
        } catch (IOException e) {
            log.error("download: 오류 발생 - {}", e.getMessage());
        }
        if (resource == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        return new ResponseEntity<>(resource, headers, HttpStatus.OK);
    }
}
