package com.bnksys.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public MemberModel MemberLogin(MemberModel mem) {
		MemberDAO mapper = sqlSession.getMapper(MemberDAO.class);
		MemberModel result = mapper.MemberLogin(mem);
		return result;
	}

	@Override
	public void MemberAccount(MemberModel mem) {
		MemberDAO mapper = sqlSession.getMapper(MemberDAO.class);
		mapper.MemberAccount(mem);
	}
	
	@Override
	public String findID(int mno) {
		MemberDAO mapper = sqlSession.getMapper(MemberDAO.class);
		String mid = mapper.findID(mno);
		return mid;
	}

	@Override
	public int idcheck(String id) {
		MemberDAO mapper = sqlSession.getMapper(MemberDAO.class);
		int check = mapper.idcheck(id);
		return check;
	}
	


}
