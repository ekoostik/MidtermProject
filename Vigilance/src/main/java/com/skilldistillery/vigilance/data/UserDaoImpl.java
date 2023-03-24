package com.skilldistillery.vigilance.data;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.vigilance.entities.Address;
import com.skilldistillery.vigilance.entities.HouseHold;
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
			user.getHousehold().getPets().size();
			user.getHousehold().getVehicles().size();
			user.getEventComments().size();
			user.getNeighborhoodEvent().size();
			user.getReports().size();
		} catch (Exception e) {
			e.printStackTrace();
			user = null;
		}
		return user;
	}

	@Override
	public User registerNewUser(String dob, User user) {
		LocalDate birthDate = LocalDate.parse(dob);
		user.setRole("user");
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
	public Address addnewAddress(int householdId, Address address) {
		HouseHold hh = em.find(HouseHold.class, householdId);
		hh.setAddress(address);
		em.persist(address);
		em.flush();
		return address; 
	}
	
	@Override
	public Address updateAddress(int householdId, Address address) {
		Address updateAddress = em.find(Address.class, address.getId());
		updateAddress.setAddress1(address.getAddress1());
		updateAddress.setAddress2(address.getAddress2());
		updateAddress.setCity(address.getCity());
		updateAddress.setState(address.getState());
		updateAddress.setZipCode(address.getZipCode());
		return updateAddress;
	}
	
	@Override
	public boolean deleteAddress(int addressId) {
		Address deleteAddress = em.find(Address.class, addressId);
		em.remove(deleteAddress);
		em.flush();
		
		if (em.find(Address.class, addressId) == null) {
			return true;
		} else {
			return false;
		}
	}
	
	@Override
	public User updateUser(int userId, User user) {
		User updateUser =em.find(User.class, userId);
		updateUser.setUsername(user.getUsername());
		updateUser.setPassword(user.getPassword());
		updateUser.setEnabled(true);
		updateUser.setFirstName(user.getFirstName());
		updateUser.setLastName(user.getLastName());
		updateUser.setEmail(user.getEmail());
		updateUser.setProfilePic(user.getProfilePic());
		updateUser.setDateOfBirth(user.getDateOfBirth());
		updateUser.setAboutme(user.getAboutme());
		updateUser.setUpdateDate(LocalDate.now());
		
		return updateUser;
		
	} 
	
	@Override
	public boolean deleteUser(int userId) {
		User deletedUser = em.find(User.class, userId);
		em.remove(deletedUser);
		em.flush();
		
		if (em.find(User.class, userId) == null) {
			return true;
		} else {
			return false;
		}
	}
	

	@Override
	public User findUserById(int userId) {
		User user = em.find(User.class, userId);
		user.getHousehold().getPets().size();
		user.getHousehold().getVehicles().size();
		user.getEventComments().size();
		user.getNeighborhoodEvent().size();
		user.getReports().size();
		return user;
	}

	@Override
	public List<User> findAllUsers() {
		String jpql = "SELECT u FROM User u";
		List<User> users = new ArrayList<>();
		try {
			users = em.createQuery(jpql, User.class).getResultList();
			return users;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public User activateUser(int userId) {
		User user = em.find(User.class, userId);
		user.setEnabled(true);
		em.persist(user);
		User userCheck = em.find(User.class, userId);
		if (userCheck.isEnabled() == true) {
			return userCheck;
		}
		return user;
		
	}
	
	@Override
	public User deactivateUser(int userId) {
		User user = em.find(User.class, userId);
		user.setEnabled(false);
		em.persist(user);
		User userCheck = em.find(User.class, userId);
		if (userCheck.isEnabled() == false) {
			return userCheck;
		}
		return user;
	}


}
