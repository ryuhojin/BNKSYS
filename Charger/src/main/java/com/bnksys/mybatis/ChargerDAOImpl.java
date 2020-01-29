package com.bnksys.mybatis;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChargerDAOImpl implements ChargerDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public ArrayList<ChargerModel> selectAllCharger() {
		ChargerDAO mapper = sqlSession.getMapper(ChargerDAO.class);
		ArrayList<ChargerModel> arr = new ArrayList<ChargerModel>();
		arr = mapper.selectAllCharger();
		return arr;
	}

	@Override
	public ChargerModel findOneCharger(int cno) {
		ChargerDAO mapper = sqlSession.getMapper(ChargerDAO.class);
		ChargerModel charger = mapper.findOneCharger(cno);
		return charger;
	}


}
