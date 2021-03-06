package com.myspring.gachon.common.code;

import java.util.List;
import java.util.Map;

import com.myspring.gachon.admin.course.vo.AdminCourseApplicantVO;

import net.sf.json.JSONObject;

public interface CodeService {
	List<CodeVO> selectCodeDet(String grcode);
	
	List<CodeVO> selectCodeDetWithCodeLike(JSONObject param);

	List<CodeVO> selectCodeDetWithCodeLike2(Map<String, Object> param);
}
