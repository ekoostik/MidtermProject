package com.skilldistillery.vigilance.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class PetTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Pet pet;

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
		pet = em.find(Pet.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		pet = null;
	}
	
	@Test
	void test_Pet_Mappings_To_DB() {
		assertNotNull(pet);
		assertNotNull(pet.getBreed());
		assertEquals("Doberman", pet.getBreed());
	}
	
	@Test
	void test_household_map() {
		assertNotNull(pet.getHouseHold());
		assertEquals(1, pet.getHouseHold().getId());
	}

		

}
