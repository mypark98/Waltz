package com.kkanbu.waltz.controller;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kkanbu.waltz.exception.IdPasswordNotMatchingException;
import com.kkanbu.waltz.service.UserService;
import com.kkanbu.waltz.util.AuthInfo;
import com.kkanbu.waltz.util.LoginCommand;
import com.kkanbu.waltz.vo.UserVO;

@Controller
public class LoginController {
     
   BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
      
    @Resource(name="userService")
    private UserService userService;
    
    @RequestMapping(value="/login", method=RequestMethod.GET)
    public ModelAndView loginForm(LoginCommand loginCommand,
                    @CookieValue(value="REMEMBER", required=false) Cookie rememberCookie) throws Exception {
        
        if(rememberCookie!=null) {
            loginCommand.setId(rememberCookie.getValue());
            loginCommand.setRememberId(true);
        }
        
        ModelAndView mv = new ModelAndView("user/login/loginForm");
        return mv;
    }
 
    @RequestMapping(value="/login", method=RequestMethod.POST)
    public ModelAndView loginSuccess(@Valid LoginCommand loginCommand, HttpServletRequest req, RedirectAttributes rttr, BindingResult bindingResult, HttpServletResponse response) throws Exception {

       
        if(bindingResult.hasErrors()) {
            ModelAndView mv = new ModelAndView("user/login/loginForm");
            return mv;
        }
        try {

           HttpSession session = req.getSession();
            AuthInfo authInfo = userService.loginAuth(loginCommand);
            
            // 비밀번호 복호화 (실제 비밀번호와 암호화된 비밀번호를 비교하여 맞으면 true 반환)
            boolean pwdMatch = pwdEncoder.matches(loginCommand.getPassword(), authInfo.getPassword());
            
            if(authInfo != null && pwdMatch == true) {
               session.setAttribute("authInfo", authInfo);
               
                Cookie rememberCookie = new Cookie("REMEMBER", loginCommand.getId());
                rememberCookie.setPath("/");
                if(loginCommand.isRememberId()) {
                    rememberCookie.setMaxAge(60*60*24*7);
                } else {
                    rememberCookie.setMaxAge(0);
                }
                response.addCookie(rememberCookie);
            }
            else {
               session.setAttribute("authInfo", null);
               req.setAttribute("msg", false);
                ModelAndView mv = new ModelAndView("user/login/loginForm");
                return mv;
            }
        }
        catch(IdPasswordNotMatchingException e) {
           req.setAttribute("msg", false);
            ModelAndView mv = new ModelAndView("user/login/loginForm");
            return mv;
        }
       
        ModelAndView mv = new ModelAndView("user/login/loginSuccess");
        return mv;
    }
    
       @RequestMapping("/logout")
       public ModelAndView logout(HttpSession session) {
          session.invalidate();
          ModelAndView mv = new ModelAndView("redirect:/");
          return mv;
       }  
   
       @RequestMapping(value="/modifyChk", method = RequestMethod.POST)
       public String modifyChk() throws Exception{
          return "user/modify/modifyForm";
       }
       
       @RequestMapping(value="/modifyPwdChk", method = RequestMethod.GET)
       public String registerUpdateView() throws Exception{   
          return "user/modify/modifyPassChk";
       }

       @RequestMapping(value="/modify", method = RequestMethod.POST)
       public String registerUpdate(UserVO vo, HttpSession session) throws Exception{
          
         String inputPass = vo.getMEM_PW();
         
         // 변경된 암호를 받아 암호화
         String pwd = pwdEncoder.encode(inputPass);
         vo.setMEM_PW(pwd);
          
          userService.memberUpdate(vo);
          session.invalidate();
          return "redirect:/";
       }
   
      // 회원 탈퇴 get
      @RequestMapping(value="/delete", method = RequestMethod.GET)
      public String memberDeleteView() throws Exception{
         return "user/delete/deleteForm";
      }
      
      // 회원 탈퇴 post
      @RequestMapping(value="/delete", method = RequestMethod.POST)
      public String memberDelete(UserVO vo, HttpSession session, RedirectAttributes rttr, HttpServletRequest req) throws Exception{
         

         UserVO login = userService.login(vo);

         boolean pwdChk = pwdEncoder.matches(vo.getMEM_PW(), login.getMEM_PW());

         
         if(!pwdChk) {
            return "user/delete/deleteForm";
         }
         else {
            userService.memberDelete(vo);
            session.invalidate();
            return "redirect:/";
         }
      }

      @ResponseBody
      @RequestMapping(value="/passChk", method = RequestMethod.POST)
      public boolean passChk(UserVO vo) throws Exception {
         
          UserVO login = userService.login(vo);
          boolean pwdChk = pwdEncoder.matches(vo.getMEM_PW(), login.getMEM_PW());
          return pwdChk;
         
         
//         int result = userService.passChk(vo);
//         return result;
      }

      @ResponseBody
      @RequestMapping(value="/idChk", method = RequestMethod.POST)
      public int idChk(UserVO vo) throws Exception {
         int result = userService.idChk(vo);
         return result;
      }
      
//      // 카카오 로그인창 호출
//      @RequestMapping(value = "/login/getKakaoAuthUrl")
//      public @ResponseBody String getKakaoAuthUrl(HttpServletRequest request) throws Exception {
//         String reqUrl = "https://kauth.kakao.com" + "/oauth/authorize?client_id=" + "73283003dcf8cbed58b59044b4787cfd" + "&redirect_uri="+ "http://localhost:8090/login/oauth_kakao" + "&response_type=code";
//         return reqUrl;
//      }
      
}