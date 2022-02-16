package com.kkanbu.waltz.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kkanbu.waltz.common.CommandMap;
import com.kkanbu.waltz.vo.Criteria;
import com.kkanbu.waltz.vo.SearchCriteria;

@Repository("boardDAO")
public class BoardDAO extends AbstractDAO {

   // 게시물 목록 조회
   @SuppressWarnings("unchecked")
   public List<Map<String, Object>> selectBoardList(SearchCriteria scri) throws Exception {
      return (List<Map<String, Object>>) selectList("board.questionListPage", scri);
   }

   // 게시물 총 갯수
   public int countBoardList(SearchCriteria scri) throws Exception {
      return (Integer) selectOne("board.questionListCount", scri);
   }

   // xml파일에서 등록해준 dataSource를 통해 트랜잭션을 관리할수있음(Spring 기능)
   // 메소드 위에 트랜잭션 어노테이션을 붙여 메소드를 하나의 작업단위로 만들어줌(해당 메소드안에 있는 모든 내용이 정상 실행되어야 작동함 ALL
   // OR NOTING)
   @Transactional
   public void insertBoard(CommandMap commandMap) {
      insert("board.insertBoard", commandMap.getMap());
      insert("board.insertInfo", commandMap.getMap());
   }

   // 조회수 1 증가
   public void updateHitBoard(Map<String, Object> map) {
      update("board.updateHitBoard", map.get("PO_NUM").toString());
   }

   @SuppressWarnings("unchecked")
   public Map<String, Object> detailBoard(Map<String, Object> map) {
      return (Map<String, Object>) selectOne("board.questionBoardDetail", map);
   }

   // 글 삭제
   public void questionDeleteBoard(Map<String, Object> map) {
      update("board.questionDeleteBoard", map);
   }

   // 글 수정
   public void updateBoard(Map<String, Object> map) {
      update("board.questionUpdateBoard", map);
      update("board.questionUpdateBoardInfo", map);
   }

   public void insertInfo(CommandMap commandMap) {
      insert("board.insertInfo", commandMap.getMap());
   }

   // 첨부파일 업로드
   public void insertFile(Map<String, Object> map) {
      insert("board.insertFile", map);
   }

   // 첨부파일 조회
   @SuppressWarnings("unchecked")
   public List<Map<String, Object>> selectFileList(CommandMap commandMap) throws Exception {
      System.out.println("asd************asdasdas" + commandMap.getMap());
      System.out.println("asd************asdasdas" + commandMap.getMap().get("po_num"));
      System.out.println("asd************asdasdas" + commandMap.getMap().get("bo_num"));
      System.out.println("asd************asdasdas" + commandMap.getMap().get("PO_NUM"));
      System.out.println("asd************asdasdas" + commandMap.getMap().get("BO_NUM"));

      return (List<Map<String, Object>>) selectList("board.selectFileList", commandMap.getMap());
   }

   // 첨부파일 다운
   @SuppressWarnings("unchecked")
   public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
      System.out.println(map);
      return (Map<String, Object>) selectOne("board.selectFileInfo", map);
   }

   // 첨부파일 수정
   public void updateFile(Map<String, Object> map) throws Exception {
      update("board.updateFile", map);
   }

   // 첨부파일 삭제

   // 댓글 목록 조회
   @SuppressWarnings("unchecked")
   public List<Map<String, Object>> selectCommentList(CommandMap commandMap) {
      return (List<Map<String, Object>>) selectList("comment.readComment", commandMap.get("PO_NUM").toString());
   }

   // 댓글 삭제
   public void commentBoardDelete(Map<String, Object> map) {
      delete("comment.commentDeleteBoard", map);
   }

   // 댓글 작성
   public void commentBoardInsert(CommandMap commandMap) {
      insert("comment.writeComment", commandMap.getMap());
   }

   // 댓글 수정
   public void commentBoardUpdate(Map<String, Object> map) {
      update("comment.updateComment", map);
   }
   
   // 댓글 갯수
      public int commentCount(int PO_NUM) {
         return (Integer) selectOne("comment.commentDetailCount", PO_NUM);
      }

}