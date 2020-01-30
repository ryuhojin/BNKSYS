package com.bnksys.app;

import java.net.http.HttpResponse;
import java.util.ArrayList;
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

import com.bnksys.mybatis.ChargerDAOImpl;
import com.bnksys.mybatis.ChartModel;

@Controller
public class ChartController {
	
	@Autowired
	ChargerDAOImpl daoImpl;
	
	private static final Logger logger = LoggerFactory.getLogger(ChartController.class);
	//지역구별 충전소 현황
	@RequestMapping(value = "/chart", method = {RequestMethod.POST,RequestMethod.GET})
	public String chart1Fn(Locale locale, Model model) {
		ArrayList<ChartModel> result = daoImpl.ChargerNumStatic();
		model.addAttribute("result",result);
		return "chart/chart";
	}
	
	//지역구별 완충,급속 충전기 현황(막대)
	@RequestMapping(value = "/chart2", method = {RequestMethod.POST,RequestMethod.GET})
	public String chart2Fn(Locale locale, Model model) {
		System.out.println("Enter to selectAllCharger");
		ArrayList<ChartModel> result = daoImpl.FullFastNumStatic();
		System.out.println(result);
		model.addAttribute("result",result);
		return "chart/chart2";
	}
	
	//지역구별 완충,급속 충전기 현황(파이)
	@RequestMapping(value = "/chart3", method = {RequestMethod.POST,RequestMethod.GET})
	public String chart3Fn(HttpServletRequest req,Locale locale, Model model) {
		System.out.println("Enter to selectAllCharger");
		ArrayList<ChartModel> result = daoImpl.FullFastNumStatic();
		ChartModel total = daoImpl.TotalNumStatic();
		System.out.println(total.toString());
		req.setAttribute("tatalfull",total.getFullSum() );
		req.setAttribute("tatalfast",total.getFastSum());
		
		return "chart/chart3";
		}
}
