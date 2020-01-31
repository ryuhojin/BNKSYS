package com.bnksys.app;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bnksys.mybatis.BoardDAOImpl;
import com.bnksys.mybatis.BoardModel;
import com.bnksys.mybatis.MemberDAOImpl;

@Controller
public class BoardController {
	
	@Autowired
	BoardDAOImpl daoImpl;
	@Autowired
	MemberDAOImpl daoImpl2;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping(value = "/boardinsert", method = RequestMethod.GET)
	public String formFn(Locale locale, Model model) {
		return "board/boardform";
	}
	
	@RequestMapping(value = "/board", method = {RequestMethod.POST,RequestMethod.GET})
	public String selectFn(Locale locale, Model model) {
		System.out.println("Enter to selectAllBoard");
		ArrayList<BoardModel> result = daoImpl.selectAllBoard();
		System.out.println(result.toString());
		model.addAttribute("result",result);
		return "board/board";
	}
	
	@RequestMapping(value = "/searchboard", method = {RequestMethod.POST,RequestMethod.GET})
	public String selectBFn(HttpServletRequest req,HttpSession session, Locale locale, Model model) {
		System.out.println("Enter to selectAllBoard");
		session.setAttribute("searchdata", req.getParameter("btitle"));
		System.out.println();
		ArrayList<BoardModel> result = daoImpl.findBoard(session.getAttribute("searchdata").toString());
		model.addAttribute("result",result);
		return "board/board";
	}
	
	@RequestMapping(value = "/boarddetail", method = RequestMethod.GET)
	public String selectoFn(HttpServletRequest req,HttpServletResponse res, Model model) {
		try {
			req.setCharacterEncoding("utf-8");
			res.setContentType("text/html;charset=UTF-8");
			int bno = Integer.parseInt(req.getParameter("bno"));
			BoardModel result = daoImpl.findOneBoard(bno);
			String mid = daoImpl2.findID(result.getMno());
			System.out.println(mid);
			System.out.println(result.toString());
			model.addAttribute("result",result);
			model.addAttribute("mid",mid);
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
		return "redirect:board";
	}
	//updateForm
		@RequestMapping(value = "/boardupdate", method = RequestMethod.GET)
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
			return "board/board";
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
		return "redirect:board";
	}
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String aaaFn(HttpServletRequest req,HttpServletResponse res, Model model) {
		System.out.println(req.getParameter("bno"));
		int bno = Integer.parseInt(req.getParameter("bno"));		//hide속성
		daoImpl.deleteBoard(bno);
		return "redirect:board";
	}
	
}
