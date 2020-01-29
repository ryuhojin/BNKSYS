package com.bnksys.mybatis;

import java.util.ArrayList;

public interface BoardDAO {
	public ArrayList<BoardModel> selectAllBoard();	//전체 리스트검색
	public BoardModel findOneBoard(int bno);	//한개만 검색
	public void insertBoard(BoardModel board);	//추가
	public void deleteBoard(int bno);	//삭제
	public void updateBoard(BoardModel board);	//업데이트
	
}
