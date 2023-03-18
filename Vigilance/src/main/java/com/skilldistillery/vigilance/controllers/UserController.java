package com.skilldistillery.vigilance.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@RequestMapping(path="login.do")
	public String login(Model model) {
		//add logic to call DAOImpl to verify user and apply to session manager
		return "/webpages/forms/login_register";
	}
		
	@RequestMapping(path="register.do")
	public String register(Model model) {
		return "/webpages/forms/registrationForm";
		
	}
}
