package com.skilldistillery.vigilance.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.vigilance.entities.Address;
import com.skilldistillery.vigilance.entities.HouseHold;
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
	public User registerNewUser(User user) {
			em.persist(user);
			em.flush();
			return user;
	}
	
	public void neighborhoodLookup(String city, String state) {
		Address addr = new Address();
		HouseHold test = new HouseHold();
//		String jpql = "SELECT u FROM User u WHERE u.username = :name AND u.password = :pass AND u.enabled = 1";
//		try {
//			user = em.createQuery(jpql, User.class).setParameter("name", user.getUsername())
//					.setParameter("pass", user.getPassword()).getSingleResult();
//		} catch (Exception e) {
//			e.printStackTrace();
//			user = null;
//		}
		

		}
	
	public Address addnewAddress(Address address) {
		Address addr = null;
		
		return addr;
		
	} 

	@Override
	public User findUserById(int userId) {
		// TODO Auto-generated method stub
		return null;
	}

}
