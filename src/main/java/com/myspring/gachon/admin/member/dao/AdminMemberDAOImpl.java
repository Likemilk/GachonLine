package com.myspring.gachon.admin.member.dao;

import java.util.List; 

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.PlatformTransactionManager;

import com.myspring.gachon.admin.member.vo.AdminMemberVO;
import com.myspring.gachon.content.ContentKey;

@Repository
public class AdminMemberDAOImpl implements AdminMemberDAO{
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	PlatformTransactionManager transactionManager;
	// end must be point .
	private static final String NS = "mapper.com.myspring.gachon.admin.member.";
	
	/*
	@Test
	public void test() {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setName("SampleTestDAOImpl.test");
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = transactionManager.getTransaction(def);

		int result = 0;
		SampleTestVO vo = new SampleTestVO();
		vo.setCol1("A");
		vo.setCol2("B");
		vo.setCol3("C");
		vo.setCol6("E");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		vo.setCol4(format.format(new Date()));
		vo.setCol5(format.format(new Date()));
		result = sqlSession.insert(NS + "insertTestTable", vo);
		System.out.println(result);
		vo.setCol1("1002");
		result = sqlSession.insert(NS + "insertTestTable", vo);
		System.out.println(result);
		vo.setCol1("1001");
		result = sqlSession.insert(NS + "insertTestTable", vo);
		System.out.println(result);
		List<SampleTestVO> list = selectTestTable();
		System.out.println(list.toString());
		transactionManager.commit(status);
	}
*/

	@Override
	public List<AdminMemberVO> getMemberList(AdminMemberVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NS + "getMemberList", vo);
	}
	
	@Override
	public List<AdminMemberVO> getFriendInfo(AdminMemberVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NS + "getFriendInfo", vo);
	}

	@Override
	public JSONObject setMemberAdd(AdminMemberVO vo) {
		// TODO Auto-generated method stub
		int result = sqlSession.insert(NS + "setMemberAdd", vo);
		JSONObject jsonObject = new JSONObject();
		if (result > 0) {
			jsonObject.put(ContentKey.RESULT_MSG,ContentKey.RESULT_SUCCESS);
		} else {
			jsonObject.put(ContentKey.RESULT_MSG,ContentKey.RESULT_FAIL);
		}
		return jsonObject;
	}

	@Override
	public AdminMemberVO getMemberShow(AdminMemberVO vo) {
		// TODO Auto-generated method stub
		AdminMemberVO data =  sqlSession.selectOne(NS + "getMemberShow",vo);
		
		if(data.getMemberId().equals(vo.getMemberId())){
			data.setResult(ContentKey.RESULT_SUCCESS);
		}else{
			data.setResult(ContentKey.RESULT_FAIL);
		}
		
		return data;
	}

	@Override
	public JSONObject setMemberModify(AdminMemberVO vo) {
		// TODO Auto-generated method stub

		System.out.println("asdasd");
		System.out.println("asdasd");
		System.out.println("asdasd");
		System.out.println("asdasd");
		System.out.println("asdasd");
		System.out.println("asdasd");
		System.out.println("asdasd");
		System.out.println("asdasd");
		System.out.println("asdasd");
		System.out.println("asdasd");
		System.out.println("asdasd");
		System.out.println("asdasd");
		System.out.println("asdasd");
		System.out.println("asdasd");
		
		int result = sqlSession.update(NS + "setMemberModify", vo);
		System.out.println(result);
		System.out.println(result);
		System.out.println(result);
		System.out.println(result);
		System.out.println(result);
		System.out.println(result);
		System.out.println(result);
		System.out.println(result);
		System.out.println(result);
		System.out.println(result);
		System.out.println(result);
		System.out.println(result);
		System.out.println(result);
		
		JSONObject jsonObject = new JSONObject();
		if (result > 0) {
			jsonObject.put(ContentKey.RESULT_MSG,ContentKey.RESULT_SUCCESS);
		} else {
			jsonObject.put(ContentKey.RESULT_MSG,ContentKey.RESULT_FAIL);
		}
		return jsonObject;
	}


	@Override
	public JSONObject setMemberDelete(AdminMemberVO vo) {
		// TODO Auto-generated method stub
		int result = sqlSession.delete(NS + "setMemberDelete", vo);
		System.out.println(result);
		JSONObject jsonObject = new JSONObject();
		if (result > 0) {
			jsonObject.put(ContentKey.RESULT_MSG,ContentKey.RESULT_SUCCESS);
		} else {
			jsonObject.put(ContentKey.RESULT_MSG,ContentKey.RESULT_FAIL);
		}
		return jsonObject;
	}

}
