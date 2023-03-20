package com.skilldistillery.vigilance.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.vigilance.data.ReportDAO;

@Controller
public class ReportController {


	@Autowired
private ReportDAO reportDao;
	
	
	@RequestMapping(path="viewAllreports.do", method =RequestMethod.GET)
	public String viewAll(Model model) {
		model.addAttribute("event", reportDao.reports());
		
		return "/webpages/forms/ReportForm";
	}
}
