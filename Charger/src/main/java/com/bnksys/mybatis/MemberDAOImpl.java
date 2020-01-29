package com.bnksys.mybatis;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public int MemberLogin(MemberModel mem) {
		MemberDAO mapper = sqlSession.getMapper(MemberDAO.class);
		int result = mapper.MemberLogin(mem);
		return result;
	}



}
