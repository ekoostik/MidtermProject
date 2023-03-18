package com.skilldistillery.vigilance.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.vigilance.data.UserDAO;
import com.skilldistillery.vigilance.entities.User;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO userDao;


	@RequestMapping(path = {"/", "login.do"})
	public String home (Model model) {
		
		////////////////DEBUG
		User u = new User();
		u.setUsername("vigil");
		u.setPassword("vigil");
		u = userDao.login(u);
		model.addAttribute("smoketest", u);
		////////////////DEBUG
		return "/webpages/forms/login_register";
		}
	
	
	@RequestMapping(path="login.do", method = RequestMethod.POST)
	public String login(User user, HttpSession session, String userName, String password) {
		user = userDao.validateUserLogin(userName, password);
		if (user != null) {
			session.setAttribute("loggedinuser", user);
			return "account";
		} else {
			
			return "index"; 
		}
	}
	
		
	@RequestMapping(path="register.do")
	public String register(Model model) {
		return "/webpages/forms/registrationForm";
		
	}
}
