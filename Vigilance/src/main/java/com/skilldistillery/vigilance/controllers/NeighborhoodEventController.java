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

		return "/webpages/forms/neighborhoodEventForm";
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
			mv.setViewName("redirect:NEventAdded.do");
			return mv;
		} else {
			mv.setViewName("error");
			return mv;
		}

	}
	
	@RequestMapping(path="NEventAdded.do", method = RequestMethod.GET)
	public ModelAndView addedNevent() {
	ModelAndView mv = new ModelAndView();
	mv.setViewName("event");
	return mv;
}
	
	
	
	@RequestMapping(path="getNEventById.do", method = RequestMethod.GET)
	public String getnEvent(int id, Model model) {
		NeighborhoodEvent event = eventDao.findEventById(id);
		model.addAttribute("events", event);
		
		return "/webpages/forms/neighborhoodEventForm";
}
	
	@RequestMapping(path="update.do", method = RequestMethod.GET)
	public String updateEvent(int id, Model model) {
	model.addAttribute("event", eventDao.findEventById(id));
	
	return "updateEvent";
}
	
	
	@RequestMapping(path="submitUpdate.do", method = RequestMethod.POST)
	public ModelAndView update(int id, NeighborhoodEvent event, RedirectAttributes redir) {
	
	ModelAndView mv = new ModelAndView();
	NeighborhoodEvent updated = eventDao.updateEvent(id, event);
	if(updated!= null) {
		redir.addFlashAttribute("event", event);
		mv.setViewName("redirect:EventUpdated.do");
		return mv;
	}else {
		mv.setViewName("error");
		return mv;
	}
}
	
	@RequestMapping(path="EventUpdated.do", method = RequestMethod.GET)
	public String updatedEvent() {
	
	return "viewEvent";
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
