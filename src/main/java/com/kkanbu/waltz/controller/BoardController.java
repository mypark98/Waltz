package com.kkanbu.waltz.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.jdbc.UncategorizedSQLException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kkanbu.waltz.common.CommandMap;
import com.kkanbu.waltz.service.BoardService;
import com.kkanbu.waltz.util.FileUtils;
import com.kkanbu.waltz.vo.PageMaker;
import com.kkanbu.waltz.vo.SearchCriteria;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class BoardController {

   Logger log = Logger.getLogger(this.getClass());

   @Resource(name = "boardService")
   private BoardService boardService;

   // 게시판 목록 조회
   @RequestMapping(value = "/board/questionBoardList")
   public ModelAndView openBoardList(SearchCriteria scri) throws Exception {
      ModelAndView mav = new ModelAndView("/board/questionBoardList");

         PageMaker pageMaker = new PageMaker();
         
         int totalCnt = boardService.countBoardListTotal(scri);
         pageMaker.setCri(scri);
         pageMaker.setTotalCount(totalCnt);
         
         scri.setTotalCnt(totalCnt);
        
         
         List<Map<String, Object>> list = boardService.selectBoardList(scri);
         
         List<Integer> cntList = new ArrayList<>();

         for (int i = 0; i < list.size(); i++) {
            int cnt = boardService.countComment(Integer.parseInt(list.get(i).get("PO_NUM").toString()));
            cntList.add(cnt);
         }

         mav.addObject("cntList",cntList);
         mav.addObject("list", list);
         mav.addObject("pageMaker", pageMaker);
         mav.addObject("count",totalCnt);
         mav.addObject("scri",scri);
         
      
      return mav;
   }
   
   // 글 목록에서 글작성 페이지로 이동
   @RequestMapping(value = "/board/questionBoardWrite")
   public String boardWrite(@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
      model.addAttribute("scri",scri);
      return "board/questionBoardWrite";
   }
   
   // DB에 글 추가 후 글 목록으로 이동
   @RequestMapping(value = "/board/questionBoardInsert")
   public ModelAndView boardInsert(CommandMap commandMap, MultipartHttpServletRequest mpRequest) throws Exception {
      ModelAndView mav = new ModelAndView("redirect:/board/questionBoardList");
      
      System.out.println("controller"+commandMap.getMap());
      boardService.insertBoard(commandMap, mpRequest);
      return mav;
   }
   
   
   private static String CURR_IMAGE_REPO_PATH = "C:\\mp\\file\\";
   
   // 파일 다운
   @RequestMapping(value = "/fileDown")
   public void fileDown1(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception {
       Map<String, Object> resultMap = boardService.selectFileInfo(map);

       OutputStream out = response.getOutputStream();

       String storedFileName = (String) resultMap.get("STORED_FILE_NAME");
       String originalFileName = (String) resultMap.get("ORG_FILE_NAME");
       String filePath = CURR_IMAGE_REPO_PATH + "\\" + storedFileName;

       File image = new File(filePath);

       File thumbnail = new File(CURR_IMAGE_REPO_PATH + "\\" + "Thumbnailator" + "\\" + storedFileName + ".png");

       // 원본 이미지 파일을 가로세로 50픽셀인 png형식으로 재 생성한다
       if (image.exists()) {
           thumbnail.getParentFile().mkdirs();
           Thumbnails.of(image).size(300, 300).outputFormat("png").toFile(thumbnail);
       }

       // 생성된 썸네일 파일을 브라우저로 전송한다
       FileInputStream in = new FileInputStream(thumbnail);
       byte[] buffer = new byte[1024 * 8];
       while (true) {
           int cnt = in.read(buffer);
           if (cnt == -1) {
               break;
           }
           out.write(buffer, 0, cnt);
       }

       in.close();
       out.close();

   }
   
   
   
   // 글 상세보기
   @RequestMapping(value = "/board/questionBoardDetail")
   public ModelAndView boardDetail(CommandMap commandMap, @ModelAttribute("scri") SearchCriteria scri, Model model, HttpServletRequest request) throws Exception {
   
      ModelAndView mv = new ModelAndView("/board/questionBoardDetail");

      Map<String, Object> detail = boardService.viewBoardDetail(commandMap.getMap());
      List<Map<String, Object>> comment = boardService.selectCommentList(commandMap);
      
      int commentCnt = boardService.countComment(Integer.parseInt(detail.get("PO_NUM").toString()));

      mv.addObject("cnt", commentCnt);
      
      
      mv.addObject("detail", detail);
      mv.addObject("comment", comment);
      model.addAttribute("scri",scri);
      
      List<Map<String, Object>> fileList = boardService.selectFileList(commandMap);
      model.addAttribute("file", fileList);
   
      HttpSession session = request.getSession();
      session.setAttribute("detail", detail);
      
      return mv;
   }
   
   // 글 삭제
   @RequestMapping(value = "/board/questionBoardDelete")
   public ModelAndView boardDelete(CommandMap commandMap, SearchCriteria scri, Model model) throws Exception {
      String encodeKeyword = URLEncoder.encode(scri.getKeyword(), "UTF-8");
      ModelAndView mv = new ModelAndView("redirect:/board/questionBoardList?page="+scri.getPage()+"&perPageNum="+scri.getPerPageNum()+"&searchType="+scri.getSearchType()+"&keyword="+encodeKeyword);
               
      model.addAttribute("scri",scri);
      boardService.questionDeleteBoard(commandMap.getMap());

      return mv;
   }
   
   // 글 수정(글목록->글수정)
   @RequestMapping(value = "/board/questionBoardUpdate", method = RequestMethod.GET)
   public ModelAndView boardUpdate(CommandMap commandMap,@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {      
      ModelAndView mv = new ModelAndView("/board/questionBoardUpdate");
      Map<String, Object> detail = boardService.selectBoardDetail(commandMap.getMap());
      mv.addObject("detail", detail);
            
      model.addAttribute("scri",scri);
      
      List<Map<String, Object>> fileList = boardService.selectFileList(commandMap);
      model.addAttribute("file", fileList);
      return mv;
   }
      
   
   // 글 수정 후 등록
   @RequestMapping(value = "/board/questionBoardUpdate", method = RequestMethod.POST)
   public ModelAndView boardUpdatePOST(CommandMap commandMap, @ModelAttribute("scri") SearchCriteria scri, Model model,
         @RequestParam(value = "fileNoDel[]") String[] files,
         @RequestParam(value = "fileNameDel[]") String[] fileNames, MultipartHttpServletRequest mpRequest)
         throws Exception {

      String encodeKeyword = URLEncoder.encode(scri.getKeyword(), "UTF-8");

      ModelAndView mv = new ModelAndView(
            "redirect:/board/questionBoardDetail?PO_NUM=" + commandMap.get("PO_NUM").toString() 
            + "&BO_NUM=" + commandMap.get("BO_NUM").toString() + "&page=" + scri.getPage() 
            + "&perPageNum=" + scri.getPerPageNum() + "&searchType=" + scri.getSearchType() 
            + "&keyword=" + encodeKeyword);

      boardService.updateBoard(commandMap.getMap(), files, fileNames, mpRequest);
      Map<String, Object> detail = boardService.selectBoardDetail(commandMap.getMap());

      mv.addObject("detail", detail);
      model.addAttribute("scri", scri);

      return mv;
   }
      
   // 댓글 작성
   @RequestMapping(value = "/board/commentBoardInsert")
   public ModelAndView commentBoardInsert(CommandMap commandMap, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
      String encodeKeyword = URLEncoder.encode(scri.getKeyword(), "UTF-8");
      
      ModelAndView mv = new ModelAndView("redirect:/board/questionBoardDetail?BO_NUM=4&PO_NUM="+commandMap.get("PO_NUM").toString()
                                 + "&page=" + scri.getPage() + "&perPageNum=" + scri.getPerPageNum()
                                 + "&searchType="+ scri.getSearchType() + "&keyword=" + encodeKeyword);
      model.addAttribute("scri",scri);
      boardService.commentBoardInsert(commandMap);
      return mv;
   }
      
      
   // 댓글 삭제
   @RequestMapping(value = "/board/commentBoardDelete")
   public ModelAndView commentBoardDelete(CommandMap commandMap, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
      String encodeKeyword = URLEncoder.encode(scri.getKeyword(), "UTF-8");
      ModelAndView mv = new ModelAndView("redirect:/board/questionBoardDetail?BO_NUM=4&PO_NUM="+commandMap.get("PO_NUM").toString()
                                 + "&page=" + scri.getPage() + "&perPageNum=" + scri.getPerPageNum()
                                 + "&searchType="+ scri.getSearchType() + "&keyword=" + encodeKeyword);

      boardService.commentBoardDelete(commandMap.getMap());
      model.addAttribute("scri",scri);
      return mv;
   }
   
   // 댓글 수정
   @RequestMapping(value = "/comment/commentUpdate")
   public ModelAndView commentBoardUpdate(CommandMap commandMap, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
      String encodeKeyword = URLEncoder.encode(scri.getKeyword(), "UTF-8");
      
      ModelAndView mv = new ModelAndView("redirect:/board/questionBoardDetail?BO_NUM=4&PO_NUM="+commandMap.get("PO_NUM").toString()
            + "&page=" + scri.getPage() + "&perPageNum=" + scri.getPerPageNum()
            + "&searchType="+ scri.getSearchType() + "&keyword=" + encodeKeyword);
      
         boardService.commentBoardUpdate(commandMap.getMap());   
      
         model.addAttribute("scri",scri);
         return mv;
   }
   

}