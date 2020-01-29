package com.bnksys.mybatis;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChargeDAOImpl implements ChargeDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public ArrayList<ChargerModel> selectAllCharge() {
		ChargeDAO mapper = sqlSession.getMapper(ChargeDAO.class);
		ArrayList<ChargerModel> arr = new ArrayList<ChargerModel>();
		arr = mapper.selectAllCharge();
		return arr;
	}


}
