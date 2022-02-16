package com.kkanbu.waltz.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kkanbu.waltz.common.CommandMap;
import com.kkanbu.waltz.dao.BoardDAO;
import com.kkanbu.waltz.util.FileUtils;
import com.kkanbu.waltz.vo.SearchCriteria;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

   Logger log = Logger.getLogger(this.getClass());

   @Resource(name = "boardDAO")
   private BoardDAO boardDAO;

   // 목록 조회
   @Override
   public List<Map<String, Object>> selectBoardList(SearchCriteria scri) throws Exception {
      return boardDAO.selectBoardList(scri);
   }

   // 게시글 총 갯수
   @Override
   public int countBoardListTotal(SearchCriteria scri) throws Exception {
      // TODO Auto-generated method stub
      return boardDAO.countBoardList(scri);
   }

   @Resource(name = "fileUtils")
   private FileUtils fileUtils;

   // 글 삽입
   @Override
   public void insertBoard(CommandMap commandMap, MultipartHttpServletRequest mpRequest) throws Exception {
      boardDAO.insertBoard(commandMap);
      List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(commandMap, mpRequest);
      int size = list.size();
      for (int i = 0; i < size; i++) {

         
         boardDAO.insertFile(list.get(i));

      }
   }

   // 상세보기
   @Transactional
   @Override
   public Map<String, Object> viewBoardDetail(Map<String, Object> map) {
      boardDAO.updateHitBoard(map); // 조회수 1 증가
      Map<String, Object> detail = boardDAO.detailBoard(map); // 상세정보 가져오기
      return detail;
   }

   // 삭제하기
   @Override
   public void questionDeleteBoard(Map<String, Object> map) {
      boardDAO.questionDeleteBoard(map);
   }

   // 조회
   @Override
   public Map<String, Object> selectBoardDetail(Map<String, Object> map) {
      return boardDAO.detailBoard(map);
   }

   // 수정
   @Override
   public void updateBoard(Map<String, Object> map, String[] files, String[] fileNames,
         MultipartHttpServletRequest mpRequest) throws Exception {

      boardDAO.updateBoard(map);

      List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(map, files, fileNames, mpRequest);
      Map<String, Object> tempMap = null;
      int size = list.size();
      for (int i = 0; i < size; i++) {
         tempMap = list.get(i);
         if (tempMap.get("FI_IS_USED").equals("1")) {
            boardDAO.insertFile(tempMap);
         } else {
            boardDAO.updateFile(tempMap);
         }
      }
   }

   // 댓글 목록 불러오기
   @Override
   public List<Map<String, Object>> selectCommentList(CommandMap commandMap) {
      return boardDAO.selectCommentList(commandMap);
   }

   // 댓글 삭제
   @Override
   public void commentBoardDelete(Map<String, Object> map) {
      boardDAO.commentBoardDelete(map);
   }

   @Override
   public void commentBoardInsert(CommandMap commandMap) {
      boardDAO.commentBoardInsert(commandMap);
   }

   @Override
   public List<Map<String, Object>> selectFileList(CommandMap commandMap) throws Exception {

      System.out.println("P%%%%%%" + commandMap.getMap().get("PO_NUM"));
      System.out.println("B : " + commandMap.getMap().get("BO_NUM"));
      return boardDAO.selectFileList(commandMap);
   }

   @Override
   public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
      return boardDAO.selectFileInfo(map);
   }

   // 댓글 수정
   @Override
   public void commentBoardUpdate(Map<String, Object> map) throws Exception {
      boardDAO.commentBoardUpdate(map);
   }
   
   @Override
      public int countComment(int PO_NUM) {
         return boardDAO.commentCount(PO_NUM);
      }

}