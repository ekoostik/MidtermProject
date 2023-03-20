package com.skilldistillery.vigilance.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.vigilance.data.ReportDAO;
import com.skilldistillery.vigilance.entities.Report;

@Controller
public class ReportController {


	@Autowired
private ReportDAO reportDao;
	
	
	@RequestMapping(path="viewAllreports.do", method =RequestMethod.GET)
	public String viewAll(Model model) {
		model.addAttribute("report", reportDao.reports());
		
		return "/webpages/forms/reportForm";
	}
	@RequestMapping(path = "ReportAdded.do", method = RequestMethod.GET)
	public ModelAndView ReportAdded() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("report");
		return mv;
	}

	@RequestMapping(path = "getReportById.do", method = RequestMethod.GET)
	public String getReportById(int id, Model model) {
		Report report = reportDao.findReportById(id);
		model.addAttribute("report", report);

		return "/webpages/forms/reportForm";
	}

	@RequestMapping(path = "updatereport.do", method = RequestMethod.GET)
	public String updateEvent(int id, Model model) {
		model.addAttribute("report", reportDao.findReportById(id));

		return "updatereport";
	}
}
