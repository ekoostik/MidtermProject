package com.skilldistillery.vigilance.controllers;

import java.time.LocalDate;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.vigilance.data.HouseholdDAO;
import com.skilldistillery.vigilance.data.NeighborhoodDAO;
import com.skilldistillery.vigilance.data.UserDAO;
import com.skilldistillery.vigilance.entities.User;

@Controller
public class HouseholdController {

	@Autowired
	private HouseholdDAO householdDao;
	@Autowired
	private UserDAO userDao;
	@Autowired
	private NeighborhoodDAO neighborhoodDAO;

	@RequestMapping(path = "updateUserInfo.do", method = RequestMethod.GET)
	public String updateUserInfo(Model model, HttpSession session) {
		User loggedInUser = (User)session.getAttribute("loggedinuser");
		if (loggedInUser != null) {
			loggedInUser = userDao.findUserById(loggedInUser.getId());
			session.setAttribute("loggedinuser", loggedInUser);
		}
		if (loggedInUser != null) {
		model.addAttribute("loggedinuser",loggedInUser);
		return "webpages/forms/updateUser";
		} 
		return "webpages/failurePage";
	}
	
	@RequestMapping(path = "updateUserForm.do", params = "dob",  method = RequestMethod.POST)
	public String updateForm(User user, Model model, HttpSession session, @RequestParam("dob") String dob) {
		User loggedInUser = (User)session.getAttribute("loggedinuser");
		if (loggedInUser != null) {
			loggedInUser = userDao.findUserById(loggedInUser.getId());
			session.setAttribute("loggedinuser", loggedInUser);
		}
		LocalDate birthDate = LocalDate.parse(dob);
		user.setDateOfBirth(birthDate);
		user.setPassword(loggedInUser.getPassword());
		User updatedUser = userDao.updateUser(loggedInUser.getId(), user);
		model.addAttribute("updateduser", updatedUser);
		return "webpages/userAccount";
	}
	
	@RequestMapping(path = "updateHousehold.do", method = RequestMethod.GET)
	public String updateHousehold(Model model, HttpSession session) {
		return "webpages/forms/updateHouseholdForm";
	}
}
