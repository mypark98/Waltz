package com.kkanbu.waltz.util;

import java.io.File;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.kkanbu.waltz.common.CommandMap;

@Component("fileUtils")
public class FileUtils {
   private static final String filePath = "C:\\mp\\file\\"; // 파일이 저장될 위치

   public static String getFilepath() {
      return filePath;
   }


   public List<Map<String, Object>> parseInsertFileInfo(CommandMap commandMap, 
         MultipartHttpServletRequest mpRequest) throws Exception{
      
      /*
         Iterator은 데이터들의 집합체? 에서 컬렉션으로부터 정보를 얻어올 수 있는 인터페이스입니다.
         List나 배열은 순차적으로 데이터의 접근이 가능하지만, Map등의 클래스들은 순차적으로 접근할 수가 없습니다.
         Iterator을 이용하여 Map에 있는 데이터들을 while문을 이용하여 순차적으로 접근합니다.
      */
      
      Iterator<String> iterator = mpRequest.getFileNames();
      
      MultipartFile multipartFile = null;
      String originalFileName = null;
      String originalFileExtension = null;
      String storedFileName = null;
      
      List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
      Map<String, Object> listMap = null;
      
      int po_num = (int) commandMap.get("po_num");
      int bo_num = Integer.parseInt(String.valueOf(commandMap.get("BO_NUM")));
      String mem_id = String.valueOf(commandMap.get("MEM_ID"));
      
      File file = new File(filePath);
      if(file.exists() == false) {
         file.mkdirs(); // 경로에 해당하는 디렉토리 생성
      }
      
      int index=1;
      
      while(iterator.hasNext()) {
         multipartFile = mpRequest.getFile(iterator.next());
         
         if(multipartFile.isEmpty() == false) {
            //파일명.확장자
            originalFileName = multipartFile.getOriginalFilename();
            
            //확장자
            originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
            
            
            // 파일 이름
            if(index==1) {
               storedFileName = "S_" + getRandomString() + "_" +URLEncoder.encode(originalFileName, "UTF-8");               
            }else{               
               storedFileName = getRandomString() + "_" +URLEncoder.encode(originalFileName, "UTF-8");
            }
            
            int lastindex = storedFileName.lastIndexOf(".");
            String fileName = storedFileName.substring(0, lastindex);
            
            // 파일 위치, 파일 이름을 합친 file 객체
            file = new File(filePath + storedFileName);
            
            // 파일 저장
            try {
               multipartFile.transferTo(file);
            } catch (Exception e) {
               e.printStackTrace();
            } 
            
            listMap = new HashMap<String, Object>();
            listMap.put("po_num", po_num);
            listMap.put("BO_NUM", bo_num);
            listMap.put("MEM_ID", mem_id);
            listMap.put("ORG_FILE_NAME", originalFileName);
            listMap.put("STORED_FILE_NAME", storedFileName);
            listMap.put("FILE_SIZE", multipartFile.getSize());
            list.add(listMap);
            
            index++;
         }
      }
      return list;
   }
   
   
   
   public List<Map<String, Object>> parseUpdateFileInfo(Map<String, Object> map, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception{ 
      Iterator<String> iterator = mpRequest.getFileNames();
      MultipartFile multipartFile = null; 
      String originalFileName = null; 
      String originalFileExtension = null; 
      String storedFileName = null; 
      List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
      Map<String, Object> listMap = null; 

      System.out.println("########################################");
      System.out.println(map);
      
      int po_num = Integer.parseInt(String.valueOf(map.get("PO_NUM")));;
      int bo_num = Integer.parseInt(String.valueOf(map.get("BO_NUM")));
      String mem_id = String.valueOf(map.get("MEM_ID"));
      
      while(iterator.hasNext()){ 
         multipartFile = mpRequest.getFile(iterator.next()); 
         
         if(multipartFile.isEmpty() == false){ 
            originalFileName = URLEncoder.encode(multipartFile.getOriginalFilename(), "UTF-8"); 
            originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf(".")); 
            
            storedFileName = getRandomString() + "_" +originalFileName;
            
            multipartFile.transferTo(new File(filePath + storedFileName)); 
            listMap = new HashMap<String,Object>();
            listMap.put("FI_IS_USED", "1");
            listMap.put("po_num", po_num);
            listMap.put("BO_NUM", bo_num);
            listMap.put("MEM_ID", mem_id);
            listMap.put("ORG_FILE_NAME", originalFileName);
            listMap.put("STORED_FILE_NAME", storedFileName); 
            listMap.put("FILE_SIZE", multipartFile.getSize()); 
            list.add(listMap); 
         } 
      }
      if(files != null && fileNames != null){ 
         for(int i = 0; i<fileNames.length; i++) {
               listMap = new HashMap<String,Object>();
                    listMap.put("FI_IS_USED", "0");
               listMap.put("FI_NUM", files[i]); 
               list.add(listMap); 
         }
      }
      return list; 
   }

   
   public static String getRandomString() {
      return UUID.randomUUID().toString().replaceAll("-", "");
   }
   
}