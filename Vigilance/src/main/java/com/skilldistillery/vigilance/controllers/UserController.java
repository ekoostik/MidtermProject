package com.skilldistillery.vigilance.controllers;


import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.vigilance.data.NeighborhoodDAO;
import com.skilldistillery.vigilance.data.UserDAO;
import com.skilldistillery.vigilance.entities.Address;
import com.skilldistillery.vigilance.entities.Neighborhood;
import com.skilldistillery.vigilance.entities.User;

//AUTHOR: ROB TISDALE 

@Controller
public class UserController {
	
	@Autowired
	private UserDAO userDao;
	@Autowired
	private NeighborhoodDAO neighborhoodDAO;



	@RequestMapping(path = {"/", "login.do"})
	public String main(Model model) {
//		////////////////DEBUG
//		User u = new User();
//		u.setUsername("vigil");
//		u.setPassword("vigil");
//		u = userDao.login(u);
//		model.addAttribute("smoketest", u);
//		////////////////DEBUG
		return "/webpages/forms/login_register";
		}
	
	@RequestMapping(path="home.do") 
	public String home(Model model) {		
		return "/webpages/home";
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
	
	//added houseHoldId() method to add arbitrary # until db updated
	//update to take in Address and set.
	@RequestMapping(path="register.do", params = "dob", method = RequestMethod.POST) 
	public String register(User user, Model model, @RequestParam("dob") String dob ) {
		user = userDao.registerNewUser(dob,user);	
		model.addAttribute("user", user);
		return "webpages/forms/addressForm";
	}
	
	@RequestMapping(path="newaddr.do", method = RequestMethod.POST) 
	public String register(Address address, int householdId, Model model) {
		address = userDao.addnewAddress(householdId, address);	
		List<Neighborhood> nhoods = neighborhoodDAO.findNeighborhoodsByCityStateZip(address.getCity(), address.getState(), address.getZipCode());
		model.addAttribute("existingNeighborhoods",nhoods);
		return "webpages/forms/addressForm";
	}
	
	@RequestMapping(path="account.do") 
	public String account(Model model) {		
		return "webpages/forms/login_register";
	}	
	
	@RequestMapping(path="profile.do") 
	public String Profile(Model model) {		
		return "/webpages/userProfile";
	}	
		
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
	  session.removeAttribute("loggedInUser");
	  session.removeAttribute("loginTime");
//	  session.removeAttribute("timeOnSite");
	  return "webpages/forms/login_register";
	}
}
