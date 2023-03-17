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

class VehicleTypeTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private VehicleType vehicleType;

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
		vehicleType = em.find(VehicleType.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		vehicleType = null;
	}
	
	@Test
	void vehicleType_Test_Mappings_Name() {
		assertNotNull(vehicleType);
		assertNotNull(vehicleType.getName());
		assertEquals("Compact", vehicleType.getName());
	}
	


}
