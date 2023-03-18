package com.skilldistillery.vigilance.data;

import com.skilldistillery.vigilance.entities.User;

public interface UserDAO {
	
	User login(User user);
	User registerNewUser(User user);
	User findUserById(int userId);
	

}
