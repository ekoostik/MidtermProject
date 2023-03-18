package com.skilldistillery.vigilance.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class EventCommentTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private EventComment eComment;
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
		eComment = em.find(EventComment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		eComment = null;
	}

	@Test
	void test_HOA_mappings() {
		assertNotNull(eComment);
		assertEquals("I be there!!!", eComment.getComment());
		assertEquals(1, eComment.getId());
	}
	
	@Test
	
	void test_neighborhood_event() {
		assertNotNull(eComment.getNeighborhoodEventId());
		assertEquals(2, eComment.getNeighborhoodEventId().getUser().getId());
	}
	@Test
	void test_user_map() {
		assertNotNull(eComment.getUserId());
		assertEquals(1, eComment.getUserId().getId());
	}

}
