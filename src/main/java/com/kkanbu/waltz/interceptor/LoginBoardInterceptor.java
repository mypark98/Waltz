package com.kkanbu.waltz.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kkanbu.waltz.util.AuthInfo;

public class LoginBoardInterceptor extends HandlerInterceptorAdapter {
   
   @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("authInfo");
        
        if ( obj ==null ){
            response.sendRedirect("/login");
            return false; 
        }
        
        

        return true;
    }
   
   
   // 컨트롤러가 수행되고 화면이 보여지기 직전에 수행되는 메서드
   @Override
   public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
         ModelAndView modelAndView) throws Exception {
      HttpSession session = request.getSession();
      AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");

      Map<String, Object> mav = (Map<String, Object>) modelAndView.getModel().get("detail");
      mav.get("MEM_ID").toString();
      
      
      if (authInfo != null) {
//         System.out.println("1." + authInfo.getId());
//         System.out.println("2." + mav.get("MEM_ID").toString());
//         System.out.println("3." + authInfo.getManager());
//         System.out.println("4." + !(authInfo.getId().equals(mav.get("MEM_ID").toString())));
//         System.out.println("5." + authInfo.getId().equals(mav.get("MEM_ID").toString()));
         System.out.println("6." + modelAndView.getModel().get("detail").toString());

         
         if (!(authInfo.getId().equals(mav.get("MEM_ID").toString())) && authInfo.getManager().equals("0")) {
            response.sendRedirect("/board/questionBoardList");
         }
      }
      // super.postHandle(request, response, handler, modelAndView);
   }

}