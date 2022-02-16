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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kkanbu.waltz.common.CommandMap;
import com.kkanbu.waltz.service.ContestService;
import com.kkanbu.waltz.vo.PageMaker;
import com.kkanbu.waltz.vo.SearchCriteria;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class ContestController {

   Logger log = Logger.getLogger(this.getClass());

   @Resource(name = "contestService")
   private ContestService contestService;

   // 게시판 목록 조회
   @RequestMapping(value = "/contest/contestBoardList")
     public ModelAndView openBoardList(SearchCriteria scri) throws Exception {
         ModelAndView mav = new ModelAndView("/contest/contestBoardList");

         PageMaker pageMaker = new PageMaker();

         int totalCnt = contestService.countBoardListTotal(scri);
         pageMaker.setCri(scri);
         pageMaker.setTotalCount(totalCnt);

         scri.setTotalCnt(totalCnt);

         List<Map<String, Object>> list = contestService.selectBoardList(scri);
         List<Integer> cntList = new ArrayList<>();
         List<Map<String, Object>> Thumbnail = new ArrayList<>();
         
         
         for (int i = 0; i < list.size(); i++) {
            int cnt = contestService.countComment(Integer.parseInt(list.get(i).get("PO_NUM").toString()));
            cntList.add(cnt);

            
            Map<String, Object> fiList= contestService.fileMatchList(list.get(i).get("PO_NUM").toString());
            

            
            Thumbnail.add(fiList);
         }

         
         mav.addObject("Thumbnail",Thumbnail);
         mav.addObject("cntList", cntList);
         mav.addObject("list", list);
         mav.addObject("pageMaker", pageMaker);
         mav.addObject("count", totalCnt);
         mav.addObject("scri", scri);

         return mav;
      }
   // 글 목록에서 글작성 페이지로 이동
   @RequestMapping(value = "/contest/contestBoardWrite")
   public String boardWrite(@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
      model.addAttribute("scri", scri);
      return "contest/contestBoardWrite";
   }

   // DB에 글 추가 후 글 목록으로 이동
   @RequestMapping(value = "/contest/contestBoardInsert")
   public ModelAndView boardInsert(CommandMap commandMap, MultipartHttpServletRequest mpRequest) throws Exception {
      ModelAndView mav = new ModelAndView("redirect:/contest/contestBoardList");
      contestService.insertBoard(commandMap, mpRequest);
      return mav;
   }

   // 글 상세보기
   @RequestMapping(value = "/contest/contestBoardDetail")
   public ModelAndView boardDetail(CommandMap commandMap, @ModelAttribute("scri") SearchCriteria scri, Model model, HttpServletRequest request)
         throws Exception {

      ModelAndView mv = new ModelAndView("/contest/contestBoardDetail");

      Map<String, Object> detail = contestService.viewBoardDetail(commandMap.getMap());
      List<Map<String, Object>> comment = contestService.selectCommentList(commandMap);
      
      int commentCnt = contestService.countComment(Integer.parseInt(detail.get("PO_NUM").toString()));

         mv.addObject("cnt", commentCnt);
      

      mv.addObject("detail", detail);
      mv.addObject("comment", comment);
      model.addAttribute("scri", scri);

      System.out.println(detail);
      System.out.println(comment);
      System.out.println(scri);
      
      HttpSession session = request.getSession();
      session.setAttribute("detail", detail);

      List<Map<String, Object>> fileList = contestService.selectFileList(commandMap);
      model.addAttribute("file", fileList);
      return mv;
   }

   // 글 수정(글목록->글수정)
   @RequestMapping(value = "/contest/contestBoardUpdate", method = RequestMethod.GET)
   public ModelAndView boardUpdate(CommandMap commandMap, @ModelAttribute("scri") SearchCriteria scri, Model model)
         throws Exception {
      ModelAndView mv = new ModelAndView("/contest/contestBoardUpdate");
      Map<String, Object> detail = contestService.selectBoardDetail(commandMap.getMap());
      mv.addObject("detail", detail);

      model.addAttribute("scri", scri);

      List<Map<String, Object>> fileList = contestService.selectFileList(commandMap);
      model.addAttribute("file", fileList);
      
      return mv;
   }

   // 글 수정 후 등록
   @RequestMapping(value = "/contest/contestBoardUpdate", method = RequestMethod.POST)
   public ModelAndView boardUpdatePOST(CommandMap commandMap, @ModelAttribute("scri") SearchCriteria scri, Model model,
         @RequestParam(value = "fileNoDel[]") String[] files,
         @RequestParam(value = "fileNameDel[]") String[] fileNames, MultipartHttpServletRequest mpRequest)
         throws Exception {

      String encodeKeyword = URLEncoder.encode(scri.getKeyword(), "UTF-8");

      ModelAndView mv = new ModelAndView(
            "redirect:/contest/contestBoardDetail?PO_NUM=" + commandMap.get("PO_NUM").toString() + "&BO_NUM="
                  + commandMap.get("BO_NUM").toString() + "&page=" + scri.getPage() + "&perPageNum="
                  + scri.getPerPageNum() + "&searchType=" + scri.getSearchType() + "&keyword=" + encodeKeyword);

      contestService.updateBoard(commandMap.getMap(), files, fileNames, mpRequest);
      Map<String, Object> detail = contestService.selectBoardDetail(commandMap.getMap());

      mv.addObject("detail", detail);
      model.addAttribute("scri", scri);

      return mv;
   }
   
   private static String CURR_IMAGE_REPO_PATH = "C:\\mp\\file\\";

   // 첨부파일 다운로드
   @RequestMapping(value = "/contest/fileDown")
   public void fileDown1(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception {
         OutputStream out = null;
         File image = null;
         File thumbnail = null;
         
         if(!(map.get("imageFileName").toString().equals("noimage"))) {
            Map<String, Object> resultMap = contestService.selectFileInfo(map);

             out = response.getOutputStream();
            
            String storedFileName = (String) resultMap.get("STORED_FILE_NAME");
            String filePath = CURR_IMAGE_REPO_PATH + "\\" + storedFileName;

            image = new File(filePath);

            thumbnail = new File(CURR_IMAGE_REPO_PATH + "\\" + "Thumbnailator" + "\\" + storedFileName + ".png");
            
            // 원본 이미지 파일을 가로세로 50픽셀인 png형식으로 재 생성한다
            if (image.exists()) {
               thumbnail.getParentFile().mkdirs();
               Thumbnails.of(image).size(300, 300).outputFormat("png").toFile(thumbnail);
            }
            
         }else {
            out = response.getOutputStream();
            thumbnail = new File(CURR_IMAGE_REPO_PATH + "\\" + "Thumbnailator" + "\\" + map.get("imageFileName").toString() + ".png");
            
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
   
   
   
   
   
   
   
   

   // 게시글 삭제
   // 글 삭제
   @RequestMapping(value = "/contest/contestBoardDelete")
   public ModelAndView boardDelete(CommandMap commandMap, SearchCriteria scri, Model model) throws Exception {
      String encodeKeyword = URLEncoder.encode(scri.getKeyword(), "UTF-8");
      ModelAndView mv = new ModelAndView("redirect:/contest/contestBoardList?page=" + scri.getPage() + "&perPageNum="
            + scri.getPerPageNum() + "&searchType=" + scri.getSearchType() + "&keyword=" + encodeKeyword);

      model.addAttribute("scri", scri);
      contestService.questionDeleteBoard(commandMap.getMap());

      return mv;
   }

   // 댓글 작성
   @RequestMapping(value = "/contest/commentBoardInsert")
   public ModelAndView commentBoardInsert(CommandMap commandMap) throws Exception {
      ModelAndView mv = new ModelAndView(
            "redirect:/contest/contestBoardDetail?PO_NUM=" + commandMap.get("PO_NUM").toString());

      contestService.commentBoardInsert(commandMap);
      return mv;
   }

   // 댓글 삭제
   @RequestMapping(value = "/contest/commentBoardDelete")
   public ModelAndView commentBoardDelete(CommandMap commandMap, @ModelAttribute("scri") SearchCriteria scri,
         Model model) throws Exception {
      ModelAndView mv = new ModelAndView(
            "redirect:/contest/contestBoardDetail?PO_NUM=" + commandMap.get("PO_NUM").toString());
      contestService.commentBoardDelete(commandMap.getMap());

      model.addAttribute("scri", scri);
      return mv;
   }

   // 댓글 수정
   @RequestMapping(value = "/contest/commentUpdate")
   public ModelAndView commentBoardUpdate(CommandMap commandMap, @ModelAttribute("scri") SearchCriteria scri,
         Model model) throws Exception {
      String encodeKeyword = URLEncoder.encode(scri.getKeyword(), "UTF-8");

      System.out.println("@@@@@@@@@@@@@@@@2" + commandMap.getMap());
      System.out.println(commandMap.get("PO_NUM").toString());
      System.out.println(scri.getPage());
      System.out.println(scri.getPerPageNum());
      System.out.println(scri.getSearchType());
      System.out.println(encodeKeyword);
      System.out.println();

      ModelAndView mv = new ModelAndView("redirect:/contest/contestBoardDetail?BO_NUM=1&PO_NUM="
            + commandMap.get("PO_NUM").toString() + "&page=" + scri.getPage() + "&perPageNum="
            + scri.getPerPageNum() + "&searchType=" + scri.getSearchType() + "&keyword=" + encodeKeyword);

      contestService.commentBoardUpdate(commandMap.getMap());

      model.addAttribute("scri", scri);
      return mv;
   }
   
   
   
   
   

}