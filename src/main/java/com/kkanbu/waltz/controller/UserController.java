package com.kkanbu.waltz.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kkanbu.waltz.exception.AlreadyExistingEmailException;
import com.kkanbu.waltz.service.UserService;
import com.kkanbu.waltz.util.AuthInfo;
import com.kkanbu.waltz.util.RegisterRequest;
import com.kkanbu.waltz.util.RegisterRequestValidator;
import com.kkanbu.waltz.vo.UserVO;
import com.kkanbu.waltz.vo.petVO;

@Controller
public class UserController {

   BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();

   Logger logger = Logger.getLogger(this.getClass());

   @RequestMapping("/register/step1")
   public String step1() throws Exception {
      return "/user/register/step1";
   }

   @RequestMapping("/register/step2")
   public ModelAndView step2(@RequestParam(value = "agree", defaultValue = "false") Boolean agree) throws Exception {
      if (!agree) {
         ModelAndView mv = new ModelAndView("user/register/step1");
         return mv;
      }
      ModelAndView mv = new ModelAndView("user/register/step2");
      mv.addObject("registerRequest", new RegisterRequest());
      return mv;
   }

   @Resource(name = "userService")
   private UserService userService;

   @RequestMapping("/register/step3")
   public ModelAndView step3(RegisterRequest regReq, Errors errors, HttpSession session, Model model)
         throws Exception {
      new RegisterRequestValidator().validate(regReq, errors);
      if (errors.hasErrors()) {
         ModelAndView mv = new ModelAndView("user/register/step2");
         return mv;
      }
      try {
         String inputPass = regReq.getPassword();
         String pwd = pwdEncoder.encode(inputPass);
         regReq.setPassword(pwd);

         userService.register(regReq);

      } catch (AlreadyExistingEmailException e) {
         errors.rejectValue("email", "duplicate", "이미 가입된 이메일입니다.");
         ModelAndView mv = new ModelAndView("user/register/step2");
         return mv;
      }
      ModelAndView mv = new ModelAndView("user/register/step3");
      return mv;
   }

   @RequestMapping("/register/emailConfirm")
   public String emailConfirm(RegisterRequest regReq, Model model) throws Exception {

      regReq.setAuthstatus("Y"); // authstatus를 Y로,, 권한 업데이트

      userService.updateAuthstatus(regReq);

      model.addAttribute("name", regReq.getName());

      return "/user/register/emailConfirm";
   }
   
   @RequestMapping("/myPage")
   public String userView() throws Exception {
      return "user/mypage/myPage";
   }

   // 회원 목록
   @RequestMapping("/list")
   public String userList(Model model) throws Exception {
      List<UserVO> list = userService.userList();
      model.addAttribute("list", list);
      return "user/list/userList";
   }

   @RequestMapping("/view")
   public String userView(String id, Model model) throws Exception {
      model.addAttribute("vo", userService.viewUser(id));
      return "user/list/userView";
   }

   @RequestMapping("/expelUser")
   public String expelUser(UserVO vo, HttpSession session) throws Exception {
      userService.memberDelete(vo);
      return "redirect:/";
   }

   @RequestMapping(value = "/petRegister", method = RequestMethod.GET)
   public ModelAndView getPetRegister(petVO pVo) {

      ModelAndView mv = new ModelAndView("user/pet/petRegister");

      mv.addObject("pVo", new petVO());

      return mv;
   }

