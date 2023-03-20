package com.skilldistillery.vigilance.data;

import java.time.LocalDate;

import com.skilldistillery.vigilance.entities.Address;
import com.skilldistillery.vigilance.entities.HouseHold;
import com.skilldistillery.vigilance.entities.User;

public interface UserDAO {
	
	User login(User user);
	User findUserById(int userId);
	public User updateUser(int id, User user); 
	public Address addnewAddress(int householdId, Address address);
	public Address updateAddress(int id, Address address);
	HouseHold createNewHousehold(HouseHold household);
	HouseHold updateHousehold(HouseHold household, int id);
	User registerNewUser(String dob, User user);
	
	
	

}
