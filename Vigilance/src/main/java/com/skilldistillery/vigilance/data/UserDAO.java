package com.skilldistillery.vigilance.data;

import com.skilldistillery.vigilance.entities.User;

public interface UserDAO {
	
	User login(User user);
	boolean validateUserLogin(String username, String password);
	User registerNewUser(User user);
	

}
