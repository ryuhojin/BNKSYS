package com.bnksys.mybatis;

import java.util.ArrayList;

public interface ChargerDAO {
	public ArrayList<ChargerModel> selectAllCharger();	//전체 리스트검색
	public ChargerModel findOneCharger(int cno);	//한개만 검색
	
}
