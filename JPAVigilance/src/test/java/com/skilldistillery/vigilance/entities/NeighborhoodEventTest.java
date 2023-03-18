package com.skilldistillery.vigilance.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class NeighborhoodEventTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private NeighborhoodEvent nEvent;
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
		nEvent = em.find(NeighborhoodEvent.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		nEvent= null;
	}

	@Test
	void test_NeighborhoodEvent_mappings() {
		assertNotNull(nEvent);
		assertEquals("BYOB", nEvent.getDescription());
	}
	
	@Test
	void test_address_map() {
		assertNotNull(nEvent.getAddress());
		assertEquals(1, nEvent.getAddress().getId());
		
		
	}
	@Test
	void test_user_map() {
		assertNotNull(nEvent);
		assertEquals("Damien", nEvent.getUser().getFirstName());
	}
	
	@Test
	void test_nEvent_map() {
		assertNotNull(nEvent.getNeighborhoodId());
		assertEquals(1, nEvent.getNeighborhoodId().getId());
	}
	
	@Test
	void test_neighborhood_comments() {
		assertNotNull(nEvent.getEventComments());
		assertFalse(nEvent.getEventComments().isEmpty());
	}
}
