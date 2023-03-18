package com.skilldistillery.vigilance.controllers;


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
			return "/webpages/home";
		} else {
			
			return "webpages/forms/login_register"; 
		}
	}
	
		
	@RequestMapping(path="register.do")
	public String register(User user, Model model) {
		
		return "";
		
	}
}
