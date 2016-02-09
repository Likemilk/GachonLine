package com.myspring.common.exception;

import javax.servlet.jsp.JspException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

@ControllerAdvice
public class CommonExceptionHandler {

	@ExceptionHandler({ Exception.class, RuntimeException.class, IllegalArgumentException.class })
	public String handlerServerSideException(Exception e) {
		e.printStackTrace();
		return "/common/exception/error";
	}

	@ExceptionHandler({ JspException.class })
	public String handlerClientSideException(Exception e) {
		e.printStackTrace();
		return "/common/exception/error";
	}
}

@Controller
class ExceptionController {

	@RequestMapping("/goServerSideException.test")
	public void goServerSideException() {
		throw new RuntimeException("Unexpected Exception");
	}

	@RequestMapping("/goClientSideException.test")
	public void goClientSideException() throws JspException {
		throw new JspException();
	}
}