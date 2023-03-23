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

import com.skilldistillery.vigilance.data.HouseholdDAO;
import com.skilldistillery.vigilance.data.NeighborhoodDAO;
import com.skilldistillery.vigilance.data.UserDAO;
import com.skilldistillery.vigilance.entities.Address;
import com.skilldistillery.vigilance.entities.HouseHold;
import com.skilldistillery.vigilance.entities.Neighborhood;
import com.skilldistillery.vigilance.entities.Pet;
import com.skilldistillery.vigilance.entities.User;
import com.skilldistillery.vigilance.entities.Vehicle;

//AUTHOR: ROB TISDALE 

@Controller
public class UserController {

	@Autowired
	private UserDAO userDao;
	@Autowired
	private NeighborhoodDAO neighborhoodDAO;
	@Autowired
	private HouseholdDAO householdDao;

	@RequestMapping(path = { "/", "login.do" })
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

	@RequestMapping(path = "home.do")
	public String home(Model model) {
		return "/webpages/home";
	}

	@RequestMapping(path = "userlogin.do", method = RequestMethod.POST)
	public String login(User user, Model model, HttpSession session) {
//	User user = userOne;
		user = userDao.login(user);
		if (user != null && user.getRole().equals("user")) {
			session.setAttribute("loggedinuser", user);
			LocalDateTime localTime = LocalDateTime.now();
			session.setAttribute("loginTime", localTime);
			return "/webpages/home"; 
		}else if (user != null && user.getRole().equals("admin")) {
			session.setAttribute("loggedinuser", user);
			LocalDateTime localTime = LocalDateTime.now();
			session.setAttribute("loginTime", localTime);
			return "/webpages/adminHome";
		}
		return "webpages/forms/login_register";
	}

	@RequestMapping(path = "registration.do")
	public String register(Model model) {
		return "/webpages/forms/registrationForm";
	}

	// added houseHoldId() method to add arbitrary # until db updated
	// update to take in Address and set.
	@RequestMapping(path = "register.do", params = "dob", method = RequestMethod.POST)
	public String register(User user, Model model, @RequestParam("dob") String dob, HttpSession session) {
		user = userDao.registerNewUser(dob, user);
		if (user != null) {
			session.setAttribute("loggedinuser", user);
			session.setAttribute("householdid", user.getHousehold().getId());
			LocalDateTime localTime = LocalDateTime.now();
			session.setAttribute("loginTime", localTime);
			return "webpages/forms/addressForm";
		} else {

			return "webpages/forms/login_register";
		}

	}

	@RequestMapping(path = "newaddr.do", method = RequestMethod.POST)
	public String newAddress(Address address, Model model, HttpSession session) {
		User loggedInUser = (User)session.getAttribute("loggedinuser");
		int householdId = loggedInUser.getHousehold().getId();
		address = userDao.addnewAddress(householdId, address);
		if (loggedInUser != null) {
			loggedInUser = userDao.findUserById(loggedInUser.getId());
			session.setAttribute("loggedinuser", loggedInUser);
		}
		List<Neighborhood> nhoods = neighborhoodDAO.findNeighborhoodsByCityStateZip(address.getCity(),
				address.getState(), address.getZipCode());
		System.out.println(nhoods);
		if (nhoods.size() > 0) {
			model.addAttribute("existingNeighborhoods", nhoods);
			return "webpages/existingNeighborhoods";
		} else {
			return "webpages/forms/neighborhoodForm";
		}
	}
	@RequestMapping(path = "enterNewNeighborhood.do")
	public String newNeighborhood( Model model) {
			return "webpages/forms/neighborhoodForm";
		
	}
	

	@RequestMapping(path = "newneighborhood.do", method = RequestMethod.POST)
	public String createNeighborhood(Neighborhood neighborhood, Model model, HttpSession session) {
		User loggedInUser = (User) session.getAttribute("loggedinuser");
		model.addAttribute("loggedinuser", loggedInUser);
		neighborhood = neighborhoodDAO.createNeighborhood(neighborhood);
		neighborhoodDAO.assignNeighborhoodToAddress(loggedInUser.getId(), neighborhood.getId());
		if (neighborhood != null) {
			return "webpages/forms/login_register";
		} else {
			return "webpages/failurePage/login_register";
		}
	}

	@RequestMapping(path = "assignUserToNeighborhood.do", params = "neighborhoodId", method = RequestMethod.POST)
	public String assignUsertoNeighborhood(Model model, @RequestParam("neighborhoodId") int neighborhoodId,
			HttpSession session) {

		User loggedInUser = (User) session.getAttribute("loggedinuser");
		model.addAttribute("loggedinuser", loggedInUser);
		if (loggedInUser != null) {
			neighborhoodDAO.assignNeighborhoodToAddress(loggedInUser.getId(), neighborhoodId);
			return "webpages/forms/login_register";

		}
		return "webpages/failurePage";
	}

	@RequestMapping(path = "account.do")
	public String account(Model model, HttpSession session) {
		User loggedInUser = (User) session.getAttribute("loggedinuser");
		if (loggedInUser != null) {
			loggedInUser = userDao.findUserById(loggedInUser.getId());
			HouseHold household = loggedInUser.getHousehold();
			List<Vehicle> vehicles = loggedInUser.getHousehold().getVehicles();
			Address address = loggedInUser.getHousehold().getAddress();
			List<Pet> pets = loggedInUser.getHousehold().getPets();
			session.setAttribute("household", household);
			session.setAttribute("vehicles", vehicles);
			session.setAttribute("address", address);
			session.setAttribute("pets", pets);
			session.setAttribute("loggedinuser", loggedInUser);
			
			return "webpages/userAccount";
		} 
		return "webpages/forms/login_register";
	}

	@RequestMapping(path = "profile.do")
	public String Profile(Model model, HttpSession session) {
		User loggedInUser = (User) session.getAttribute("loggedinuser");
		
		if (loggedInUser != null) {
			loggedInUser = userDao.findUserById(loggedInUser.getId());
			session.setAttribute("loggedinuser", loggedInUser);
			return "webpages/userProfile";
		} 
		
		return "webpages/forms/login_register";
	}

	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("loggedInUser");
		session.removeAttribute("loginTime");
//	  session.removeAttribute("timeOnSite");
		return "webpages/forms/login_register";
	}
	
	@RequestMapping(path = "cancelRegistration.do")
	public String cancelUpdate( Model model) {
		return "webpages/forms/login_register";
	}
	
//Stretch Goal
//	@RequestMapping(path = "cancelAndDeleteRegistration.do", method = RequestMethod.POST)
//	public String cancelRegistration(Model model, HttpSession session) {
//		User loggedInUser = (User) session.getAttribute("loggedinuser");
//		if (loggedInUser != null) {
//			loggedInUser = userDao.findUserById(loggedInUser.getId());
//			session.setAttribute("loggedinuser", loggedInUser);
//		}
//		HouseHold household = loggedInUser.getHousehold();
//		Address address = loggedInUser.getHousehold().getAddress();
//		userDao.deleteAddress(address.getId());
//		householdDao.deleteHoushold(household.getId());
//		userDao.deleteUser(loggedInUser.getId());
//			return "webpages/forms/login_register";
//	}
	
}
