package com.skilldistillery.vigilance.data;

import com.skilldistillery.vigilance.entities.Address;
import com.skilldistillery.vigilance.entities.User;

public interface UserDAO {
	
	User login(User user);
	User registerNewUser(User user);
	User findUserById(int userId);
	public int houseHoldId();
	public User updateUser(int id, User user); 
	public Address addnewAddress(Address address);
	public Address updateAddress(int id, Address address);
	public void neighborhoodLookup(String city, String state);
	
	
	

}
