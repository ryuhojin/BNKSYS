package com.bnksys.mybatis;

import java.util.ArrayList;
import java.util.List;

public interface ChargerDAO {
	public ArrayList<ChargerModel> selectAllCharger();	//전체 리스트검색
	public ChargerModel findOneCharger(int cno);	//한개만 검색
	//지역구별 충전소 갯수 차트 (리턴 모델에는 district,dispernum)
	public ArrayList<ChartModel> ChargerNumStatic();
	//지역구별 완충,급속 비율 차트(district,fullsum,fastsum)s
	public ArrayList<ChartModel> FullFastNumStatic();
	//전체 완충,급속 갯수 차트
	public ChartModel TotalNumStatic();
	//검색어로 찾기
	public List<ChargerModel> searchByCname(String s_keyword);
	public List<ChargerModel> searchByDist(String s_keyword);
}
