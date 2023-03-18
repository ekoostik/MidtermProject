package com.skilldistillery.vigilance.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.vigilance.data.NeighborhoodEventDAO;

@Controller
public class NeighborhoodEventController {

	@Autowired
private NeighborhoodEventDAO eventDao;
	
	
	@RequestMapping(path="viewAllEvents.do", method =RequestMethod.GET)
	public String viewAll(Model model) {
		model.addAttribute("event", eventDao.allEvents());
		
		return "/webpages/forms/NeighborhoodEventForm";
	}
	
	
	
	
	
}
