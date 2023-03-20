package com.skilldistillery.vigilance.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

//AUTHOR: ROB TISDALE


class UserTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
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
		user = em.find(User.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user= null;
	}

	@Test
	void test_user_mappings() {
		assertNotNull(user);
		assertEquals("admin", user.getUsername());
	}

	@Test
	void test_report_map() {
		assertNotNull(user);
		assertFalse(user.getReports().isEmpty());
	}
	
	@Test
	void test_neighborhoodEV_map() {
		user=em.find(User.class, 2);
		assertNotNull(user.getNeighborhoodEvent());
		assertFalse(user.getNeighborhoodEvent().isEmpty());
	}
	@Test
	void test_event_comment_map() {
		assertNotNull(user.getEventComments());
		assertFalse(user.getEventComments().isEmpty());
	}
	@Test
	void test_houseHold_map() {
		user = em.find(User.class, 2);
		assertNotNull(user.getHousehold());
		assertEquals(2, user.getHousehold().getId());

	}
	
	@Test
	void test_User_Post_Mappings() {
		user = em.find(User.class, 2);
		assertNotNull(user);
		assertNotNull(user.getPosts());
		assertFalse(user.getPosts().isEmpty());

	}
	

	
}
