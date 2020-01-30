package com.bnksys.app;

import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
import com.bnksys.mybatis.MemberModel;

import jdk.internal.org.jline.utils.Log;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	MemberDAOImpl daoImpl;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "main";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpSession httpSession,Model model) {
		
		return "login/loginform";
	}
	

	
	@RequestMapping(value = "/loginAf", method = { RequestMethod.GET,RequestMethod.POST })
	public String loginAf(HttpSession httpSession,HttpServletRequest req,HttpServletResponse res, Model model) {
		try {
			req.setCharacterEncoding("utf-8");
			res.setContentType("text/html;charset=UTF-8");
			String id = req.getParameter("id");
			String pass = req.getParameter("pass");
			MemberModel user = new MemberModel(id,pass);
			System.out.println(user.toString());
			int result = daoImpl.MemberLogin(user);
			if(result>0) {
				httpSession.setAttribute("user",user );
			}else {
				return "redirect:/";
			}
		} catch (UnsupportedEncodingException e) {
			System.out.println(e.getMessage());
		}
		return "redirect:/";
	}
	@RequestMapping(value = "/signup", method = {RequestMethod.POST,RequestMethod.GET})
	public String insertFn(HttpServletRequest req,HttpServletResponse res, Model model) throws Exception {
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=UTF-8");
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		
		MemberModel member = new MemberModel(id, pass);
		daoImpl.MemberAccount(member);
		return "redirect:/";
	}
	
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession httpSession,Model model) {
		System.out.println("logout�뱾�뼱�샂");
		httpSession.invalidate();
		return "main";
	}
}
