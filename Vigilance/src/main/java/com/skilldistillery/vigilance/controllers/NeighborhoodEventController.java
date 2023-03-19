package com.skilldistillery.vigilance.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.vigilance.data.NeighborhoodEventDAO;
import com.skilldistillery.vigilance.entities.NeighborhoodEvent;

@Controller
public class NeighborhoodEventController {

	@Autowired
	private NeighborhoodEventDAO eventDao;

	@RequestMapping(path = "viewAllEvents.do", method = RequestMethod.GET)
	public String viewAll(Model model) {
		model.addAttribute("event", eventDao.allEvents());

		return "/webpages/forms/NeighborhoodEventForm";
	}

	@RequestMapping(path = "addNEvent.do", method = RequestMethod.POST)
	public ModelAndView addNEvent(NeighborhoodEvent event, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();
		NeighborhoodEvent newEvent = null;
		try {
			newEvent = eventDao.createEvent(event);
		} catch (RuntimeException e) {
			mv.setViewName("error");
			return mv;
		}
		if (newEvent != null) {
			redir.addFlashAttribute("event", event);
			mv.setViewName("redirect:NeventAdded.do");
			return mv;
		} else {
			mv.setViewName("error");
			return mv;
		}

	}
	
	@RequestMapping(path="NeventAdded.do", method = RequestMethod.GET)
	public ModelAndView addedNevent() {
	ModelAndView mv = new ModelAndView();
	mv.setViewName("event");
	return mv;
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
