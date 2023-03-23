package com.skilldistillery.vigilance.data;

import java.util.List;

import com.skilldistillery.vigilance.entities.Address;
import com.skilldistillery.vigilance.entities.User;

public interface UserDAO {
	
	public User login(User user);
	public User findUserById(int userId);
	public User updateUser(int id, User user); 
	public Address addnewAddress(int householdId, Address address);
	public Address updateAddress(int id, Address address);
	public User registerNewUser(String dob, User user);
	boolean deleteAddress(int addressId);
	boolean deleteUser(int userId);
	List<User> findAllUsers();
	
	
	

}
