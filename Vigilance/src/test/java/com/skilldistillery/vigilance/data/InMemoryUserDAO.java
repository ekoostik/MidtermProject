package com.skilldistillery.vigilance.data;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Repository;

import com.skilldistillery.vigilance.entities.User;

@Repository
public class InMemoryUserDAO implements UserDAO {
//////////////////////CREATED AS A JUST IN CASE /////////////////////////
//////////////////////CREATED AS A JUST IN CASE /////////////////////////
//////////////////////CREATED AS A JUST IN CASE /////////////////////////
//////////////////////CREATED AS A JUST IN CASE /////////////////////////
//////////////////////CREATED AS A JUST IN CASE /////////////////////////
  private Map<Integer, User> users;
  
  public InMemoryUserDAO () {
    users = new LinkedHashMap<>();
    
    users.put(1, new User(1, "admin", "admin", 1, "admin", "admin", "admin@gmail.com"));
    users.put(2, new User(2, "user", "password", 1, "Kevin", "Bacon", "kbacon@gmail.com"));    
  }
  

  @Override
  public User findUserById(int userId) {
    User u = users.get(userId);
    System.out.println(u);
    
    return u;
  }


@Override
public User login(User user) {
	// TODO Auto-generated method stub
	return null;
}


@Override
public User registerNewUser(User user) {
	// TODO Auto-generated method stub
	return null;
}

}
