package com.skilldistillery.vigilance.controllers;


import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.vigilance.data.UserDAO;
import com.skilldistillery.vigilance.entities.User;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO userDao;



	@RequestMapping(path = {"/", "login.do"})
	public String home (Model model) {
//		////////////////DEBUG
//		User u = new User();
//		u.setUsername("vigil");
//		u.setPassword("vigil");
//		u = userDao.login(u);
//		model.addAttribute("smoketest", u);
//		////////////////DEBUG
		return "/webpages/forms/login_register";
		}
	
	
	@RequestMapping(path="userlogin.do", method = RequestMethod.POST)
	public String login(User user, Model model, HttpSession session) {
//	User user = userOne;
		user = userDao.login(user);
		if (user != null) {
			session.setAttribute("loggedinuser", user);
			LocalDateTime localTime = LocalDateTime.now();
			session.setAttribute("loginTime", localTime);
			return "/webpages/home";
		} else {
			
			return "webpages/forms/login_register"; 
		}
	}
	@RequestMapping(path="registration.do") 
	public String register(Model model) {		
		return "/webpages/forms/registrationForm";
	}	
		
	@RequestMapping(path="register.do", params = {"dob", "city", "state",},method = RequestMethod.POST) 
	public String register(User user, Model model, @RequestParam("city") String city, @RequestParam("state") String state, @RequestParam("dob") String dob ) {
		LocalDate birthDate = LocalDate.parse(dob);
		user.setEnabled(true);
		user.setDateOfBirth(birthDate);
		user = userDao.registerNewUser(user);
				
		return "/webpages/registersuccess";
	}
		
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
	  session.removeAttribute("loggedInUser");
	  session.removeAttribute("loginTime");
	  session.removeAttribute("timeOnSite");
	  return "webpages/forms/login_register";
	}
}
