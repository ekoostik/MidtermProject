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


	@RequestMapping(path = {"/", "home.do"})
	public String home (Model model) {
		
		////////////////DEBUG
		User u = new User();
		u.setUsername("admin");
		u.setPassword("admin");
		u = userDao.login(u);
		model.addAttribute("smoketest", u);
		////////////////DEBUG
		return "home";
	}
}
