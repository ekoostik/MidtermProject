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
import com.skilldistillery.vigilance.entities.HouseHold;
import com.skilldistillery.vigilance.entities.Pet;
import com.skilldistillery.vigilance.entities.User;
import com.skilldistillery.vigilance.entities.Vehicle;

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
	
	
	
	@RequestMapping(path = "updateOccupants.do",method = RequestMethod.GET)
	public String updateOccupants( Model model, HttpSession session) {
		return "webpages/forms/updateOccupantsForm";
	}
	
	
	@RequestMapping(path = "occupantsUpdated.do", params = "hId",method = RequestMethod.POST)
	public String occupantsUpdated(HouseHold household, Model model, HttpSession session, @RequestParam("hId") String hId) {
		User loggedInUser = (User)session.getAttribute("loggedinuser");
		if (loggedInUser != null) {
			loggedInUser = userDao.findUserById(loggedInUser.getId());
			session.setAttribute("loggedinuser", loggedInUser);
		}
		householdDao.updateHousehold(loggedInUser.getHousehold().getId(), household);

		return "webpages/userAccount";
	}
	
	@RequestMapping(path = "addVehicle.do",method = RequestMethod.GET)
	public String addVehicle( Model model, HttpSession session) {
		User loggedInUser = (User)session.getAttribute("loggedinuser");
		model.addAttribute("loggedinuser", loggedInUser);
		return "webpages/forms/addVehicleForm";
	}	
	
	@RequestMapping(path = "vehicleAdded.do",method = RequestMethod.POST)
	public String vehicleAdded( Vehicle vehicle, Model model, HttpSession session) {
		User loggedInUser = (User)session.getAttribute("loggedinuser");
		model.addAttribute("loggedinuser", loggedInUser);
		vehicle = householdDao.addVehicle(loggedInUser.getHousehold().getId(), vehicle);
		return "webpages/userAccount";
	}	
	
	@RequestMapping(path = "updateVehicle.do",method = RequestMethod.GET)
	public String updateVehicle( Model model, HttpSession session) {
		User loggedInUser = (User)session.getAttribute("loggedinuser");
		model.addAttribute("loggedinuser", loggedInUser);
		return "webpages/forms/updateVehiclesForm";
	}
	
	@RequestMapping(path = "vehicleUpdated.do", method = RequestMethod.POST)
	public String vehicleUpdated(Vehicle vehicle, Model model, HttpSession session) {
		User loggedInUser = (User)session.getAttribute("loggedinuser");
		if (loggedInUser != null) {
			loggedInUser = userDao.findUserById(loggedInUser.getId());
			session.setAttribute("loggedinuser", loggedInUser);
		}
		vehicle = householdDao.updateVehicle(vehicle.getId(), vehicle);
		return "webpages/userAccount";
	}
	
	@RequestMapping(path = "removeVehicle.do", method = RequestMethod.GET)
	public String removeVehicle( Model model, HttpSession session) {
		User loggedInUser = (User)session.getAttribute("loggedinuser");
		model.addAttribute("loggedinuser", loggedInUser);
		return "webpages/forms/removeVehicleForm";
	}
	
	@RequestMapping(path = "vehicleRemoved.do", params = "id", method = RequestMethod.POST)
	public String vehicleRemoved( Model model, HttpSession session, @RequestParam("id") String vehicleId) {
		User loggedInUser = (User)session.getAttribute("loggedinuser");
		if (loggedInUser != null) {
			loggedInUser = userDao.findUserById(loggedInUser.getId());
			session.setAttribute("loggedinuser", loggedInUser);
		}
		int vId = Integer.parseInt(vehicleId);
		Vehicle vehicle = householdDao.removeVehicle(vId);
		model.addAttribute("loggedinuser", loggedInUser);
		return "webpages/userAccount";
	}
	
	@RequestMapping(path = "updatePet.do",method = RequestMethod.GET)
	public String updatePet( Model model, HttpSession session) {
		User loggedInUser = (User)session.getAttribute("loggedinuser");
		model.addAttribute("loggedinuser", loggedInUser);
		return "webpages/forms/updatePetForm";
	}
	
	@RequestMapping(path = "petUpdated.do",method = RequestMethod.POST)
	public String petUpdated(Pet pet, Model model, HttpSession session) {
		User loggedInUser = (User)session.getAttribute("loggedinuser");
		if (loggedInUser != null) {
			loggedInUser = userDao.findUserById(loggedInUser.getId());
			session.setAttribute("loggedinuser", loggedInUser);
		}
		householdDao.updatePet(pet.getId(), pet);
		return "webpages/userAccount";
	}
	
	@RequestMapping(path = "redirect.do",method = RequestMethod.GET)
	public String redirectUpdate( Model model, HttpSession session) {
		return "webpages/forms/updateOccupantsForm";
	}
	
	@RequestMapping(path = "cancelUpdate.do")
	public String cancelUpdate( Model model) {
		return "webpages/userAccount";
	}
}
