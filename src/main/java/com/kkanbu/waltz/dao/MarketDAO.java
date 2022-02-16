package com.kkanbu.waltz.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.kkanbu.waltz.common.CommandMap;
import com.kkanbu.waltz.vo.SearchCriteria;

@Repository("marketDAO")
public class MarketDAO extends AbstractDAO {

   // 게시물 목록 조회
   @SuppressWarnings("unchecked")
   public List<Map<String, Object>> selectBoardList(SearchCriteria scri) throws Exception {
      return (List<Map<String, Object>>) selectList("market.marketListPage", scri);
   }

   // 게시물 총 갯수
   public int countBoardList(SearchCriteria scri) throws Exception {
      return (Integer) selectOne("market.marketListCount", scri);
   }

   // 게시글 작성
   public void insertBoard(CommandMap commandMap) {
      insert("market.insertBoard", commandMap.getMap());
      insert("market.insertMarket", commandMap.getMap());
   }

   // 첨부파일 업로드
   public void insertFile(Map<String, Object> map) {
      insert("market.insertFile", map);
   }

   // 게시글 상세보기
   // 조회수 1 증가
   public void updateHitBoard(Map<String, Object> map) {
      update("market.updateHitBoard", map.get("PO_NUM").toString());
   }

   // 게시글 상세보기
   @SuppressWarnings("unchecked")
   public Map<String, Object> detailBoard(Map<String, Object> map) {
      return (Map<String, Object>) selectOne("market.marketBoardDetail", map);
   }

   // 댓글 목록 조회
   @SuppressWarnings("unchecked")
   public List<Map<String, Object>> selectCommentList(CommandMap commandMap) {
      return (List<Map<String, Object>>) selectList("comment.readComment", commandMap.get("PO_NUM").toString());
   }

   // 첨부파일 조회
   @SuppressWarnings("unchecked")
   public List<Map<String, Object>> selectFileList(CommandMap commandMap) throws Exception {
      System.out.println("asd************asdasdas" + commandMap.getMap());
      System.out.println("asd************asdasdas" + commandMap.getMap().get("po_num"));
      System.out.println("asd************asdasdas" + commandMap.getMap().get("bo_num"));
      System.out.println("asd************asdasdas" + commandMap.getMap().get("PO_NUM"));
      System.out.println("asd************asdasdas" + commandMap.getMap().get("BO_NUM"));

      return (List<Map<String, Object>>) selectList("market.selectFileList", commandMap.getMap());
   }

   // 첨부파일 다운
   @SuppressWarnings("unchecked")
   public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
      System.out.println(map);
      return (Map<String, Object>) selectOne("market.selectFileInfo", map);
   }

   // 첨부파일 수정
   public void updateFile(Map<String, Object> map) throws Exception {
      update("market.updateFile", map);
   }

   // 게시글 수정
   public void updateBoard(Map<String, Object> map) {
      update("market.marketUpdateBoard", map);
   }

   // 게시글 삭제
   public void marketDeleteBoard(Map<String, Object> map) {
      update("market.marketDeleteBoard", map);
   }

   // 댓글 작성
   public void commentBoardInsert(CommandMap commandMap) {
      insert("comment.writeComment", commandMap.getMap());
   }

   // 댓글 삭제
   public void commentBoardDelete(Map<String, Object> map) {
      delete("comment.commentDeleteBoard", map);
   }

   // 댓글 수정
   public void commentBoardUpdate(Map<String, Object> map) {
      update("comment.updateComment", map);
   }

   public int commentCount(int PO_NUM) {
      return (Integer) selectOne("comment.commentDetailCount", PO_NUM);
   }

   // 게시글 번호에 해당하는 파일 조회
   @SuppressWarnings("unchecked")
   public List<Map<String, Object>> fileMatchList(String po_num) throws Exception {
      return (List<Map<String, Object>>) selectList("market.fileMatchList", po_num);
   }

}
