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

public class HouseHoldTest {

	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private HouseHold houseHold;
	
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
		houseHold = em.find(HouseHold.class, 2);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		houseHold= null;
	}

	@Test
	void test_HouseHold_mappings() {
		assertNotNull(houseHold);
		assertEquals(5, houseHold.getOccupants());
	}
	@Test
	void test_pet_map() {
		assertNotNull(houseHold);
		assertFalse(houseHold.getPets().isEmpty());
	}
	@Test
	void test_user_map() {
		assertNotNull(houseHold.getUsers());
		assertFalse(houseHold.getUsers().isEmpty());
	}
	@Test
	void test_address_map() {
		assertNotNull(houseHold.getAddress());
		assertEquals("Lowell", houseHold.getAddress().getCity());
	}
	@Test
	void test_vehicle_map(){
		houseHold=em.find(HouseHold.class, 1);
		assertNotNull(houseHold.getVehicles() );
		assertFalse(houseHold.getVehicles().isEmpty());
	}
	
	@Test
	void test_HouseHold_Address_Mappings() {
		houseHold = em.find(HouseHold.class, 1);
		assertNotNull(houseHold);
		assertNotNull(houseHold.getAddress());
		assertEquals("123 Seasme St",houseHold.getAddress().getAddress1());
	}

}