   @RequestMapping(value = "/petRegister", method = RequestMethod.POST)
   public ModelAndView postPetRegister(petVO pVo, HttpSession session) {

      ModelAndView mv = new ModelAndView("user/pet/petRegisterSuccess");

      try {
         petVO petPhoto = (petVO) session.getAttribute("petPhoto");
         pVo.setANI_FILENAME(petPhoto.getANI_FILENAME());
         pVo.setANI_UPLOADPATH(petPhoto.getANI_UPLOADPATH());
         pVo.setANI_UUID(petPhoto.getANI_UUID());
         userService.petRegister(pVo);
         session.setAttribute("pVo", pVo);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return mv;
   }

   /* 첨부 파일 업로드 */
   @RequestMapping(value = "/uploadAjaxAction", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
   public ResponseEntity<List<petVO>> uploadAjaxActionPOST(MultipartFile uploadFile, HttpSession session) throws Exception {
         
      
      String uploadFolder = "C:\\upload";

      /* 날짜 폴더 경로 */
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

      
         Date date = new Date();
        
         String str = sdf.format(date);
       

      /* 폴더 생성 */
      File uploadPath = new File(uploadFolder, str);

      if (uploadPath.exists() == false) {
         uploadPath.mkdirs();
      }
      
         List<petVO> list = new ArrayList();

         MultipartFile multipartFile = uploadFile;
         
         petVO vo = new petVO();
         
         /* 파일 이름 */
         String uploadFileName = multipartFile.getOriginalFilename();
         vo.setANI_FILENAME(uploadFileName);
         vo.setANI_UPLOADPATH(str);
         
         /* uuid 적용 파일 이름 */
         String uuid = UUID.randomUUID().toString();
         vo.setANI_UUID(uuid);
         session.setAttribute("petPhoto", vo);
         uploadFileName = uuid + "_" + uploadFileName;

         /* 파일 위치, 파일 이름을 합친 File 객체 */
         File saveFile = new File(uploadPath, uploadFileName);

         /* 파일 저장 */
         try {
            multipartFile.transferTo(saveFile);
            
            /* 썸네일 생성 */
            File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
            
            BufferedImage bo_image = ImageIO.read(saveFile);
            
            /* 비율 */
            double ratio = 3;
            /*넓이 높이*/
            int width = (int) (bo_image.getWidth() / ratio);
            int height = (int) (bo_image.getHeight() / ratio);   
            
            BufferedImage bt_image = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
                        
            Graphics2D graphic = bt_image.createGraphics();
            
            graphic.drawImage(bo_image, 0, 0,width,height, null);
               
            ImageIO.write(bt_image, "jpg", thumbnailFile);
            
         } catch (Exception e) {
            e.printStackTrace();
         }
         
         list.add(vo);
         
         ResponseEntity<List<petVO>> result = new ResponseEntity<List<petVO>>(list, HttpStatus.OK);
         
         return result;
      }
   
   @RequestMapping(value="/display", method = RequestMethod.GET)
   public ResponseEntity<byte[]> getImage(String fileName) {
      
      File file = new File("c:\\upload\\" + fileName);
      
      logger.info(file);
      
      ResponseEntity<byte[]> result = null;
      
      try {         
         HttpHeaders header = new HttpHeaders();
         
         header.add("Content-type", Files.probeContentType(file.toPath()));
         
         result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
         
      }catch (IOException e) {
         e.printStackTrace();
      }
      
      return result;
      
   }
   
   @RequestMapping(value="/deleteFile", method = RequestMethod.POST)
   public ResponseEntity<String> deleteFile(String fileName){
      File file = null;
      
      try {
         /* 썸네일 파일 삭제 */
         file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
         
         file.delete();
         
         /* 원본 파일 삭제 */
         String originFileName = file.getAbsolutePath().replace("s_", "");
         
         logger.info("originFileName : " + originFileName);
         
         file = new File(originFileName);
         
         file.delete();
         
         
      } catch(Exception e) {
         
         e.printStackTrace();
         
         return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
         
      }
      
      return new ResponseEntity<String>("success", HttpStatus.OK);
   }
   
   
   @RequestMapping(value="/myPost")
   public String myPost(HttpSession session, Model model) throws Exception {
      AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
      String id = authInfo.getId();
      
      petVO petInfo = userService.myPet(id);
      model.addAttribute("petInfo", petInfo);
      
      List<UserVO> list = userService.myPost(id);
      model.addAttribute("userInfo", list);
      
      return "user/mypage/myPage";
   }
   
   
   
   

}