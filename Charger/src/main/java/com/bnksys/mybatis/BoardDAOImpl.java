package com.bnksys.mybatis;

import java.util.ArrayList;

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
		for(BoardModel model : mapper.selectAllBoard())
		{
			arr.add(new BoardModel(model.bno,model.btitle, model.bcontent, model.bdate.substring(5,11), model.mno));
		}
		return arr;
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
