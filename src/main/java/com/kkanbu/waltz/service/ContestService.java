package com.kkanbu.waltz.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kkanbu.waltz.common.CommandMap;
import com.kkanbu.waltz.vo.SearchCriteria;

public interface ContestService {

   // 게시물 목록 조회
   List<Map<String, Object>> selectBoardList(SearchCriteria scri) throws Exception;

   // 게시물 총 갯수
   int countBoardListTotal(SearchCriteria scri) throws Exception;

   // 게시글 작성
   void insertBoard(CommandMap commandMap, MultipartHttpServletRequest mpRequest) throws Exception;

   // 게시글 상세보기
   Map<String, Object> viewBoardDetail(Map<String, Object> map);

   // 댓글 목록 불러오기
   List<Map<String, Object>> selectCommentList(CommandMap commandMap);

   // 파일 목록 불러오기
   List<Map<String, Object>> selectFileList(CommandMap commandMap) throws Exception;

   // 게시글 상세기
   Map<String, Object> selectBoardDetail(Map<String, Object> map);

   // 첨부파일 다운로드
   Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;

   // 게시글 수정
   void updateBoard(Map<String, Object> map, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest)
         throws Exception;

   // 게시글 삭제
   void questionDeleteBoard(Map<String, Object> map);

   // 댓글 작성
   void commentBoardInsert(CommandMap commandMap);

   // 댓글 삭제
   void commentBoardDelete(Map<String, Object> map);

   // 댓글 수정
   void commentBoardUpdate(Map<String, Object> map) throws Exception;

   int countComment(int PO_NUM);


   // 게시글 번호에 해당하는 파일 조회
   Map<String, Object> fileMatchList(String string) throws Exception;

}