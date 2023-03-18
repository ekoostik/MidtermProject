package com.skilldistillery.vigilance.data;


import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.vigilance.entities.User;

class UserDAOTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private UserDaoImpl userDao;
	private User user;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPAVigilance");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		userDao = new UserDaoImpl();
		userDao.setEntityManager(em);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user = null;
	}

	
	@Test
	void test_validate_user() {
		user = userDao.validateUserLogin("admin", "admin");
		assertNotNull(user);

	}
}
