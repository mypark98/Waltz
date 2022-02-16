package com.kkanbu.waltz.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kkanbu.waltz.common.CommandMap;
import com.kkanbu.waltz.vo.Criteria;
import com.kkanbu.waltz.vo.SearchCriteria;

public interface BoardService {
	// 게시물 목록 조회
	List<Map<String, Object>> selectBoardList(SearchCriteria scri) throws Exception;

	// 게시물 총 갯수
	int countBoardListTotal(SearchCriteria scri) throws Exception;
	
	// 글 작성
	void insertBoard(CommandMap commandMap, MultipartHttpServletRequest mpRequest) throws Exception;
	
	// 상세보기 1
	Map<String, Object> viewBoardDetail(Map<String, Object> map);

	// 글 삭제
	void questionDeleteBoard(Map<String, Object> map);
	
	// 상세보기 2
	Map<String, Object> selectBoardDetail(Map<String, Object> map);
	
	// 첨부파일 조회
	List<Map<String, Object>> selectFileList(CommandMap commandMap) throws Exception;
	
	// 첨부파일 다운'
	Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
	 
	
	// 글 수정
	void updateBoard(Map<String, Object> map,
					String[] files,
					String[] fileNames,
					MultipartHttpServletRequest mpRequest) throws Exception;
	
	// 댓글 조회
	List<Map<String, Object>> selectCommentList(CommandMap commandMap);

	// 댓글 삭제
	void commentBoardDelete(Map<String, Object> map);
	
	// 댓글 작성
	void commentBoardInsert(CommandMap commandMap);
	
	void commentBoardUpdate(Map<String, Object> map) throws Exception;
	
	int countComment(int PO_NUM);
}
