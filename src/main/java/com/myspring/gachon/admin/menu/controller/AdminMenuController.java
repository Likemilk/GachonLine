package com.myspring.gachon.admin.menu.controller;

import java.util.Locale; 

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myspring.gachon.admin.menu.service.AdminMenuService;
import com.myspring.gachon.admin.menu.vo.AdminMenuVO;
import com.myspring.gachon.common.code.CodeService;
import com.myspring.gachon.tags.select.service.TagsSelectService;


	
@Controller
public class AdminMenuController {
	@Autowired
	private AdminMenuService adminMenuService;
	@Autowired
	private TagsSelectService tagsSelectService;
	@Autowired
	private CodeService CodeServiceimpl;
	@Autowired
	HttpServletRequest request;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminMenuController.class);
	
	//처음 페이지 보여주기
	@RequestMapping(value = "/admin/manage_menu", method = RequestMethod.GET)
	public String manageMenu(Locale locale, Model model) {
		model.addAttribute("POWER",JSONArray.fromObject(CodeServiceimpl.selectCodeDet("POWER")));
		model.addAttribute("USE_YN",JSONArray.fromObject(CodeServiceimpl.selectCodeDet("USE_YN")));
		model.addAttribute("MENU_TYPE",JSONArray.fromObject(CodeServiceimpl.selectCodeDet("MENU_TYPE")));

		
		logger.info("AdminController -> manageMenu", locale);
		
		return "/admin/manage_menu/ManagementMenu";
	}
	
	@RequestMapping(value = "/admin/manage_menu/list.json", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject listMenu(AdminMenuVO vo, Model model) {
		JSONObject data = new JSONObject();
		data.put("table", JSONArray.fromObject(adminMenuService.getMenuList()));
		data.put("parents",adminMenuService.getParentMenuId());
		
		model.addAttribute("POWER",JSONArray.fromObject(CodeServiceimpl.selectCodeDet("POWER")));
		model.addAttribute("USE_YN",JSONArray.fromObject(CodeServiceimpl.selectCodeDet("USE_YN")));
		model.addAttribute("MENU_TYPE",JSONArray.fromObject(CodeServiceimpl.selectCodeDet("MENU_TYPE")));

		
		return data;
	}
	@RequestMapping(value = "/admin/manage_menu/submit.json", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject setMenuSubmit(AdminMenuVO vo) {
		return adminMenuService.setMenuSubmit(vo);
	}
	
	@RequestMapping(value = "/admin/manage_menu/show.json", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getMenuShow(AdminMenuVO vo) {
		return adminMenuService.getMenuShow(vo);
	}
	
	@RequestMapping(value = "/admin/manage_menu/modify.json", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject setMenuModify(AdminMenuVO vo) {
		System.out.println("=========================================");
		System.out.println(vo.getMenuType());
		System.out.println(vo.getMenuId());
		System.out.println(vo.getMenuName());
		System.out.println(vo.getMenuType());
		System.out.println(vo.getMenuType());
		System.out.println(vo.getMenuType());
		
		System.out.println("=========================================");
		
		return adminMenuService.setMenuModify(vo);
	}
	
	@RequestMapping(value = "/admin/manage_menu/delete.json", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject setMenuDelete(AdminMenuVO vo) {
		System.out.println("=========================================");
		System.out.println(vo.getMenuId());
		System.out.println("=========================================");
		
		return adminMenuService.setMenuDelete(vo);
	}

	
}
