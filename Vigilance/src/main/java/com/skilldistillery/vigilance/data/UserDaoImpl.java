package com.skilldistillery.vigilance.data;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.vigilance.entities.Address;
import com.skilldistillery.vigilance.entities.HouseHold;
import com.skilldistillery.vigilance.entities.Neighborhood;
import com.skilldistillery.vigilance.entities.User;

//AUTHOR: ROB TISDALE

@Transactional
@Service
public class UserDaoImpl implements UserDAO {
	@PersistenceContext
	private EntityManager em;
	@Autowired
	private NeighborhoodDAO nDao;

	

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
	public User registerNewUser(String dob, User user) {
		LocalDate birthDate = LocalDate.parse(dob);
		user.setEnabled(true);
		user.setDateOfBirth(birthDate);
		em.persist(user);
		em.flush();
		HouseHold household = new HouseHold();
		household.setOccupants(1);
		household.setUser(user);
		user.setHousehold(household);
		em.persist(household);
		em.flush();

			return user;
	}
	@Override 
	public HouseHold createNewHousehold(HouseHold household) {
		em.persist(household);
		em.flush();
		return household;
	}
	
	@Override
	public HouseHold updateHousehold(HouseHold household, int userid) {
		household = em.find(HouseHold.class, household.getId());
//		household.setUsers.setId;
		return household;
	}
	@Override
	public Address addnewAddress(int householdId, Address address) {
		HouseHold hh = em.find(HouseHold.class, householdId);
		hh.setAddress(address);
		em.persist(address);
		em.flush();
		return address; 
	}
	
	
	@Override
	public User updateUser(int id, User user) {
		User updateUser =em.find(User.class, id);
		updateUser.setUsername(user.getUsername());
		updateUser.setPassword(user.getPassword());
		updateUser.setEnabled(true);
		updateUser.setFirstName(user.getFirstName());
		updateUser.setLastName(user.getLastName());
		updateUser.setEmail(user.getEmail());
		updateUser.setProfilePic(user.getProfilePic());
		updateUser.setAboutme(user.getAboutme());
		updateUser.setUpdateDate(LocalDate.now());
		
		return updateUser;
		
	} 
	
	
	@Override
	public Address updateAddress(int id, Address address) {
		Address addr = null;
		
		return addr;
		
	} 

	@Override
	public User findUserById(int userId) {
		// TODO Auto-generated method stub
		return null;
	}

}
