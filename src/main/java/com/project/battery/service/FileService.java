/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.battery.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author qntjd
 * 폴더 확인 후 파일 경로를 반환과 같은 공통적인 정보 입력 서비스를 실행하는 클래스
 */
@Slf4j
public class FileService {
    
    //파일을 저장할 폴더를 확인 후 생성하거나 바로 파일 저장 경로를 반환한다.
    public final static String insertFolder(String realpath, MultipartFile file,String id){
        File baseDir = new File(realpath);// 각 파일 폴더
        File baseIdDir = new File(String.format("%s/%s", realpath, id));// 파일 폴더에 아이디 폴더
        
        if("".equals(file.getOriginalFilename())){
            return "";
        }else{
            if(!baseDir.exists()){
                baseDir.mkdir();
                log.debug("create BaseFolder ={}",baseDir);
            }
            if(!baseIdDir.exists()){
                baseIdDir.mkdir();
                log.debug("create BaseIDFolder ={}",baseIdDir);
            }
            File f = new File(realpath + File.separator+ id + File.separator + file.getOriginalFilename());
            try(BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(f))){
                bos.write(file.getBytes());
                return id + File.separator + file.getOriginalFilename();
            }catch(IOException e){
                log.debug("{}insertFolder : 오류 발생 = {}",id + File.separator + file.getOriginalFilename(), e.getMessage());
                return e.getMessage();
            }
        }
    }
}
