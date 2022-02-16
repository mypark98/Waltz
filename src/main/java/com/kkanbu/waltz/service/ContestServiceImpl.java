package com.kkanbu.waltz.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kkanbu.waltz.common.CommandMap;
import com.kkanbu.waltz.dao.ContestDAO;
import com.kkanbu.waltz.util.FileUtils;
import com.kkanbu.waltz.vo.SearchCriteria;

@Service("contestService")
public class ContestServiceImpl implements ContestService {

   Logger log = Logger.getLogger(this.getClass());

   @Resource(name = "contestDAO")
   private ContestDAO contestDAO;

   // 목록 조회
   @Override
   public List<Map<String, Object>> selectBoardList(SearchCriteria scri) throws Exception {
      return contestDAO.selectBoardList(scri);
   }

   // 게시글 총 갯수
   @Override
   public int countBoardListTotal(SearchCriteria scri) throws Exception {
      return contestDAO.countBoardList(scri);
   }

   @Resource(name = "fileUtils")
   private FileUtils fileUtils;

   // 글 삽입
   @Override
   public void insertBoard(CommandMap commandMap, MultipartHttpServletRequest mpRequest) throws Exception {
      contestDAO.insertBoard(commandMap);
      List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(commandMap, mpRequest);
      int size = list.size();
      for (int i = 0; i < size; i++) {

         list.get(i).put("MEM_ID", commandMap.get("MEM_ID"));
         list.get(i).put("BO_NUM", commandMap.get("BO_NUM"));
         contestDAO.insertFile(list.get(i));

      }
   }

   // 상세보기
   @Transactional
   @Override
   public Map<String, Object> viewBoardDetail(Map<String, Object> map) {
      contestDAO.updateHitBoard(map); // 조회수 1 증가
      Map<String, Object> detail = contestDAO.detailBoard(map); // 상세정보 가져오기
      return detail;
   }

   // 댓글 목록 불러오기
   @Override
   public List<Map<String, Object>> selectCommentList(CommandMap commandMap) {
      return contestDAO.selectCommentList(commandMap);
   }

   // 파일 목록 불러오기
   @Override
   public List<Map<String, Object>> selectFileList(CommandMap commandMap) throws Exception {

      System.out.println("P%%%%%%" + commandMap.getMap().get("PO_NUM"));
      System.out.println("B : " + commandMap.getMap().get("BO_NUM"));
      return contestDAO.selectFileList(commandMap);
   }

   // 게시글 상세조회
   @Override
   public Map<String, Object> selectBoardDetail(Map<String, Object> map) {
      return contestDAO.detailBoard(map);
   }

   // 파일 불러오기
   @Override
   public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
      return contestDAO.selectFileInfo(map);
   }

   // 수정
   @Override
   public void updateBoard(Map<String, Object> map, String[] files, String[] fileNames,
         MultipartHttpServletRequest mpRequest) throws Exception {

      contestDAO.updateBoard(map);

      List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(map, files, fileNames, mpRequest);
      Map<String, Object> tempMap = null;
      int size = list.size();
      for (int i = 0; i < size; i++) {
         tempMap = list.get(i);
         if (tempMap.get("FI_IS_USED").equals("1")) {
            contestDAO.insertFile(tempMap);
         } else {
            contestDAO.updateFile(tempMap);
         }
      }
   }

   // 게시글 삭제
   @Override
   public void questionDeleteBoard(Map<String, Object> map) {
      contestDAO.questionDeleteBoard(map);
   }

   // 댓글 작성
   @Override
   public void commentBoardInsert(CommandMap commandMap) {
      contestDAO.commentBoardInsert(commandMap);
   }

   // 댓글 삭제
   @Override
   public void commentBoardDelete(Map<String, Object> map) {
      contestDAO.commentBoardDelete(map);
   }

   // 댓글 수정
   @Override
   public void commentBoardUpdate(Map<String, Object> map) throws Exception {
      contestDAO.commentBoardUpdate(map);
   }
   
   // 댓글 갯수
      @Override
      public int countComment(int PO_NUM) {
         return contestDAO.commentCount(PO_NUM);
      }
      
      
      
   // 게시글 번호에 해당하는 파일명 조회
      @SuppressWarnings("null")
      @Override
      public Map<String, Object> fileMatchList(String po_num) throws Exception {
         List<Map<String, Object>> list = contestDAO.fileMatchList(po_num);

         Map<String, Object> fileMap = new HashMap<String, Object>();
         int flag = -1;

         if (list != null && list.size() > 0) {
            for (int i = 0; i < list.size(); i++) {
               System.out.println("##############service###############"+i);
               String STORED_FILE_NAME = list.get(i).get("STORED_FILE_NAME").toString();

               int FI_NUM = Integer.parseInt(list.get(i).get("FI_NUM").toString());

               if (STORED_FILE_NAME.substring(0, 2).equals("S_")) {
                  flag = 0;
                  fileMap.put("STORED_FILE_NAME", list.get(i).get("STORED_FILE_NAME").toString());
                  fileMap.put("FI_NUM", FI_NUM);

                  return fileMap;
               }
            }
            if (flag == -1) {
               String STORED_FILE_NAME = list.get(0).get("STORED_FILE_NAME").toString(); 
               int   FI_NUM = Integer.parseInt(list.get(0).get("FI_NUM").toString());
                
               fileMap.put("STORED_FILE_NAME", STORED_FILE_NAME); 
               fileMap.put("FI_NUM", FI_NUM);
                
               
               
               System.out.println("##############service###############");
               System.out.println(list.size());
               System.out.println(STORED_FILE_NAME);
               System.out.println("##############service###############");
               
               return fileMap;
            }
         }
         fileMap.put("STORED_FILE_NAME", "noimage");
         fileMap.put("FI_NUM", 0);

         return fileMap;
      }

}