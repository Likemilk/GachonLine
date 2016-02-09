package com.myspring.gachon.tags;

import java.io.FileInputStream; 
import java.io.IOException;
import java.net.URLDecoder;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.TagSupport;

import net.sf.json.JSONObject;

import com.myspring.gachon.content.ContentKey;
import com.myspring.gachon.login.vo.LoginVO;



public class NavBarTag extends TagSupport{

	private static final long serialVersionUID = -5805496915062216477L;
	
	private static StringBuffer sb = null;

	static Properties properties = new Properties();
	private static String AJAX_CONNECTION_ERROR=null;
	private static String CONTEXT_PATH =null;
	private static String PATH_RESOURCES = null;
	private static String PATH_PLUGIN = null;
	private static String PATH_JQUERY = null;
	private static String PATH_BOOTSTRAP = null;
	private static String PATH_IMAGES = null;
	private static String PATH_CSS = null;
	private static String PATH_JS = null;
	private static String TITLE = null;
	
	
	@Override
	public int doStartTag() throws JspException {
		setContext(pageContext);
		HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
		HttpSession session = request.getSession();
		
		try {
			String path = HtmlTag.class.getClassLoader().getResource("").getPath();
			String fullPath = URLDecoder.decode(path, "UTF-8");
			String pathArr[] = fullPath.split("/WEB-INF/classes/");
			fullPath = pathArr[0];
			fullPath = fullPath + "/WEB-INF/properties/enviroment_ko_KR.properties";
			properties.load(new FileInputStream(fullPath));

			CONTEXT_PATH = properties.getProperty("CONTEXT_PATH").replace("{0}",request.getContextPath());
			PATH_RESOURCES = properties.getProperty("PATH_RESOURCES").replace("{0}",CONTEXT_PATH);
			PATH_PLUGIN = properties.getProperty("PATH_PLUGIN").replace("{0}",PATH_RESOURCES);
			PATH_JQUERY = properties.getProperty("PATH_JQUERY").replace("{0}",PATH_PLUGIN);
			PATH_BOOTSTRAP = properties.getProperty("PATH_BOOTSTRAP").replace("{0}",PATH_PLUGIN);
			PATH_IMAGES = properties.getProperty("PATH_IMAGES").replace("{0}",PATH_RESOURCES);
			PATH_CSS = properties.getProperty("PATH_CSS").replace("{0}",PATH_RESOURCES);
			PATH_JS = properties.getProperty("PATH_JS").replace("{0}",PATH_RESOURCES);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JspWriter out = pageContext.getOut();
		sb = new StringBuffer();
//		appendln("<script src='"+PATH_JS+ "/navBarTag.js'></script>");
//		appendln("<script>");
//		appendln("	navBarTag();");
//		appendln("</script>");
//		appendln("");
//		appendln("");
//		appendln("");
//		
//		appendln("<nav class='navbar navbar-inverse'>");
//		appendln("	<div class='container-fluid'  style='background-color:#212121'>");
//		appendln("		<div class='navbar-header' style='padding-top:0.5em'>");
//		appendln("		<a href='/'><img src='"+PATH_IMAGES+"/menu_logo.png'/></a>	");
//		appendln("		</div>");
//		appendln("		<div class='collapse navbar-collapse' id='bs-example-navbar-collapse-1'>");
//		appendln("			<ul id='navBarTag' class='nav navbar-nav'>");
//		//여기에다가 스크립트를 기술 id 값은 navBarTag
//		appendln("			</ul>");
//		appendln("			<ul class='nav navbar-nav navbar-right'>");
//		if(session.getAttribute(ContentKey.LOGIN_MEMBER)!=null){
//			appendln("				<li>");
//			appendln("					<a href='/member/my_info'><span class='glyphicon glyphicon-user' aria-hidden='true'></span>");
//			appendln("					"+((JSONObject)(session.getAttribute(ContentKey.LOGIN_MEMBER))).getString("memberName")+"님");
//			appendln("				</a></li>");		
//			
//			appendln("				<li>");
//			appendln("					<a href='/logout'><span class='glyphicon glyphicon-remove' aria-hidden='true'></span>");
//			appendln("					로그아웃</a>");
//			appendln("				</li>");		
//		}else{
//			
//		}
//		appendln("			</ul>");
//		appendln("		</div>");
//		appendln("	</div>");
//		appendln("</nav>");
//		appendln("");
		
		if (pageContext.getSession().getAttribute(ContentKey.LOGIN_MEMBER) == null) {
			
		}else{
			
		}

		
		try {
			out.println(sb.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return SKIP_PAGE;
	}
	
	public void setContext(PageContext app){
		app.setAttribute("CONTEXT_PATH", CONTEXT_PATH);
		app.setAttribute("PATH_RESOURCES", PATH_RESOURCES);
		app.setAttribute("PATH_PLUGIN", PATH_PLUGIN);
		app.setAttribute("PATH_JQUERY", PATH_JQUERY);
		app.setAttribute("PATH_BOOTSTRAP", PATH_BOOTSTRAP);
		app.setAttribute("PATH_IMAGES", PATH_IMAGES);
		app.setAttribute("PATH_CSS", PATH_CSS);
		app.setAttribute("PATH_JS", PATH_JS);
		app.setAttribute("CONTEXT_PATH", CONTEXT_PATH);
		app.setAttribute("TITLE", TITLE);
		app.setAttribute("AJAX_CONNECTION_ERROR", AJAX_CONNECTION_ERROR);
				
		
	}
	public void appendln(String msg){
		sb.append(msg+"\n");	
	}

}



