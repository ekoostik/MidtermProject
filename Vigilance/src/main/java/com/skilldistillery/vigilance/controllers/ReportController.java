package com.skilldistillery.vigilance.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.vigilance.data.ReportDAO;
import com.skilldistillery.vigilance.entities.Animal;
import com.skilldistillery.vigilance.entities.Report;
import com.skilldistillery.vigilance.entities.User;

@Controller
public class ReportController {


	@Autowired
private ReportDAO reportDao;
	
	
	@RequestMapping(path="viewAllreports.do", method =RequestMethod.GET)
	public String viewAll(Model model, HttpSession session) {
		User loggedInUser = (User)session.getAttribute("loggedinuser");
		int nId = loggedInUser.getHousehold().getAddress().getNeighborhood().getId();
		List<Report> reports = reportDao.reportsByNeighborhood(nId);
		model.addAttribute("report", reports);
		return "/webpages/forms/reportForm";
	}
	
	@RequestMapping(path = "addReport.do")
	public String addReport() {
		return "/webpages/forms/addReport";
	}
//	TODO- logic to grab the report filled out by user to add to the database
	@RequestMapping(path = "reportAdded.do", method = RequestMethod.POST)
	public ModelAndView ReportAdded() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("report");
		return mv;
	}
	
	

	@RequestMapping(path = "getReportById.do", method = RequestMethod.GET)
	public String getReportById(int id, Model model) {
		Report report = reportDao.findReportById(id);
//		Animal animal = reportDao
		List<Animal> animals = reportDao.viewAnimalReports(id);
		model.addAttribute("report", report);
		model.addAttribute("animals", animals);
		
		return "/webpages/forms/viewSingleReport";
	}

	@RequestMapping(path = "updatereport.do", method = RequestMethod.GET)
	public String updateEvent(int id, Model model) {
		model.addAttribute("report", reportDao.findReportById(id));

		return "updateReport";
	}
}
