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

class PersonOfInterestTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private PersonOfInterest personOfInterest;

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
		personOfInterest = em.find(PersonOfInterest.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		personOfInterest = null;
	}

	@Test
	void test_POI_mapping() {
		assertNotNull(personOfInterest);
		assertEquals('P', personOfInterest.getDescription().charAt(0));
		
	}
	
	@Test
	
	void test_reportID_mapping() {
		assertNotNull(personOfInterest.getReport());
		assertEquals(1, personOfInterest.getReport().getUser().getId());
	}
	

	

}
