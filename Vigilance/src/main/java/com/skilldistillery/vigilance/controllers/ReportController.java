package com.skilldistillery.vigilance.controllers;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.vigilance.data.ReportDAO;
import com.skilldistillery.vigilance.data.UserDAO;
import com.skilldistillery.vigilance.entities.Animal;
import com.skilldistillery.vigilance.entities.Report;
import com.skilldistillery.vigilance.entities.User;

@Controller
public class ReportController {


	@Autowired
private ReportDAO reportDao;
	@Autowired
private UserDAO userDao;
	
	@RequestMapping(path="viewAllreports.do", method =RequestMethod.GET)
	public String viewAll(Model model, HttpSession session) {
		User loggedInUser = (User)session.getAttribute("loggedinuser");
		int nId = loggedInUser.getHousehold().getAddress().getNeighborhood().getId();
		List<Report> reports = reportDao.reportsByNeighborhood(nId);
		model.addAttribute("report", reports);
		return "/webpages/forms/reportform";
	}
	
	@RequestMapping(path = "addReport.do")
	public String addReport() {
		return "/webpages/forms/addReport";
	}
//	TODO- logic to grab the report filled out by user to add to the database
	@RequestMapping(path = "reportAdded.do", params = "reportDateAlt", method = RequestMethod.POST)
	public String ReportAdded(Report report, Model model, HttpSession session, @RequestParam("reportDateAlt") String reportDateAlt) {
		LocalDate reportDate = LocalDate.parse(reportDateAlt);
		User loggedInUser = (User)session.getAttribute("loggedinuser");
		if (loggedInUser != null) {
			loggedInUser = userDao.findUserById(loggedInUser.getId());
			session.setAttribute("loggedinuser", loggedInUser);
		}
		report.setUser(loggedInUser);
		report.setReportDate(reportDate);
		report = reportDao.createReport(report, loggedInUser);
		int Nid = loggedInUser.getHousehold().getAddress().getNeighborhood().getId();
		List<Report>reports = reportDao.reportsByNeighborhood(Nid);
		
		model.addAttribute("report",reports);
		model.addAttribute("loggedinuser",loggedInUser);
		
		
		return "/webpages/forms/reportform";
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
	
	@RequestMapping(path = "delete.do", method = RequestMethod.POST)
	public ModelAndView deleteEvent(int id, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();
		boolean deleted = reportDao.deleteReport(id);
		if (deleted) {
			redir.addFlashAttribute("report", id);
			mv.setViewName("redirect:reportDeleted.do");
			return mv;
		} else {
			mv.setViewName("error");
			return mv;
		}

	}
}
