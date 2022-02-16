package com.kkanbu.waltz.common.resolver;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import com.kkanbu.waltz.common.CommandMap;

public class CustomMapArgumentResovler implements HandlerMethodArgumentResolver{

	

	 @Override
	    public Object resolveArgument(MethodParameter arg0, ModelAndViewContainer arg1, NativeWebRequest arg2,
	            WebDataBinderFactory arg3) throws Exception {
	        // TODO Auto-generated method stub
	        CommandMap commandMap = new CommandMap();
	        
	       HttpServletRequest request = (HttpServletRequest) arg2.getNativeRequest();
	       Enumeration<?> enumeration = request.getParameterNames();
	        
	       String key = null;
	       String[] values = null;
	       while(enumeration.hasMoreElements()){
	           key = (String) enumeration.nextElement();
	           values = request.getParameterValues(key);
	           if(values != null){
	               commandMap.put(key, (values.length > 1) ? values:values[0] );
	           }
	       }
	       return commandMap;
	    }
	 
	    @Override
	    public boolean supportsParameter(MethodParameter arg0) {
	        // TODO Auto-generated method stub
	        return CommandMap.class.isAssignableFrom(arg0.getParameterType());
	    }


}
