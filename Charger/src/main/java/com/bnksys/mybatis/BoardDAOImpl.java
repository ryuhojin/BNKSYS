package com.bnksys.mybatis;

import java.util.ArrayList;
import java.util.HashSet;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public ArrayList<BoardModel> selectAllBoard() {
		BoardDAO mapper = sqlSession.getMapper(BoardDAO.class);
		ArrayList<BoardModel> arr = new ArrayList<BoardModel>();
		MemberDAO mapper2 = sqlSession.getMapper(MemberDAO.class);
		for(BoardModel model : mapper.selectAllBoard())
		{
			String mid = mapper2.findID(model.mno);		//mno로 아이디 찾기
			arr.add(new BoardModel(model.bno,model.btitle, model.bcontent, model.bdate.substring(5,11), model.mno,mid));
			System.out.println(arr.toString());
		}
		return arr;
	}

	@Override
	public ArrayList<BoardModel> findBoard(String btitle) {
		BoardDAO mapper = sqlSession.getMapper(BoardDAO.class);
		MemberDAO mapper2 = sqlSession.getMapper(MemberDAO.class);
		ArrayList<BoardModel> arr3 = new ArrayList<BoardModel>();
		System.out.println(btitle);
		for(BoardModel model : mapper.findBoard(btitle))
		{
			arr3.add(new BoardModel(model.bno, model.btitle, model.bcontent, model.bdate.substring(5,11), model.mno));
		} 
		return arr3;
	}
	
	@Override
	public BoardModel findOneBoard(int bno) {
		BoardDAO mapper = sqlSession.getMapper(BoardDAO.class);
		BoardModel board = mapper.findOneBoard(bno);
		return board;
	}

	@Override
	public void insertBoard(BoardModel board) {
		BoardDAO mapper = sqlSession.getMapper(BoardDAO.class);
		mapper.insertBoard(board);
	}

	@Override
	public void deleteBoard(int bno) {
		BoardDAO mapper = sqlSession.getMapper(BoardDAO.class);
		mapper.deleteBoard(bno);
	}

	@Override
	public void updateBoard(BoardModel board) {
		BoardDAO mapper = sqlSession.getMapper(BoardDAO.class);
		mapper.updateBoard(board);
	}

	

}
