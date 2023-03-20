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

public class NeighborhoodTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Neighborhood nHood;
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
		nHood = em.find(Neighborhood.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		nHood= null;
	}

	@Test
	void test_Neighborhood_mappings() {
		assertNotNull(nHood);
		assertEquals("Rolling Meadows", nHood.getName());
	}
	
	@Test
	void test_neighborhood_event_map() {
		assertNotNull(nHood);
		assertFalse(nHood.getnEvents().isEmpty());
	}
	
	@Test
	void test_Neighborhood_Post_Mappings() {
		assertNotNull(nHood);
		assertNotNull(nHood.getPosts());
		assertFalse(nHood.getPosts().isEmpty());
	}

}


