package com.skilldistillery.vigilance.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.vigilance.data.ProfileDao;
import com.skilldistillery.vigilance.entities.User;

@Controller
public class ProfileController {
	// Collin

	@Autowired
	private ProfileDao profileDao;

	@RequestMapping(path = "RetrieveMyPosts.do", method = RequestMethod.GET)
	public String ViewMyPosts(Model model, HttpServletRequest session) {
		User loggedInUser = (User) session.getSession().getAttribute("loggedinuser");
		model.addAttribute("post", profileDao.retrieveAllPosts(loggedInUser));
		return "/webpages/DisplayUsersPosts";
	}

	@RequestMapping(path = "RetrieveMyReports.do", method = RequestMethod.GET)
	public String viewMyReports(Model model, HttpServletRequest session) {
		User loggedInUser = (User) session.getSession().getAttribute("loggedinuser");
		model.addAttribute("report", profileDao.retrieveAllReports(loggedInUser));
		return "/webpages/DisplayUsersReports";
	}

	@RequestMapping(path = "RetrieveMyEvents.do", method = RequestMethod.GET)
	public String viewMyEvents(Model model, HttpServletRequest session) {
		User loggedInUser = (User) session.getSession().getAttribute("loggedinuser");
		model.addAttribute("event", profileDao.retrieveAllEvents(loggedInUser));
		return "/webpages/DisplayUsersEvents";
	}

}
