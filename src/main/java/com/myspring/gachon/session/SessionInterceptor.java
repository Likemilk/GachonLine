package com.myspring.gachon.session;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.myspring.gachon.content.ContentKey;

public class SessionInterceptor extends HandlerInterceptorAdapter{
	
	private static final Logger logger = LoggerFactory.getLogger(SessionInterceptor.class);


	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub
		
		
		logger.debug("SessionInterceptor-postHandler 이용");
		HttpSession session = request.getSession();
		if(session.getAttribute(ContentKey.LOGIN_MEMBER)==null){
			System.out.println("로그인이 되어있지 않습니다.");
			request.setAttribute("error", "nolog");
			request.getRequestDispatcher("/error").forward(request, response);
			return false;
		}
		
		
		return super.preHandle(request, response, handler);
	}
	

}
