package com.bnksys.app;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.bnksys.mybatis.ChargerDAOImpl;
import com.bnksys.mybatis.ChargerModel;
import com.google.gson.Gson;

@Controller
public class ChargerController {
	
	@Autowired
	ChargerDAOImpl daoImpl;
	
	private static final Logger logger = LoggerFactory.getLogger(ChargerController.class);
	
	
	@RequestMapping(value = "/stationlist", method = {RequestMethod.POST,RequestMethod.GET})
	public String selectFn(Locale locale, Model model) {
		System.out.println("Enter to selectAllCharger");
		ArrayList<ChargerModel> result = daoImpl.selectAllCharger();
		model.addAttribute("result",result);
		return "station/stationlist";
	}
	
	@RequestMapping(value = "/station", method = {RequestMethod.POST,RequestMethod.GET})
	public String showmapFn(Locale locale, Model model) {
		System.out.println("들어왔다구");
		System.out.println("Enter to showmap");
		ArrayList<ChargerModel> result = daoImpl.selectAllCharger();
		model.addAttribute("result",result);
		return "station/station";
	}
	
	@RequestMapping(value = "/stationdetail", method = RequestMethod.GET)
	public String selectoFn(HttpServletRequest req,HttpServletResponse res, Model model) {
		try {
			req.setCharacterEncoding("utf-8");
			res.setContentType("text/html;charset=UTF-8");
			int cno = Integer.parseInt(req.getParameter("cno"));
			ChargerModel result = daoImpl.findOneCharger(cno);
			System.out.println(result.toString());
			model.addAttribute("result",result);
		} catch (UnsupportedEncodingException e) {
			System.out.println(e.getMessage());
		}
		return "station/stationdetail";
	}
	
	//검색결과 json 형태로 보내기
	@RequestMapping(value = "/search", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public void search(String s_category,String s_keyword ,HttpServletResponse response,HttpServletRequest request, Model model) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/json; charset=utf-8");
		/* System.out.println(s_category+"/"+s_keyword); */
		List<ChargerModel> chargers =null;
		if(s_category.equals("cname")) {
			chargers = daoImpl.searchByCname(s_keyword);
		}else {
			chargers = daoImpl.searchByDist(s_keyword);
		}
		System.out.println("확인 " + chargers);
		Gson gson = new Gson();

		response.getWriter().write(gson.toJson(chargers));
	}
}
