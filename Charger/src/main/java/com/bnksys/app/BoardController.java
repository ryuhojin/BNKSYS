package com.bnksys.app;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bnksys.mybatis.BoardDAOImpl;
import com.bnksys.mybatis.BoardModel;

@Controller
public class BoardController {
	
	@Autowired
	BoardDAOImpl daoImpl;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String formFn(Locale locale, Model model) {
		return "board/boardform";
	}
	
	@RequestMapping(value = "/selectAllBoard", method = {RequestMethod.POST,RequestMethod.GET})
	public String selectFn(Locale locale, Model model) {
		System.out.println("Enter to selectAllBoard");
		ArrayList<BoardModel> result = daoImpl.selectAllBoard();
		model.addAttribute("result",result);
		return "board/boardlist";
	}
	
	@RequestMapping(value = "/findOneBoard", method = RequestMethod.GET)
	public String selectoFn(HttpServletRequest req,HttpServletResponse res, Model model) {
		try {
			req.setCharacterEncoding("utf-8");
			res.setContentType("text/html;charset=UTF-8");
			int bno = Integer.parseInt(req.getParameter("bno"));
			BoardModel result = daoImpl.findOneBoard(bno);
			System.out.println(result.toString());
			model.addAttribute("result",result);
		} catch (UnsupportedEncodingException e) {
			System.out.println(e.getMessage());
		}
		return "board/boarddetail";
	}
	
	@RequestMapping(value = "/insertBoard", method = {RequestMethod.POST,RequestMethod.GET})
	public String insertFn(HttpServletRequest req,HttpServletResponse res, Model model) throws Exception {
		System.out.println("Enter to insertBoard");
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=UTF-8");
		String btitle = req.getParameter("btitle");
		String bcontent = req.getParameter("bcontent");
		
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		Date time = new Date();
		String bdate = format1.format(time);
		
		int mno = Integer.parseInt(req.getParameter("mno"));		//이부분은 form에서 hide속성으로 가져오기
		
		BoardModel board = new BoardModel(btitle,bcontent,bdate,mno);
		System.out.println(board.toString());
		daoImpl.insertBoard(board);
		return "redirect:selectAllBoard";
	}
	//updateForm
		@RequestMapping(value = "/updateForm", method = RequestMethod.GET)
		public String updateformFn(HttpServletRequest req,HttpServletResponse res, Model model) {
			try {
				req.setCharacterEncoding("utf-8");
				res.setContentType("text/html;charset=UTF-8");
				int bno = Integer.parseInt(req.getParameter("bno"));
				BoardModel result = daoImpl.findOneBoard(bno);
				System.out.println(result.toString());
				model.addAttribute("result",result);
			} catch (UnsupportedEncodingException e) {
				System.out.println(e.getMessage());
			}
			return "board/updateform";
		}
	
	@RequestMapping(value = "/updateBoard", method = {RequestMethod.GET,RequestMethod.POST})
	public String updateFn(HttpServletRequest req,HttpServletResponse res, Model model) throws Exception {
		System.out.println("Enter to insertBoard");
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=UTF-8");
		int bno = Integer.parseInt(req.getParameter("bno"));		//hide속성
		String btitle = req.getParameter("btitle");
		String bcontent = req.getParameter("bcontent");
		String bdate = req.getParameter("bdate");
		int mno = Integer.parseInt(req.getParameter("mno"));		//이부분은 form에서 hide속성으로 가져오기
		BoardModel board = new BoardModel(bno,btitle,bcontent,bdate,mno);
		System.out.println(board.toString());
		daoImpl.updateBoard(board);
		return "redirect:selectAllBoard";
	}
	
	@RequestMapping(value = "/deleteBoard", method = RequestMethod.GET)
	public String deleteFn(HttpServletRequest req, Model model) {
		int bno = Integer.parseInt(req.getParameter("bno"));		//hide속성
		daoImpl.deleteBoard(bno);
		return "redirect:selectAllBoard";
	}
	
}