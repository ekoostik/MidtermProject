package com.skilldistillery.vigilance.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.vigilance.data.NeighborhoodDAO;
import com.skilldistillery.vigilance.entities.Address;
import com.skilldistillery.vigilance.entities.Neighborhood;
import com.skilldistillery.vigilance.entities.NeighborhoodEvent;
import com.skilldistillery.vigilance.entities.Post;

@Controller
public class NeighborhoodController {

	@Autowired
	private NeighborhoodDAO NHDao;

	// ****************************** Neighborhood Events // *****************************
	@RequestMapping(path = "viewAllEvents.do", method = RequestMethod.GET)
	public String viewAll(Model model) {
		model.addAttribute("event", NHDao.allEvents());

		return "/webpages/forms/neighborhoodEventForm";
	}

	@RequestMapping(path = "addNEvent.do", method = RequestMethod.POST)
	public ModelAndView addNEvent(NeighborhoodEvent event, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();
		NeighborhoodEvent newEvent = null;
		try {
			newEvent = NHDao.createEvent(event);
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

	@RequestMapping(path = "NEventAdded.do", method = RequestMethod.GET)
	public ModelAndView addedNevent() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("event");
		return mv;
	}

	@RequestMapping(path = "getNEventById.do", method = RequestMethod.GET)
	public String getnEvent(int id, Model model) {
		NeighborhoodEvent event = NHDao.findEventById(id);
		model.addAttribute("events", event);

		return "/webpages/forms/neighborhoodEventForm";
	}

	@RequestMapping(path = "update.do", method = RequestMethod.GET)
	public String updateEvent(int id, Model model) {
		model.addAttribute("event", NHDao.findEventById(id));

		return "updateEvent";
	}

	@RequestMapping(path = "submitUpdate.do", method = RequestMethod.POST)
	public ModelAndView update(int id, NeighborhoodEvent event, RedirectAttributes redir) {

		ModelAndView mv = new ModelAndView();
		NeighborhoodEvent updated = NHDao.updateEvent(id, event);
		if (updated != null) {
			redir.addFlashAttribute("event", event);
			mv.setViewName("redirect:EventUpdated.do");
			return mv;
		} else {
			mv.setViewName("error");
			return mv;
		}
	}

	@RequestMapping(path = "EventUpdated.do", method = RequestMethod.GET)
	public String updatedEvent() {

		return "viewEvent";
	}

	@RequestMapping(path = "deleteEvent.do", method = RequestMethod.POST)
	public ModelAndView deleteEvent(int id, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();
		boolean deleted = NHDao.deleteEvent(id);
		if (deleted) {
			redir.addFlashAttribute("event", id);
			mv.setViewName("redirect:eventDeleted.do");
			return mv;
		} else {
			mv.setViewName("error");
			return mv;
		}

	}

	@RequestMapping(path = "eventDeleted.do", method = RequestMethod.GET)
	public String deletedEvent() {
		return "";
	}

	// ************************* Neighborhood *************************

	@RequestMapping(path = "viewAllNeighborhoods.do", method = RequestMethod.GET)
	public String viewAllHoods(Model model) {
		model.addAttribute("hood", NHDao.allNeighborhoods());

		return "/webpages/forms/neighborhoodForm";
	}

	@RequestMapping(path = "addHood.do", method = RequestMethod.POST)
	public ModelAndView addNEvent(Neighborhood hood, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();
		Neighborhood newHood = null;
		try {
			newHood = NHDao.createNeighborhood(hood);
		} catch (RuntimeException e) {
			mv.setViewName("error");
			return mv;
		}
		if (newHood != null) {
			redir.addFlashAttribute("hood", hood);
			mv.setViewName("redirect:HoodAdded.do");
			return mv;
		} else {
			mv.setViewName("error");
			return mv;
		}

	}

	@RequestMapping(path = "HoodAdded.do", method = RequestMethod.GET)
	public ModelAndView addedHood() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/webpages/forms/neighborhoodForm");
		return mv;
	}

	@RequestMapping(path = "deleteHood.do", method = RequestMethod.POST)
	public ModelAndView deleteHood(int id, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();
		boolean deleted = NHDao.deleteNeighborhood(id);
		if (deleted) {
			redir.addFlashAttribute("hood", id);
			mv.setViewName("redirect:hoodDeleted.do");
			return mv;
		} else {
			mv.setViewName("error");
			return mv;
		}

	}

	@RequestMapping(path = "hoodDeleted.do", method = RequestMethod.GET)
	public String deletedHood() {
		return "";
	}

	// TODO update Neighborhood

	
	
	
	
	
	
	@RequestMapping(path = "viewAllAddress.do", method = RequestMethod.GET)
	public String viewAllAddress(int id, Model model) {
		List <Address> addressList = NHDao.findHoodById(id).getAddresses();
		model.addAttribute("address", addressList);
		
		return "/webpages/forms/TestLanding";
	}
	
	@RequestMapping(path = "viewAllPost.do", method = RequestMethod.GET)
	public String viewAllPost(int id, Model model) {
		List <Post> postList = NHDao.findHoodById(id).getPosts();
		model.addAttribute("post", postList);
		
		return "/webpages/forms/TestLanding";
	}

}
