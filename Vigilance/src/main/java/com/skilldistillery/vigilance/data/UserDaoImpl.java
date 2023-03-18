package com.skilldistillery.vigilance.data;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.vigilance.entities.User;

@Transactional
@Service
public class UserDaoImpl implements UserDAO {
	@PersistenceContext
	private EntityManager em;
	
	public void setEntityManager(EntityManager em) {
		this.em = em;
	}

	@Override
	public User login(User user) {
		String jpql = "SELECT u FROM User u WHERE u.username = :name AND u.password = :pass AND u.enabled = 1";
		try {
			user = em.createQuery(jpql, User.class).setParameter("name", user.getUsername())
					.setParameter("pass", user.getPassword()).getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
			user = null;
		}
		return user;
	}

	@Override
	public User validateUserLogin(String username, String password) {
		User user = new User();
		String jpql = "SELECT u FROM User u WHERE u.username = :user AND u.password = :pass";
			user = em.createQuery(jpql, User.class)
					.setParameter("user", username)
					.setParameter("pass", password)
					.getSingleResult();
			if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
				return user;
			} else {
				return null;
			}
	}

	@Override
	public User registerNewUser(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User findUserById(int userId) {
		// TODO Auto-generated method stub
		return null;
	}

}
